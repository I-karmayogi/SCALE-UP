"use client";

import { useEffect, useState, useCallback } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { useAuth } from "@/context/AuthContext";
import { createClient } from "@/lib/supabase";
import { TopicWithProgress, Topic, Problem, UserStreak, ProblemWithProgress } from "@/types";
import { Button } from "@/components/ui/Button";
import { ProgressBar } from "@/components/ui/ProgressBar";
import { StreakIndicator } from "@/components/dashboard/StreakIndicator";
import { DailyRevision } from "@/components/dashboard/DailyRevision";
import { Code2, LogOut, Trophy, Target, Zap, BookOpen } from "lucide-react";

export default function HomePage() {
  const { user, loading: authLoading, signOut } = useAuth();
  const router = useRouter();
  const supabase = createClient();
  
  const [topics, setTopics] = useState<TopicWithProgress[]>([]);
  const [loading, setLoading] = useState(true);
  const [overallProgress, setOverallProgress] = useState({ completed: 0, total: 0 });
  const [streak, setStreak] = useState<UserStreak | null>(null);
  const [dailyRevisionProblem, setDailyRevisionProblem] = useState<Problem | null>(null);
  const [revisionLoading, setRevisionLoading] = useState(true);
  const [isReviewedToday, setIsReviewedToday] = useState(false);

  useEffect(() => {
    if (!authLoading && !user) {
      router.push("/login");
    }
  }, [user, authLoading, router]);

  useEffect(() => {
    if (user) {
      fetchTopics();
      fetchStreak();
      fetchDailyRevision();
    }
  }, [user]);

  const fetchTopics = async () => {
    try {
      const { data: topicsData, error: topicsError } = await supabase
        .from("topics")
        .select("*")
        .order("order_index");

      if (topicsError) throw topicsError;

      const { data: progressData, error: progressError } = await supabase
        .from("user_progress")
        .select("problem_id, completed")
        .eq("user_id", user?.id);

      if (progressError) throw progressError;

      const { data: problemsData, error: problemsError } = await supabase
        .from("problems")
        .select("id, topic_id");

      if (problemsError) throw problemsError;

      const completedProblems = new Set(
        progressData?.filter((p: { completed: boolean; problem_id: number }) => p.completed).map((p: { problem_id: number }) => p.problem_id) || []
      );

      const problemsByTopic = problemsData?.reduce((acc: Record<number, number>, p: { topic_id: number }) => {
        acc[p.topic_id] = (acc[p.topic_id] || 0) + 1;
        return acc;
      }, {} as Record<number, number>) || {};

      const completedByTopic = problemsData?.reduce((acc: Record<number, number>, p: { id: number; topic_id: number }) => {
        if (completedProblems.has(p.id)) {
          acc[p.topic_id] = (acc[p.topic_id] || 0) + 1;
        }
        return acc;
      }, {} as Record<number, number>) || {};

      const topicsWithProgress: TopicWithProgress[] = (topicsData as Topic[] || []).map((topic: Topic) => ({
        ...topic,
        completed_count: completedByTopic[topic.id] || 0,
        total_count: problemsByTopic[topic.id] || 0,
      }));

      setTopics(topicsWithProgress);

      const total = (Object.values(problemsByTopic) as number[]).reduce((a, b) => a + b, 0);
      const completed = completedProblems.size;
      setOverallProgress({ total, completed });
    } catch (error) {
      console.error("Error fetching topics:", error);
    } finally {
      setLoading(false);
    }
  };

  const fetchStreak = async () => {
    try {
      const { data, error } = await supabase
        .from("user_streaks")
        .select("*")
        .eq("user_id", user?.id)
        .single();

      if (error && error.code !== "PGRST116") throw error;
      setStreak(data);
    } catch (error) {
      console.error("Error fetching streak:", error);
    }
  };

  const fetchDailyRevision = async () => {
    setRevisionLoading(true);
    try {
      const today = new Date().toISOString().split("T")[0];

      const { data: progressData, error: progressError } = await supabase
        .from("user_progress")
        .select("problem_id, completed")
        .eq("user_id", user?.id)
        .eq("completed", true);

      if (progressError) throw progressError;
      if (!progressData || progressData.length === 0) {
        setRevisionLoading(false);
        return;
      }

      const completedProblemIds = progressData.map((p: { problem_id: number }) => p.problem_id);

      const { data: revisionData, error: revisionError } = await supabase
        .from("revision_queue")
        .select("problem_id, last_reviewed")
        .eq("user_id", user?.id)
        .lte("next_revision_date", today)
        .in("problem_id", completedProblemIds);

      if (revisionError) throw revisionError;

      let problemId: number | null = null;

      if (revisionData && revisionData.length > 0) {
        const unreviewed = revisionData.filter((r: { last_reviewed: string | null }) => !r.last_reviewed);
        if (unreviewed.length > 0) {
          problemId = unreviewed[Math.floor(Math.random() * unreviewed.length)].problem_id;
        } else {
          problemId = revisionData[Math.floor(Math.random() * revisionData.length)].problem_id;
        }
      }

      if (!problemId && completedProblemIds.length > 0) {
        const { data: existingQueue } = await supabase
          .from("revision_queue")
          .select("problem_id")
          .eq("user_id", user?.id);

        const queuedIds = existingQueue?.map((q: { problem_id: number }) => q.problem_id) || [];
        const unqueued = completedProblemIds.filter((id: number) => !queuedIds.includes(id));

        if (unqueued.length > 0) {
          problemId = unqueued[Math.floor(Math.random() * unqueued.length)];
        } else {
          problemId = completedProblemIds[Math.floor(Math.random() * completedProblemIds.length)];
        }
      }

      if (problemId) {
        const { data: problemData, error: problemError } = await supabase
          .from("problems")
          .select("*")
          .eq("id", problemId)
          .single();

        if (problemError) throw problemError;
        setDailyRevisionProblem(problemData);

        const { data: todayRevision } = await supabase
          .from("revision_queue")
          .select("last_reviewed")
          .eq("user_id", user?.id)
          .eq("problem_id", problemId)
          .gte("last_reviewed", today)
          .single();

        setIsReviewedToday(!!todayRevision);
      }
    } catch (error) {
      console.error("Error fetching daily revision:", error);
    } finally {
      setRevisionLoading(false);
    }
  };

  const updateStreak = async () => {
    try {
      const today = new Date().toISOString().split("T")[0];

      const { data: existingStreak } = await supabase
        .from("user_streaks")
        .select("*")
        .eq("user_id", user?.id)
        .single();

      if (existingStreak) {
        const lastDate = existingStreak.last_active_date;
        let newStreak = existingStreak.current_streak;

        if (lastDate !== today) {
          const yesterday = new Date();
          yesterday.setDate(yesterday.getDate() - 1);
          const yesterdayStr = yesterday.toISOString().split("T")[0];

          if (lastDate === yesterdayStr) {
            newStreak += 1;
          } else if (lastDate !== today) {
            newStreak = 1;
          }

          const longestStreak = Math.max(newStreak, existingStreak.longest_streak);

          await supabase
            .from("user_streaks")
            .update({
              current_streak: newStreak,
              longest_streak: longestStreak,
              last_active_date: today,
            })
            .eq("user_id", user?.id);
        }
      } else {
        await supabase
          .from("user_streaks")
          .insert({
            user_id: user?.id,
            current_streak: 1,
            longest_streak: 1,
            last_active_date: today,
          });
      }

      fetchStreak();
    } catch (error) {
      console.error("Error updating streak:", error);
    }
  };

  const handleMarkReviewed = async () => {
    if (!user || !dailyRevisionProblem) return;

    try {
      const today = new Date().toISOString().split("T")[0];
      const nextDate = new Date();
      nextDate.setDate(nextDate.getDate() + 1);
      const nextDateStr = nextDate.toISOString().split("T")[0];

      await supabase
        .from("revision_queue")
        .upsert({
          user_id: user.id,
          problem_id: dailyRevisionProblem.id,
          next_revision_date: nextDateStr,
          last_reviewed: new Date().toISOString(),
        }, {
          onConflict: 'user_id,problem_id'
        });

      setIsReviewedToday(true);
      updateStreak();
    } catch (error) {
      console.error("Error marking as reviewed:", error);
    }
  };

  const handleRefreshRevision = () => {
    fetchDailyRevision();
  };

  const handleSignOut = async () => {
    await signOut();
    router.push("/login");
  };

  const allTopics = topics;
  const completedCount = allTopics.filter(t => t.completed_count === t.total_count && t.total_count > 0).length;

  if (authLoading || loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-background">
        <div className="animate-pulse flex flex-col items-center gap-4">
          <div className="w-16 h-16 bg-card rounded-2xl" />
          <div className="h-4 w-32 bg-card rounded" />
        </div>
      </div>
    );
  }

  if (!user) return null;

  return (
    <div className="min-h-screen bg-background">
      {/* Hero Section */}
      <div className="relative overflow-hidden bg-gradient-to-br from-card via-card to-secondary/5 border-b border-border">
        <div className="absolute inset-0 overflow-hidden">
          <div className="absolute -top-40 -right-40 w-80 h-80 bg-secondary/10 rounded-full blur-3xl" />
          <div className="absolute -bottom-40 -left-40 w-80 h-80 bg-primary/10 rounded-full blur-3xl" />
        </div>
        
        <header className="relative z-10 border-b border-border/50">
          <div className="max-w-5xl mx-auto px-4 py-4 flex items-center justify-between">
            <Link href="/" className="flex items-center gap-3">
              <div className="w-10 h-10 bg-gradient-to-br from-secondary to-primary rounded-xl flex items-center justify-center">
                <Code2 className="w-5 h-5 text-white" />
              </div>
              <span className="font-bold text-xl text-text-primary">DSA Ladder</span>
            </Link>
            <div className="flex items-center gap-4">
              <div className="hidden sm:flex items-center gap-2 px-3 py-1.5 bg-background/50 rounded-lg border border-border">
                <Trophy className="w-4 h-4 text-warning" />
                <span className="text-sm font-mono text-text-primary">
                  {overallProgress.completed} / {overallProgress.total}
                </span>
              </div>
              <Button variant="ghost" size="sm" onClick={handleSignOut}>
                <LogOut className="w-4 h-4" />
              </Button>
            </div>
          </div>
        </header>

        <div className="relative z-10 max-w-5xl mx-auto px-4 py-12">
          <h1 className="text-4xl md:text-5xl font-bold text-text-primary mb-4">
            Master <span className="text-transparent bg-clip-text bg-gradient-to-r from-primary to-secondary">DSA</span>
          </h1>
          <p className="text-xl text-text-secondary max-w-2xl mb-8">
            Your personalized roadmap to ace technical interviews. Track progress, solve problems, and build consistency.
          </p>
          
          {/* Stats Row */}
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div className="bg-background/50 backdrop-blur-sm border border-border rounded-xl p-4">
              <div className="flex items-center gap-2 mb-1">
                <Trophy className="w-4 h-4 text-warning" />
                <span className="text-xs text-text-secondary">Solved</span>
              </div>
              <p className="text-2xl font-bold text-text-primary">{overallProgress.completed}</p>
            </div>
            <div className="bg-background/50 backdrop-blur-sm border border-border rounded-xl p-4">
              <div className="flex items-center gap-2 mb-1">
                <Target className="w-4 h-4 text-primary" />
                <span className="text-xs text-text-secondary">Topics</span>
              </div>
              <p className="text-2xl font-bold text-text-primary">{allTopics.length}</p>
            </div>
            <div className="bg-background/50 backdrop-blur-sm border border-border rounded-xl p-4">
              <div className="flex items-center gap-2 mb-1">
                <Zap className="w-4 h-4 text-secondary" />
                <span className="text-xs text-text-secondary">Streak</span>
              </div>
              <p className="text-2xl font-bold text-text-primary">{streak?.current_streak || 0} days</p>
            </div>
            <div className="bg-background/50 backdrop-blur-sm border border-border rounded-xl p-4">
              <div className="flex items-center gap-2 mb-1">
                <BookOpen className="w-4 h-4 text-primary" />
                <span className="text-xs text-text-secondary">Mastered</span>
              </div>
              <p className="text-2xl font-bold text-text-primary">{completedCount}</p>
            </div>
          </div>
        </div>
      </div>

      <main className="max-w-5xl mx-auto px-4 py-8">
        {/* Daily Section */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-8">
          <StreakIndicator streak={streak} />
          
          <DailyRevision
            problem={dailyRevisionProblem}
            loading={revisionLoading}
            onRefresh={handleRefreshRevision}
            onMarkReviewed={handleMarkReviewed}
            isReviewedToday={isReviewedToday}
          />
        </div>

        {/* Progress Section */}
        <div className="mb-10">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-xl font-semibold text-text-primary">Overall Progress</h2>
            <span className="text-sm text-text-secondary">
              {Math.round((overallProgress.completed / overallProgress.total) * 100) || 0}% Complete
            </span>
          </div>
          <div className="h-3 bg-card rounded-full overflow-hidden border border-border">
            <div 
              className="h-full bg-gradient-to-r from-primary via-primary to-secondary rounded-full transition-all duration-1000"
              style={{ width: `${overallProgress.total > 0 ? (overallProgress.completed / overallProgress.total) * 100 : 0}%` }}
            />
          </div>
        </div>

        {/* Roadmap Section */}
        <div className="mb-6">
          <h2 className="text-xl font-semibold text-text-primary mb-4">Your Learning Roadmap</h2>
        </div>

        <div className="relative">
          <div className="absolute left-8 top-0 bottom-0 w-0.5 bg-gradient-to-b from-primary via-secondary to-primary/30 hidden sm:block" />

          <div className="space-y-3">
            {allTopics.map((topic, index) => (
              <div key={topic.id} className="relative sm:pl-20 group">
                <div className="hidden sm:flex absolute left-6 top-1/2 -translate-y-1/2 w-5 h-5 rounded-full bg-background border-2 border-border z-10 group-hover:border-primary/50 transition-colors">
                  {topic.completed_count === topic.total_count && topic.total_count > 0 && (
                    <div className="absolute inset-0.5 rounded-full bg-gradient-to-r from-primary to-secondary" />
                  )}
                </div>
                <Link href={`/topic/${topic.id}`}>
                  <div className="bg-card border border-border rounded-xl p-5 hover:border-primary/30 hover:bg-card-hover transition-all duration-300 hover:shadow-lg hover:shadow-primary/5 group">
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-4">
                        <div className={`w-10 h-10 rounded-lg flex items-center justify-center text-lg font-bold ${
                          topic.completed_count === topic.total_count && topic.total_count > 0
                            ? 'bg-gradient-to-br from-primary to-secondary text-white'
                            : 'bg-background text-text-secondary'
                        }`}>
                          {index + 1}
                        </div>
                        <div>
                          <h3 className="font-semibold text-text-primary group-hover:text-primary transition-colors">
                            {topic.title}
                          </h3>
                          <p className="text-sm text-text-secondary">
                            {topic.completed_count} / {topic.total_count} problems
                          </p>
                        </div>
                      </div>
                      
                      <div className="flex items-center gap-3">
                        <div className="w-24 h-2 bg-background rounded-full overflow-hidden">
                          <div 
                            className={`h-full rounded-full transition-all ${
                              topic.completed_count === topic.total_count && topic.total_count > 0
                                ? 'bg-gradient-to-r from-primary to-secondary'
                                : 'bg-primary/50'
                            }`}
                            style={{ width: `${topic.total_count > 0 ? (topic.completed_count / topic.total_count) * 100 : 0}%` }}
                          />
                        </div>
                        <span className="text-sm font-mono text-text-secondary min-w-[40px] text-right">
                          {topic.total_count > 0 ? Math.round((topic.completed_count / topic.total_count) * 100) : 0}%
                        </span>
                      </div>
                    </div>
                  </div>
                </Link>
              </div>
            ))}
          </div>
        </div>
      </main>
    </div>
  );
}

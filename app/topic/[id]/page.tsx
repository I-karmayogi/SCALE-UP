"use client";

import { useEffect, useState, useCallback } from "react";
import { useRouter, useParams } from "next/navigation";
import Link from "next/link";
import { useAuth } from "@/context/AuthContext";
import { createClient } from "@/lib/supabase";
import { Topic, ProblemWithProgress, Problem, SupportedLanguage } from "@/types";
import { ProblemCard } from "@/components/problems/ProblemCard";
import { NotesPanel } from "@/components/notes/NotesPanel";
import { Button } from "@/components/ui/Button";
import { ProgressBar } from "@/components/ui/ProgressBar";
import { ArrowLeft, Code2, Search, Filter, FileText } from "lucide-react";

type DifficultyFilter = "All" | "Easy" | "Medium" | "Hard";

export default function TopicPage() {
  const { user, loading: authLoading } = useAuth();
  const router = useRouter();
  const params = useParams();
  const supabase = createClient();
  const topicId = Number(params.id);

  const [topic, setTopic] = useState<Topic | null>(null);
  const [problems, setProblems] = useState<ProblemWithProgress[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");
  const [filter, setFilter] = useState<DifficultyFilter>("All");
  const [showFilters, setShowFilters] = useState(false);

  const [notesPanelOpen, setNotesPanelOpen] = useState(false);
  const [selectedProblem, setSelectedProblem] = useState<ProblemWithProgress | null>(null);

  useEffect(() => {
    if (!authLoading && !user) {
      router.push("/login");
    }
  }, [user, authLoading, router]);

  useEffect(() => {
    if (user && topicId) {
      fetchTopic();
      fetchProblems();
    }
  }, [user, topicId]);

  const fetchTopic = async () => {
    try {
      const { data, error } = await supabase
        .from("topics")
        .select("*")
        .eq("id", topicId)
        .single();

      if (error) throw error;
      setTopic(data);
    } catch (error) {
      console.error("Error fetching topic:", error);
    }
  };

  const fetchProblems = async () => {
    try {
      const { data: problemsData, error: problemsError } = await supabase
        .from("problems")
        .select("*")
        .eq("topic_id", topicId)
        .order("difficulty", { ascending: true })
        .order("leetcode_number", { ascending: true });

      if (problemsError) throw problemsError;

      const { data: progressData, error: progressError } = await supabase
        .from("user_progress")
        .select("problem_id, completed")
        .eq("user_id", user?.id)
        .in(
          "problem_id",
          (problemsData || []).map((p: Problem) => p.id)
        );

      if (progressError) throw progressError;

      const { data: notesData, error: notesError } = await supabase
        .from("notes")
        .select("problem_id, note_text, language")
        .eq("user_id", user?.id)
        .in(
          "problem_id",
          (problemsData || []).map((p: Problem) => p.id)
        );

      if (notesError) throw notesError;

      const completedMap = new Map<number, boolean>(
        progressData?.map((p: { problem_id: number; completed: boolean }) => [p.problem_id, p.completed]) || []
      );
      const notesMap = new Map<number, { note_text: string; language: SupportedLanguage }>(
        notesData?.map((n: { problem_id: number; note_text: string; language: SupportedLanguage }) => [n.problem_id, { note_text: n.note_text, language: n.language }]) || []
      );

      const problemsWithProgress: ProblemWithProgress[] = (problemsData || []).map(
        (problem: Problem) => {
          const noteData = notesMap.get(problem.id);
          return {
            ...problem,
            completed: completedMap.get(problem.id) || false,
            note: noteData?.note_text,
            language: noteData?.language || "javascript",
          };
        }
      );

      setProblems(problemsWithProgress);
    } catch (error) {
      console.error("Error fetching problems:", error);
    } finally {
      setLoading(false);
    }
  };

  const handleToggleComplete = useCallback(
    async (problemId: number, completed: boolean) => {
      if (!user) return;

      try {
        if (completed) {
          await supabase.from("user_progress").upsert({
            user_id: user.id,
            problem_id: problemId,
            completed: true,
            completed_at: new Date().toISOString(),
          });
        } else {
          await supabase
            .from("user_progress")
            .delete()
            .eq("user_id", user.id)
            .eq("problem_id", problemId);
        }

        setProblems((prev) =>
          prev.map((p) =>
            p.id === problemId ? { ...p, completed } : p
          )
        );
      } catch (error) {
        console.error("Error toggling completion:", error);
      }
    },
    [user, supabase]
  );

  const handleSaveNote = useCallback(
    async (problemId: number, noteText: string, language: SupportedLanguage) => {
      if (!user) return;

      try {
        await supabase.from("notes").upsert({
          user_id: user.id,
          problem_id: problemId,
          note_text: noteText,
          language: language,
          updated_at: new Date().toISOString(),
        });

        setProblems((prev) =>
          prev.map((p) =>
            p.id === problemId ? { ...p, note: noteText, language } : p
          )
        );
        setSelectedProblem((prev) =>
          prev?.id === problemId ? { ...prev, note: noteText, language } : prev
        );
      } catch (error) {
        console.error("Error saving note:", error);
      }
    },
    [user, supabase]
  );

  const handleOpenNotes = (problem: ProblemWithProgress) => {
    setSelectedProblem(problem);
    setNotesPanelOpen(true);
  };

  const filteredProblems = problems.filter((problem) => {
    const matchesSearch = problem.title.toLowerCase().includes(search.toLowerCase());
    const matchesFilter = filter === "All" || problem.difficulty === filter;
    return matchesSearch && matchesFilter;
  });

  const completedCount = problems.filter((p) => p.completed).length;
  const difficultyCounts = {
    Easy: problems.filter((p) => p.difficulty === "Easy").length,
    Medium: problems.filter((p) => p.difficulty === "Medium").length,
    Hard: problems.filter((p) => p.difficulty === "Hard").length,
  };

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

  if (!user || !topic) return null;

  return (
    <div className="min-h-screen bg-background">
      <header className="border-b border-border bg-card/50 backdrop-blur-sm sticky top-0 z-20">
        <div className="max-w-4xl mx-auto px-4 py-4">
          <div className="flex items-center gap-4">
            <Link href="/">
              <Button variant="ghost" size="sm">
                <ArrowLeft className="w-4 h-4" />
              </Button>
            </Link>
            <div className="flex-1">
              <h1 className="text-xl font-bold text-text-primary">{topic.title}</h1>
              <p className="text-sm text-text-secondary">
                {completedCount} / {problems.length} completed
              </p>
            </div>
            <Link href={`/topic/${topicId}/notes`}>
              <Button variant="secondary" size="sm" className="gap-2">
                <FileText className="w-4 h-4" />
                <span className="hidden sm:inline">Concept Notes</span>
              </Button>
            </Link>
          </div>
          <div className="mt-3">
            <ProgressBar value={completedCount} max={problems.length} />
          </div>
        </div>
      </header>

      <main className="max-w-4xl mx-auto px-4 py-6">
        <div className="flex flex-col sm:flex-row gap-4 mb-6">
          <div className="relative flex-1">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-text-secondary" />
            <input
              type="text"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              placeholder="Search problems..."
              className="w-full bg-card border border-border rounded-lg py-2.5 pl-10 pr-4 text-sm text-text-primary placeholder:text-text-secondary/50 focus:outline-none focus:ring-2 focus:ring-secondary focus:border-transparent"
            />
          </div>
          <Button
            variant="secondary"
            className="sm:hidden gap-2"
            onClick={() => setShowFilters(!showFilters)}
          >
            <Filter className="w-4 h-4" />
            Filter
          </Button>
          <div
            className={`flex gap-2 ${
              showFilters ? "flex" : "hidden sm:flex"
            }`}
          >
            {(["All", "Easy", "Medium", "Hard"] as DifficultyFilter[]).map((f) => (
              <Button
                key={f}
                variant={filter === f ? "primary" : "ghost"}
                size="sm"
                onClick={() => setFilter(f)}
              >
                {f}
                {f !== "All" && (
                  <span className="ml-1.5 opacity-60">
                    ({difficultyCounts[f as keyof typeof difficultyCounts]})
                  </span>
                )}
              </Button>
            ))}
          </div>
        </div>

        <div className="space-y-3">
          {filteredProblems.map((problem) => (
            <ProblemCard
              key={problem.id}
              problem={problem}
              onToggleComplete={handleToggleComplete}
              onOpenNotes={handleOpenNotes}
            />
          ))}
        </div>

        {filteredProblems.length === 0 && (
          <div className="text-center py-12">
            <Code2 className="w-12 h-12 text-text-secondary/30 mx-auto mb-4" />
            <p className="text-text-secondary">No problems found</p>
          </div>
        )}
      </main>

      <NotesPanel
        problem={selectedProblem}
        isOpen={notesPanelOpen}
        onClose={() => setNotesPanelOpen(false)}
        onSave={handleSaveNote}
      />
    </div>
  );
}

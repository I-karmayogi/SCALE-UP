"use client";

import { Problem } from "@/types";
import { Button } from "@/components/ui/Button";
import { DifficultyTag } from "@/components/ui/DifficultyTag";
import { RefreshCw, ExternalLink, CheckCircle, BookOpen } from "lucide-react";
import { cn } from "@/lib/utils";

interface DailyRevisionProps {
  problem: Problem | null;
  loading: boolean;
  onRefresh: () => void;
  onMarkReviewed: () => void;
  isReviewedToday: boolean;
  className?: string;
}

export function DailyRevision({
  problem,
  loading,
  onRefresh,
  onMarkReviewed,
  isReviewedToday,
  className,
}: DailyRevisionProps) {
  if (loading) {
    return (
      <div
        className={cn(
          "p-5 bg-card border border-border rounded-xl animate-pulse",
          className
        )}
      >
        <div className="flex items-center gap-3 mb-4">
          <div className="w-10 h-10 bg-background rounded-lg" />
          <div>
            <div className="h-4 w-24 bg-background rounded mb-1" />
            <div className="h-3 w-16 bg-background rounded" />
          </div>
        </div>
        <div className="h-10 bg-background rounded-lg" />
      </div>
    );
  }

  if (!problem) {
    return (
      <div
        className={cn(
          "p-5 bg-card border border-border rounded-xl",
          className
        )}
      >
        <div className="flex items-center gap-3 mb-4">
          <div className="w-10 h-10 bg-secondary/10 rounded-lg flex items-center justify-center">
            <BookOpen className="w-5 h-5 text-secondary" />
          </div>
          <div>
            <h3 className="font-semibold text-text-primary">Daily Revision</h3>
            <p className="text-xs text-text-secondary">Review your completed problems</p>
          </div>
        </div>
        <p className="text-sm text-text-secondary">
          Complete some problems to see your daily revision!
        </p>
      </div>
    );
  }

  return (
    <div
      className={cn(
        "p-5 bg-card border rounded-xl",
        isReviewedToday ? "border-primary/30 bg-primary/5" : "border-border",
        className
      )}
    >
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center gap-3">
          <div className={cn(
            "w-10 h-10 rounded-lg flex items-center justify-center",
            isReviewedToday ? "bg-primary/20" : "bg-secondary/10"
          )}>
            {isReviewedToday ? (
              <CheckCircle className="w-5 h-5 text-primary" />
            ) : (
              <BookOpen className="w-5 h-5 text-secondary" />
            )}
          </div>
          <div>
            <h3 className="font-semibold text-text-primary">Daily Revision</h3>
            <p className="text-xs text-text-secondary">
              {isReviewedToday ? "Great job!" : "Review this problem"}
            </p>
          </div>
        </div>
        <Button
          variant="ghost"
          size="sm"
          onClick={onRefresh}
          title="Get another problem"
          className="text-text-secondary hover:text-text-primary"
        >
          <RefreshCw className="w-4 h-4" />
        </Button>
      </div>

      <div className="mb-4">
        <h4 className="font-medium text-text-primary mb-2 line-clamp-1">
          {problem.title}
        </h4>
        <DifficultyTag difficulty={problem.difficulty} />
      </div>

      <div className="flex items-center gap-2">
        {problem.link && (
          <Button
            variant="secondary"
            size="sm"
            className="gap-1.5 flex-1"
            onClick={() => window.open(problem.link!, "_blank")}
          >
            <ExternalLink className="w-3.5 h-3.5" />
            Solve
          </Button>
        )}
        
        {isReviewedToday ? (
          <Button
            variant="ghost"
            size="sm"
            className="gap-1.5 text-primary"
            disabled
          >
            <CheckCircle className="w-3.5 h-3.5" />
            Done
          </Button>
        ) : (
          <Button
            variant="primary"
            size="sm"
            className="gap-1.5 flex-1"
            onClick={onMarkReviewed}
          >
            <CheckCircle className="w-3.5 h-3.5" />
            Mark Done
          </Button>
        )}
      </div>
    </div>
  );
}

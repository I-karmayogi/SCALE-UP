"use client";

import { ProblemWithProgress } from "@/types";
import { DifficultyTag } from "@/components/ui/DifficultyTag";
import { Checkbox } from "@/components/ui/Checkbox";
import { Button } from "@/components/ui/Button";
import { ExternalLink, FileText } from "lucide-react";
import { cn } from "@/lib/utils";

interface ProblemCardProps {
  problem: ProblemWithProgress;
  onToggleComplete: (id: number, completed: boolean) => void;
  onOpenNotes: (problem: ProblemWithProgress) => void;
}

export function ProblemCard({ problem, onToggleComplete, onOpenNotes }: ProblemCardProps) {
  return (
    <div
      className={cn(
        "flex items-center gap-4 p-4 bg-card border border-border rounded-lg transition-all duration-200 hover:bg-card-hover group",
        problem.completed && "border-l-4 border-l-primary"
      )}
    >
      <Checkbox
        checked={problem.completed}
        onChange={(checked) => onToggleComplete(problem.id, checked)}
      />
      
      <div className="flex-1 min-w-0">
        <h4
          className={cn(
            "font-medium text-text-primary truncate",
            problem.completed && "line-through text-text-secondary"
          )}
        >
          {problem.title}
        </h4>
        {problem.leetcode_number && (
          <span className="text-xs text-text-secondary font-mono">
            #{problem.leetcode_number}
          </span>
        )}
      </div>

      <DifficultyTag difficulty={problem.difficulty} />

      <div className="flex items-center gap-2">
        {problem.link && (
          <Button
            variant="ghost"
            size="sm"
            onClick={() => window.open(problem.link!, "_blank")}
            title="Open problem"
          >
            <ExternalLink className="w-4 h-4" />
          </Button>
        )}
        
        <Button
          variant="ghost"
          size="sm"
          onClick={() => onOpenNotes(problem)}
          title="Add notes"
        >
          <FileText className={cn("w-4 h-4", problem.note && "text-primary")} />
        </Button>
      </div>
    </div>
  );
}

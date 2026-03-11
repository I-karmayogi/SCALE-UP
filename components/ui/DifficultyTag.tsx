import { cn } from "@/lib/utils";

interface DifficultyTagProps {
  difficulty: "Easy" | "Medium" | "Hard";
  className?: string;
}

export function DifficultyTag({ difficulty, className }: DifficultyTagProps) {
  return (
    <span
      className={cn(
        "inline-flex items-center px-2.5 py-1 rounded-full text-xs font-semibold",
        {
          "bg-primary/20 text-primary": difficulty === "Easy",
          "bg-warning/20 text-warning": difficulty === "Medium",
          "bg-danger/20 text-danger": difficulty === "Hard",
        },
        className
      )}
    >
      {difficulty}
    </span>
  );
}

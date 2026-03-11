import { cn } from "@/lib/utils";

interface ProgressBarProps {
  value: number;
  max?: number;
  className?: string;
  showLabel?: boolean;
}

export function ProgressBar({
  value,
  max = 100,
  className,
  showLabel = false,
}: ProgressBarProps) {
  const percentage = Math.min(Math.round((value / max) * 100), 100);

  return (
    <div className={cn("w-full", className)}>
      {showLabel && (
        <div className="flex justify-between items-center mb-2">
          <span className="text-sm text-text-secondary">Progress</span>
          <span className="text-sm font-mono text-primary">{percentage}%</span>
        </div>
      )}
      <div className="h-1.5 bg-border rounded-full overflow-hidden">
        <div
          className="h-full bg-gradient-to-r from-primary to-secondary rounded-full transition-all duration-500 ease-out"
          style={{ width: `${percentage}%` }}
        />
      </div>
    </div>
  );
}

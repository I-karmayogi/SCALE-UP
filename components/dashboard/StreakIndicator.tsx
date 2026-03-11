"use client";

import { UserStreak } from "@/types";
import { Flame, TrendingUp, Award } from "lucide-react";
import { cn } from "@/lib/utils";

interface StreakIndicatorProps {
  streak: UserStreak | null;
  className?: string;
}

export function StreakIndicator({ streak, className }: StreakIndicatorProps) {
  if (!streak || streak.current_streak === 0) {
    return (
      <div
        className={cn(
          "flex items-center gap-4 p-5 bg-card border border-border rounded-xl",
          className
        )}
      >
        <div className="w-12 h-12 bg-background rounded-xl flex items-center justify-center">
          <Flame className="w-6 h-6 text-text-secondary" />
        </div>
        <div>
          <p className="text-sm text-text-secondary">Start your streak!</p>
          <p className="text-lg font-semibold text-text-primary">Complete problems daily</p>
        </div>
      </div>
    );
  }

  const isOnFire = streak.current_streak >= 3;
  const isNewRecord = streak.current_streak === streak.longest_streak && streak.current_streak > 1;

  return (
    <div
      className={cn(
        "flex items-center gap-4 p-5 rounded-xl border",
        isOnFire
          ? "bg-gradient-to-r from-warning/10 to-danger/10 border-warning/30"
          : "bg-card border-border",
        className
      )}
    >
      <div className={cn(
        "w-12 h-12 rounded-xl flex items-center justify-center",
        isOnFire ? "bg-gradient-to-br from-warning to-danger animate-pulse" : "bg-primary/20"
      )}>
        <Flame className={cn("w-6 h-6", isOnFire ? "text-white" : "text-primary")} />
      </div>
      <div className="flex-1">
        <div className="flex items-center gap-2">
          <p className={cn(
            "text-2xl font-bold",
            isOnFire ? "text-warning" : "text-text-primary"
          )}>
            {streak.current_streak} Day{streak.current_streak !== 1 ? "s" : ""} Streak
          </p>
          {isNewRecord && (
            <Award className="w-5 h-5 text-warning" />
          )}
        </div>
        <p className="text-sm text-text-secondary">
          Best: {streak.longest_streak} days
        </p>
      </div>
      {isOnFire && (
        <TrendingUp className="w-6 h-6 text-warning" />
      )}
    </div>
  );
}

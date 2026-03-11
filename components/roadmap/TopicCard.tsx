"use client";

import Link from "next/link";
import { Card } from "@/components/ui/Card";
import { ProgressBar } from "@/components/ui/ProgressBar";
import { TopicWithProgress } from "@/types";
import { ChevronRight } from "lucide-react";

interface TopicCardProps {
  topic: TopicWithProgress;
}

export function TopicCard({ topic }: TopicCardProps) {
  const percentage = topic.total_count > 0 
    ? Math.round((topic.completed_count / topic.total_count) * 100) 
    : 0;

  return (
    <Link href={`/topic/${topic.id}`}>
      <Card hover className="relative group">
        <div className="flex items-start justify-between">
          <div className="flex-1">
            <h3 className="text-lg font-semibold text-text-primary group-hover:text-primary transition-colors">
              {topic.title}
            </h3>
            {topic.description && (
              <p className="text-sm text-text-secondary mt-1 line-clamp-2">
                {topic.description}
              </p>
            )}
            <div className="mt-4">
              <ProgressBar value={topic.completed_count} max={topic.total_count} />
              <p className="text-xs text-text-secondary mt-2 font-mono">
                {topic.completed_count} / {topic.total_count} completed
              </p>
            </div>
          </div>
          <ChevronRight className="w-5 h-5 text-text-secondary group-hover:text-primary transition-colors mt-1" />
        </div>
        
        {percentage === 100 && (
          <div className="absolute top-0 right-0 w-16 h-16 overflow-hidden">
            <div className="absolute top-2 right-[-20deg] w-10 h-[2px] bg-primary rotate-45 opacity-50" />
          </div>
        )}
      </Card>
    </Link>
  );
}

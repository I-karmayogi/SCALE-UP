export type SupportedLanguage = 'javascript' | 'python' | 'java' | 'cpp' | 'markdown';

export interface Topic {
  id: number;
  title: string;
  description: string | null;
  order_index: number;
}

export interface Problem {
  id: number;
  topic_id: number;
  title: string;
  difficulty: 'Easy' | 'Medium' | 'Hard';
  link: string | null;
  leetcode_number: number | null;
}

export interface UserProgress {
  id: number;
  user_id: string;
  problem_id: number;
  completed: boolean;
  completed_at: string | null;
}

export interface Note {
  id: number;
  user_id: string;
  problem_id: number;
  note_text: string;
  language: SupportedLanguage;
  updated_at: string;
}

export interface TopicNote {
  id: number;
  topic_id: number;
  user_id: string;
  note_text: string;
  language: SupportedLanguage;
  updated_at: string;
}

export interface UserStreak {
  id: number;
  user_id: string;
  current_streak: number;
  longest_streak: number;
  last_active_date: string | null;
}

export interface RevisionQueue {
  id: number;
  user_id: string;
  problem_id: number;
  next_revision_date: string;
  last_reviewed: string | null;
  review_count: number;
}

export interface TopicWithProgress extends Topic {
  completed_count: number;
  total_count: number;
}

export interface ProblemWithProgress extends Problem {
  completed: boolean;
  note?: string;
  language?: SupportedLanguage;
}

export interface DailyRevision {
  problem: Problem;
  difficulty: 'Easy' | 'Medium' | 'Hard';
}

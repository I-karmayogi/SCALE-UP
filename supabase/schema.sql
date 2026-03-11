-- Database Schema for DSA Ladder - Updated with new features

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Drop existing trigger if exists
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
DROP FUNCTION IF EXISTS public.handle_new_user();

-- Users table (extends Supabase auth.users)
CREATE TABLE IF NOT EXISTS public.users (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Topics table
CREATE TABLE IF NOT EXISTS public.topics (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  order_index INTEGER NOT NULL
);

-- Problems table
CREATE TABLE IF NOT EXISTS public.problems (
  id SERIAL PRIMARY KEY,
  topic_id INTEGER REFERENCES topics(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  difficulty TEXT CHECK (difficulty IN ('Easy', 'Medium', 'Hard')),
  link TEXT,
  leetcode_number INTEGER
);

-- User Progress table
CREATE TABLE IF NOT EXISTS public.user_progress (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  problem_id INTEGER REFERENCES problems(id) ON DELETE CASCADE,
  completed BOOLEAN DEFAULT FALSE,
  completed_at TIMESTAMP WITH TIME ZONE,
  UNIQUE(user_id, problem_id)
);

-- Notes table (updated with language field)
CREATE TABLE IF NOT EXISTS public.notes (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  problem_id INTEGER REFERENCES problems(id) ON DELETE CASCADE,
  note_text TEXT,
  language TEXT DEFAULT 'javascript',
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(user_id, problem_id)
);

-- Topic Notes table (new)
CREATE TABLE IF NOT EXISTS public.topic_notes (
  id SERIAL PRIMARY KEY,
  topic_id INTEGER REFERENCES topics(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  note_text TEXT,
  language TEXT DEFAULT 'markdown',
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(topic_id, user_id)
);

-- User Streaks table (new)
CREATE TABLE IF NOT EXISTS public.user_streaks (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE UNIQUE,
  current_streak INTEGER DEFAULT 0,
  longest_streak INTEGER DEFAULT 0,
  last_active_date DATE
);

-- Revision Queue table (new)
CREATE TABLE IF NOT EXISTS public.revision_queue (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  problem_id INTEGER REFERENCES problems(id) ON DELETE CASCADE,
  next_revision_date DATE,
  last_reviewed TIMESTAMP WITH TIME ZONE,
  review_count INTEGER DEFAULT 0,
  UNIQUE(user_id, problem_id)
);

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_problems_topic_id ON problems(topic_id);
CREATE INDEX IF NOT EXISTS idx_user_progress_user_id ON user_progress(user_id);
CREATE INDEX IF NOT EXISTS idx_user_progress_problem_id ON user_progress(problem_id);
CREATE INDEX IF NOT EXISTS idx_notes_user_id ON notes(user_id);
CREATE INDEX IF NOT EXISTS idx_notes_problem_id ON notes(problem_id);
CREATE INDEX IF NOT EXISTS idx_topic_notes_user_id ON topic_notes(user_id);
CREATE INDEX IF NOT EXISTS idx_topic_notes_topic_id ON topic_notes(topic_id);
CREATE INDEX IF NOT EXISTS idx_user_streaks_user_id ON user_streaks(user_id);
CREATE INDEX IF NOT EXISTS idx_revision_queue_user_id ON revision_queue(user_id);
CREATE INDEX IF NOT EXISTS idx_revision_queue_next_date ON revision_queue(next_revision_date);

-- Enable Row Level Security (RLS)
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.topics ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.problems ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.notes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.topic_notes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_streaks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.revision_queue ENABLE ROW LEVEL SECURITY;

-- RLS Policies for users table
DROP POLICY IF EXISTS "Users can view own data" ON public.users;
DROP POLICY IF EXISTS "Users can insert own data" ON public.users;

CREATE POLICY "Users can view own data" ON public.users
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can insert own data" ON public.users
  FOR INSERT WITH CHECK (auth.uid() = id);

-- RLS Policies for topics table (public read)
DROP POLICY IF EXISTS "Topics are viewable by everyone" ON public.topics;

CREATE POLICY "Topics are viewable by everyone" ON public.topics
  FOR SELECT USING (true);

-- RLS Policies for problems table (public read)
DROP POLICY IF EXISTS "Problems are viewable by everyone" ON public.problems;

CREATE POLICY "Problems are viewable by everyone" ON public.problems
  FOR SELECT USING (true);

-- RLS Policies for user_progress table
DROP POLICY IF EXISTS "Users can view own progress" ON public.user_progress;
DROP POLICY IF EXISTS "Users can insert own progress" ON public.user_progress;
DROP POLICY IF EXISTS "Users can update own progress" ON public.user_progress;
DROP POLICY IF EXISTS "Users can delete own progress" ON public.user_progress;

CREATE POLICY "Users can view own progress" ON public.user_progress
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own progress" ON public.user_progress
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own progress" ON public.user_progress
  FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own progress" ON public.user_progress
  FOR DELETE USING (auth.uid() = user_id);

-- RLS Policies for notes table
DROP POLICY IF EXISTS "Users can view own notes" ON public.notes;
DROP POLICY IF EXISTS "Users can insert own notes" ON public.notes;
DROP POLICY IF EXISTS "Users can update own notes" ON public.notes;
DROP POLICY IF EXISTS "Users can delete own notes" ON public.notes;

CREATE POLICY "Users can view own notes" ON public.notes
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own notes" ON public.notes
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own notes" ON public.notes
  FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own notes" ON public.notes
  FOR DELETE USING (auth.uid() = user_id);

-- RLS Policies for topic_notes table
DROP POLICY IF EXISTS "Users can view own topic notes" ON public.topic_notes;
DROP POLICY IF EXISTS "Users can insert own topic notes" ON public.topic_notes;
DROP POLICY IF EXISTS "Users can update own topic notes" ON public.topic_notes;
DROP POLICY IF EXISTS "Users can delete own topic notes" ON public.topic_notes;

CREATE POLICY "Users can view own topic notes" ON public.topic_notes
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own topic notes" ON public.topic_notes
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own topic notes" ON public.topic_notes
  FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own topic notes" ON public.topic_notes
  FOR DELETE USING (auth.uid() = user_id);

-- RLS Policies for user_streaks table
DROP POLICY IF EXISTS "Users can view own streaks" ON public.user_streaks;
DROP POLICY IF EXISTS "Users can insert own streaks" ON public.user_streaks;
DROP POLICY IF EXISTS "Users can update own streaks" ON public.user_streaks;

CREATE POLICY "Users can view own streaks" ON public.user_streaks
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own streaks" ON public.user_streaks
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own streaks" ON public.user_streaks
  FOR UPDATE USING (auth.uid() = user_id);

-- RLS Policies for revision_queue table
DROP POLICY IF EXISTS "Users can view own revision queue" ON public.revision_queue;
DROP POLICY IF EXISTS "Users can insert own revision queue" ON public.revision_queue;
DROP POLICY IF EXISTS "Users can update own revision queue" ON public.revision_queue;

CREATE POLICY "Users can view own revision queue" ON public.revision_queue
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own revision queue" ON public.revision_queue
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own revision queue" ON public.revision_queue
  FOR UPDATE USING (auth.uid() = user_id);

-- Function to create user record on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.users (id, email)
  VALUES (NEW.id, NEW.email);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger for new user signup
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Function to update streak
CREATE OR REPLACE FUNCTION public.update_streak(user_uuid UUID)
RETURNS VOID AS $$
DECLARE
  today_date DATE;
  last_date DATE;
  current_streak_val INTEGER;
  longest_streak_val INTEGER;
BEGIN
  today_date := CURRENT_DATE;
  
  SELECT last_active_date, current_streak, longest_streak
  INTO last_date, current_streak_val, longest_streak_val
  FROM public.user_streaks
  WHERE user_id = user_uuid;

  IF last_date IS NULL THEN
    INSERT INTO public.user_streaks (user_id, current_streak, longest_streak, last_active_date)
    VALUES (user_uuid, 1, 1, today_date);
  ELSIF last_date = today_date THEN
    NULL;
  ELSIF last_date = today_date - 1 THEN
    current_streak_val := current_streak_val + 1;
    longest_streak_val := GREATEST(longest_streak_val, current_streak_val);
    UPDATE public.user_streaks
    SET current_streak = current_streak_val,
        longest_streak = longest_streak_val,
        last_active_date = today_date
    WHERE user_id = user_uuid;
  ELSE
    UPDATE public.user_streaks
    SET current_streak = 1,
        last_active_date = today_date
    WHERE user_id = user_uuid;
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

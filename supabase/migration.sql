-- Migration Script for DSA Ladder - New Features
-- Run this in your Supabase SQL Editor to add new features

-- 1. Add language column to notes table (if not exists)
ALTER TABLE public.notes ADD COLUMN IF NOT EXISTS language TEXT DEFAULT 'javascript';

-- 2. Create topic_notes table (if not exists)
CREATE TABLE IF NOT EXISTS public.topic_notes (
  id SERIAL PRIMARY KEY,
  topic_id INTEGER REFERENCES topics(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  note_text TEXT,
  language TEXT DEFAULT 'markdown',
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(topic_id, user_id)
);

-- 3. Create user_streaks table (if not exists)
CREATE TABLE IF NOT EXISTS public.user_streaks (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE UNIQUE,
  current_streak INTEGER DEFAULT 0,
  longest_streak INTEGER DEFAULT 0,
  last_active_date DATE
);

-- 4. Create revision_queue table (if not exists)
CREATE TABLE IF NOT EXISTS public.revision_queue (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  problem_id INTEGER REFERENCES problems(id) ON DELETE CASCADE,
  next_revision_date DATE,
  last_reviewed TIMESTAMP WITH TIME ZONE,
  review_count INTEGER DEFAULT 0,
  UNIQUE(user_id, problem_id)
);

-- 5. Create indexes (if not exists)
CREATE INDEX IF NOT EXISTS idx_topic_notes_user_id ON topic_notes(user_id);
CREATE INDEX IF NOT EXISTS idx_topic_notes_topic_id ON topic_notes(topic_id);
CREATE INDEX IF NOT EXISTS idx_user_streaks_user_id ON user_streaks(user_id);
CREATE INDEX IF NOT EXISTS idx_revision_queue_user_id ON revision_queue(user_id);
CREATE INDEX IF NOT EXISTS idx_revision_queue_next_date ON revision_queue(next_revision_date);

-- 6. Enable RLS on new tables (if not already enabled)
ALTER TABLE public.topic_notes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_streaks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.revision_queue ENABLE ROW LEVEL SECURITY;

-- 7. RLS Policies for topic_notes
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

-- 8. RLS Policies for user_streaks
DROP POLICY IF EXISTS "Users can view own streaks" ON public.user_streaks;
DROP POLICY IF EXISTS "Users can insert own streaks" ON public.user_streaks;
DROP POLICY IF EXISTS "Users can update own streaks" ON public.user_streaks;

CREATE POLICY "Users can view own streaks" ON public.user_streaks
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own streaks" ON public.user_streaks
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own streaks" ON public.user_streaks
  FOR UPDATE USING (auth.uid() = user_id);

-- 9. RLS Policies for revision_queue
DROP POLICY IF EXISTS "Users can view own revision queue" ON public.revision_queue;
DROP POLICY IF EXISTS "Users can insert own revision queue" ON public.revision_queue;
DROP POLICY IF EXISTS "Users can update own revision queue" ON public.revision_queue;

CREATE POLICY "Users can view own revision queue" ON public.revision_queue
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own revision queue" ON public.revision_queue
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own revision queue" ON public.revision_queue
  FOR UPDATE USING (auth.uid() = user_id);

-- 10. Create streak update function
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

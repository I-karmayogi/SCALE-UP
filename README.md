# DSA Ladder

A roadmap-style learning interface for Data Structures and Algorithms interview preparation.

## Features

- **Authentication**: Email/password and Google OAuth via Supabase
- **Roadmap View**: Visual ladder showing 15 DSA topics
- **Progress Tracking**: Track completed problems per topic and overall
- **Problem Lists**: Filter by difficulty, search by title
- **Notes**: Personal notes for each problem
- **Responsive Design**: Works on desktop and mobile

## Tech Stack

- Next.js 14 (App Router)
- TypeScript
- TailwindCSS
- Supabase (Auth + Database)

## Setup

### 1. Create Supabase Project

1. Go to [supabase.com](https://supabase.com) and create a new project
2. Wait for the project to be ready

### 2. Configure Environment

Copy `.env.local` and add your Supabase credentials:

```bash
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
```

Get these from:
- **URL**: Settings > API > Project URL
- **Anon Key**: Settings > API > Project API keys > `anon` key

### 3. Set Up Database

Run the SQL scripts in `supabase/` in your Supabase SQL Editor:

1. First run `supabase/schema.sql` - Creates tables and RLS policies
2. Then run `supabase/seed.sql` - Populates topics and problems

### 4. Configure Authentication

In Supabase Dashboard:
1. Go to Authentication > Providers
2. Enable Email/Password
3. Enable Google (you'll need to configure OAuth credentials in Google Cloud Console)

### 5. Run the Application

```bash
cd dsa-ladder
npm run dev
```

Open [http://localhost:3000](http://localhost:3000)

## Project Structure

```
dsa-ladder/
├── app/                    # Next.js App Router pages
│   ├── page.tsx           # Homepage (roadmap)
│   ├── login/page.tsx     # Login page
│   └── topic/[id]/page.tsx # Topic page with problems
├── components/
│   ├── ui/               # Reusable UI components
│   ├── roadmap/          # Topic card component
│   ├── problems/         # Problem list/card
│   └── notes/            # Notes panel
├── context/              # React context (Auth)
├── lib/                  # Utilities & Supabase client
├── types/                # TypeScript types
├── supabase/             # SQL scripts
└── data/                 # Seed data JSON
```

## Future Enhancements

The codebase is structured to support:
- Streak tracking
- Daily challenge
- Spaced repetition
- Leaderboard
- And more!

## License

MIT
"# SCALE-UP" 

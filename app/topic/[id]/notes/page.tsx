"use client";

import { useEffect, useState, useCallback } from "react";
import { useRouter, useParams } from "next/navigation";
import Link from "next/link";
import { useAuth } from "@/context/AuthContext";
import { createClient } from "@/lib/supabase";
import { Topic, SupportedLanguage } from "@/types";
import { Button } from "@/components/ui/Button";
import { CodeEditor } from "@/components/editor/CodeEditor";
import { LanguageSelector } from "@/components/editor/LanguageSelector";
import { ArrowLeft, Save, FileText } from "lucide-react";

export default function TopicNotesPage() {
  const { user, loading: authLoading } = useAuth();
  const router = useRouter();
  const params = useParams();
  const supabase = createClient();
  const topicId = Number(params.id);

  const [topic, setTopic] = useState<Topic | null>(null);
  const [noteText, setNoteText] = useState("");
  const [language, setLanguage] = useState<SupportedLanguage>("markdown");
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [hasChanges, setHasChanges] = useState(false);
  const [lastSaved, setLastSaved] = useState<string | null>(null);

  useEffect(() => {
    if (!authLoading && !user) {
      router.push("/login");
    }
  }, [user, authLoading, router]);

  useEffect(() => {
    if (user && topicId) {
      fetchTopic();
      fetchTopicNotes();
    }
  }, [user, topicId]);

  const fetchTopic = async () => {
    try {
      const { data, error } = await supabase
        .from("topics")
        .select("*")
        .eq("id", topicId)
        .single();

      if (error) throw error;
      setTopic(data);
    } catch (error) {
      console.error("Error fetching topic:", error);
    }
  };

  const fetchTopicNotes = async () => {
    try {
      const { data, error } = await supabase
        .from("topic_notes")
        .select("note_text, language, updated_at")
        .eq("topic_id", topicId)
        .eq("user_id", user?.id)
        .single();

      if (error && error.code !== "PGRST116") throw error;
      
      if (data) {
        setNoteText(data.note_text || "");
        setLanguage(data.language || "markdown");
        setLastSaved(data.updated_at);
      } else {
        setNoteText(getDefaultNoteTemplate(topic?.title || ""));
        setLanguage("markdown");
      }
    } catch (error) {
      console.error("Error fetching topic notes:", error);
    } finally {
      setLoading(false);
    }
  };

  const getDefaultNoteTemplate = (topicTitle: string) => {
    return `# ${topicTitle} - Concept Notes

## Overview
Brief description of the topic...

## Key Patterns
- Pattern 1: 
- Pattern 2: 

## Algorithm/Approach
Step-by-step explanation...

## Template Code
\`\`\`javascript
// Your template here
\`\`\`

## Edge Cases
- 
- 

## Time Complexity
O()

## Space Complexity
O()

## Related Problems
- 
`;
  };

  const handleSave = useCallback(async () => {
    if (!user) return;
    setSaving(true);

    try {
      await supabase.from("topic_notes").upsert({
        topic_id: topicId,
        user_id: user.id,
        note_text: noteText,
        language: language,
        updated_at: new Date().toISOString(),
      });

      setHasChanges(false);
      setLastSaved(new Date().toISOString());
    } catch (error) {
      console.error("Error saving topic notes:", error);
    } finally {
      setSaving(false);
    }
  }, [user, topicId, noteText, language, supabase]);

  const handleNoteChange = (value: string) => {
    setNoteText(value);
    setHasChanges(true);
  };

  const handleLanguageChange = (lang: SupportedLanguage) => {
    setLanguage(lang);
    setHasChanges(true);
  };

  if (authLoading || loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-background">
        <div className="animate-pulse flex flex-col items-center gap-4">
          <div className="w-16 h-16 bg-card rounded-2xl" />
          <div className="h-4 w-32 bg-card rounded" />
        </div>
      </div>
    );
  }

  if (!user || !topic) return null;

  return (
    <div className="min-h-screen bg-background">
      <header className="border-b border-border bg-card/50 backdrop-blur-sm sticky top-0 z-20">
        <div className="max-w-5xl mx-auto px-4 py-4">
          <div className="flex items-center gap-4">
            <Link href={`/topic/${topicId}`}>
              <Button variant="ghost" size="sm">
                <ArrowLeft className="w-4 h-4" />
              </Button>
            </Link>
            <div className="flex items-center gap-3">
              <div className="w-10 h-10 bg-secondary/10 rounded-xl flex items-center justify-center">
                <FileText className="w-5 h-5 text-secondary" />
              </div>
              <div>
                <h1 className="text-xl font-bold text-text-primary">
                  {topic.title} - Notes
                </h1>
                <p className="text-xs text-text-secondary">
                  Concept notes and templates
                </p>
              </div>
            </div>
          </div>
        </div>
      </header>

      <main className="max-w-5xl mx-auto px-4 py-6">
        <div className="flex flex-col gap-4">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4">
              <LanguageSelector value={language} onChange={handleLanguageChange} />
              {lastSaved && (
                <span className="text-xs text-text-secondary">
                  Last saved: {new Date(lastSaved).toLocaleString()}
                </span>
              )}
            </div>
            <Button
              onClick={handleSave}
              disabled={!hasChanges || saving}
              className="gap-2"
            >
              <Save className="w-4 h-4" />
              {saving ? "Saving..." : "Save Notes"}
            </Button>
          </div>

          <CodeEditor
            value={noteText}
            onChange={handleNoteChange}
            language={language}
            height="calc(100vh - 250px)"
            placeholder={getDefaultNoteTemplate(topic.title)}
          />

          <div className="text-xs text-text-secondary">
            <p>Tip: Use Markdown for formatting. Supported languages for code blocks: JavaScript, Python, Java, C++</p>
          </div>
        </div>
      </main>
    </div>
  );
}

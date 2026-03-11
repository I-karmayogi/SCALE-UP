"use client";

import { useState, useEffect, useCallback } from "react";
import { ProblemWithProgress, SupportedLanguage } from "@/types";
import { Button } from "@/components/ui/Button";
import { CodeEditor } from "@/components/editor/CodeEditor";
import { LanguageSelector } from "@/components/editor/LanguageSelector";
import { X, Save } from "lucide-react";
import { cn } from "@/lib/utils";

interface NotesPanelProps {
  problem: ProblemWithProgress | null;
  isOpen: boolean;
  onClose: () => void;
  onSave: (problemId: number, noteText: string, language: SupportedLanguage) => void;
}

export function NotesPanel({ problem, isOpen, onClose, onSave }: NotesPanelProps) {
  const [noteText, setNoteText] = useState("");
  const [language, setLanguage] = useState<SupportedLanguage>("javascript");
  const [isSaving, setIsSaving] = useState(false);
  const [hasChanges, setHasChanges] = useState(false);

  useEffect(() => {
    if (problem) {
      setNoteText(problem.note || "");
      setLanguage(problem.language || "javascript");
      setHasChanges(false);
    }
  }, [problem]);

  const handleSave = useCallback(async () => {
    if (!problem) return;
    setIsSaving(true);
    await onSave(problem.id, noteText, language);
    setHasChanges(false);
    setIsSaving(false);
  }, [problem, noteText, language, onSave]);

  const handleChange = (value: string) => {
    setNoteText(value);
    setHasChanges(true);
  };

  const handleLanguageChange = (lang: SupportedLanguage) => {
    setLanguage(lang);
    setHasChanges(true);
  };

  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.key === "Escape") onClose();
    };
    if (isOpen) {
      window.addEventListener("keydown", handleKeyDown);
    }
    return () => window.removeEventListener("keydown", handleKeyDown);
  }, [isOpen, onClose]);

  return (
    <>
      <div
        className={cn(
          "fixed inset-0 bg-black/60 backdrop-blur-sm z-40 transition-opacity duration-300",
          isOpen ? "opacity-100" : "opacity-0 pointer-events-none"
        )}
        onClick={onClose}
      />
      
      <div
        className={cn(
          "fixed top-0 right-0 h-full w-full max-w-2xl bg-card border-l border-border z-50 transform transition-transform duration-300 ease-out flex flex-col",
          isOpen ? "translate-x-0" : "translate-x-full"
        )}
      >
        {problem && (
          <>
            <div className="flex items-center justify-between p-4 border-b border-border">
              <div className="flex-1 min-w-0 pr-4">
                <h3 className="font-semibold text-text-primary truncate">
                  {problem.title}
                </h3>
                <p className="text-xs text-text-secondary">
                  {problem.difficulty}
                </p>
              </div>
              <Button variant="ghost" size="sm" onClick={onClose}>
                <X className="w-5 h-5" />
              </Button>
            </div>

            <div className="flex-1 p-4 overflow-hidden flex flex-col gap-4">
              <div className="flex items-center justify-between">
                <label className="text-sm font-medium text-text-secondary">
                  Your Notes
                </label>
                <LanguageSelector value={language} onChange={handleLanguageChange} />
              </div>
              
              <CodeEditor
                value={noteText}
                onChange={handleChange}
                language={language}
                height="calc(100vh - 220px)"
                placeholder={`# Write your notes here

## Approach
Explain your approach...

## Code
\`\`\`${language}
def solution():
    pass
\`\`\`

## Complexity
- Time: O(n)
- Space: O(1)
`}
              />
              
              <div className="flex items-center justify-between">
                <span className="text-xs text-text-secondary">
                  {noteText.length} characters
                </span>
                <Button
                  onClick={handleSave}
                  disabled={!hasChanges || isSaving}
                  className="gap-2"
                >
                  <Save className="w-4 h-4" />
                  {isSaving ? "Saving..." : "Save"}
                </Button>
              </div>
            </div>
          </>
        )}
      </div>
    </>
  );
}

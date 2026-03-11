"use client";

import { SupportedLanguage } from "@/types";

interface LanguageSelectorProps {
  value: SupportedLanguage;
  onChange: (language: SupportedLanguage) => void;
}

const languages: { value: SupportedLanguage; label: string }[] = [
  { value: "markdown", label: "Markdown" },
  { value: "javascript", label: "JavaScript" },
  { value: "python", label: "Python" },
  { value: "java", label: "Java" },
  { value: "cpp", label: "C++" },
];

export function LanguageSelector({ value, onChange }: LanguageSelectorProps) {
  return (
    <div className="flex items-center gap-2">
      <span className="text-sm text-text-secondary">Language:</span>
      <select
        value={value}
        onChange={(e) => onChange(e.target.value as SupportedLanguage)}
        className="bg-card border border-border rounded-lg px-3 py-1.5 text-sm text-text-primary focus:outline-none focus:ring-2 focus:ring-secondary"
      >
        {languages.map((lang) => (
          <option key={lang.value} value={lang.value}>
            {lang.label}
          </option>
        ))}
      </select>
    </div>
  );
}

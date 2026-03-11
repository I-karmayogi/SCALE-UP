"use client";

import { useCallback } from "react";
import CodeMirror from "@uiw/react-codemirror";
import { javascript } from "@codemirror/lang-javascript";
import { python } from "@codemirror/lang-python";
import { java } from "@codemirror/lang-java";
import { cpp } from "@codemirror/lang-cpp";
import { oneDark } from "@codemirror/theme-one-dark";
import { SupportedLanguage } from "@/types";

interface CodeEditorProps {
  value: string;
  onChange?: (value: string) => void;
  language?: SupportedLanguage;
  readOnly?: boolean;
  placeholder?: string;
  height?: string;
}

const languageExtensions = {
  javascript: javascript({ jsx: true, typescript: true }),
  python: python(),
  java: java(),
  cpp: cpp(),
  markdown: [],
};

export function CodeEditor({
  value,
  onChange,
  language = "javascript",
  readOnly = false,
  placeholder,
  height = "200px",
}: CodeEditorProps) {
  const handleChange = useCallback(
    (val: string) => {
      if (onChange) {
        onChange(val);
      }
    },
    [onChange]
  );

  return (
    <div className="rounded-lg overflow-hidden border border-border">
      <CodeMirror
        value={value}
        height={height}
        theme={oneDark}
        extensions={[languageExtensions[language] || languageExtensions.javascript]}
        onChange={handleChange}
        readOnly={readOnly}
        placeholder={placeholder}
        basicSetup={{
          lineNumbers: true,
          highlightActiveLineGutter: true,
          highlightSpecialChars: true,
          foldGutter: true,
          drawSelection: true,
          dropCursor: true,
          allowMultipleSelections: true,
          indentOnInput: true,
          syntaxHighlighting: true,
          bracketMatching: true,
          closeBrackets: true,
          autocompletion: true,
          rectangularSelection: true,
          crosshairCursor: false,
          highlightActiveLine: true,
          highlightSelectionMatches: true,
          closeBracketsKeymap: true,
          defaultKeymap: true,
          searchKeymap: true,
          historyKeymap: true,
          foldKeymap: true,
          completionKeymap: true,
          lintKeymap: true,
        }}
        className="text-sm"
      />
    </div>
  );
}

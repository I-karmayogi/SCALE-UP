"use client";

import { cn } from "@/lib/utils";
import { Check } from "lucide-react";

interface CheckboxProps {
  checked: boolean;
  onChange: (checked: boolean) => void;
  className?: string;
}

export function Checkbox({ checked, onChange, className }: CheckboxProps) {
  return (
    <button
      type="button"
      role="checkbox"
      aria-checked={checked}
      onClick={() => onChange(!checked)}
      className={cn(
        "w-5 h-5 rounded-md border-2 flex items-center justify-center transition-all duration-200",
        checked
          ? "bg-primary border-primary"
          : "border-border hover:border-text-secondary",
        className
      )}
    >
      {checked && <Check className="w-3 h-3 text-background" strokeWidth={3} />}
    </button>
  );
}

import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        background: "#ffffff",
        card: "#ffffff",
        "card-hover": "#f8fafc",
        primary: "#059669",
        secondary: "#4f46e5",
        warning: "#f59e0b",
        danger: "#ef4444",
        "text-primary": "#1e293b",
        "text-secondary": "#64748b",
        border: "#e2e8f0",
      },
      fontFamily: {
        mono: ["JetBrains Mono", "monospace"],
        sans: ["Inter", "sans-serif"],
      },
    },
  },
  plugins: [],
};
export default config;

import type { Metadata } from "next";
import "./globals.css";
import { AuthProvider } from "@/context/AuthContext";

export const dynamic = 'force-dynamic';

export const metadata: Metadata = {
  title: "DSA Ladder - Master Data Structures & Algorithms",
  description: "A roadmap-style learning interface for DSA interview preparation",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className="antialiased">
        <AuthProvider>
          {children}
        </AuthProvider>
      </body>
    </html>
  );
}

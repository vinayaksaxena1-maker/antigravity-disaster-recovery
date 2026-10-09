# Antigravity Disaster Recovery Setup

This repository contains the complete custom skills, autonomous rules, and automated recovery scripts for Google Antigravity AI Coding Assistant.

## 🚀 1-Click Disaster Recovery (Fresh Machine Setup)

If your system crashes or you move to a new machine:

1. **Clone this repository into your D: Drive:**
   ```bash
   git clone https://github.com/vinayaksaxena1-maker/antigravity-disaster-recovery.git D:\antigravity-skills
   ```
2. **Run the 1-Click Installer:**
   - Double-click `setup.bat` or run in terminal:
     ```cmd
     D:\antigravity-skills\setup.bat
     ```

### What `setup.bat` does automatically:
- Creates Windows Directory Junctions linking `C:\Users\<user>\.gemini\config\skills` to `D:\antigravity-skills` (saving C: drive space).
- Copies active global rules (`autonomous-skills.md` and `developer-mode.md`) to `~/.gemini/config/rules/`.
- Verifies Python and ensures `graphifyy` CLI is installed.

---

## 📦 Installed Skills (15 Skills)

1. **`concise-planning`** — Atomic planning before major feature development.
2. **`systematic-debugging`** — Root-cause bug diagnosis from traces and logs.
3. **`ui-ux-pro-max`** — Modern design systems, palettes, typography tokens, and UX guidelines.
4. **`mobile-design`** — Mobile-first touch targets (44px+) and gesture layouts.
5. **`accessibility-compliance-accessibility-audit`** — WCAG 2.1 AA standards and ARIA auditing.
6. **`react-clean-modular`** — 300-line max component limits and prop-drilling prevention.
7. **`react-best-practices`** — State management, hooks memoization, and re-render optimization.
8. **`nextjs-best-practices`** — App Router patterns, Server vs Client components, and caching.
9. **`fastapi-pro`** — Async REST APIs, Pydantic V2, and dependency injection.
10. **`python-pro`** — Python 3.12+ syntax, strict types, and clean architecture.
11. **`flutter-expert`** — Flutter widget compositions, reactive state, and performance.
12. **`code-review-checklist`** — Edge cases, maintainability, and clean code audits.
13. **`security-auditor`** — OWASP top-10, input sanitization, and secret protection.
14. **`e2e-testing-patterns`** — Critical user flow automated test designs.
15. **`graphify`** — Codebase 3D knowledge graph extraction and architecture navigation.

---

## ⚙️ Global Rules (`rules/`)

- **`autonomous-skills.md`**: On-demand progressive disclosure orchestrator (loads only relevant skills per task, restricts Graphify to architecture questions).
- **`developer-mode.md`**: Developer direct response mode in Hinglish (no chat fluff, toggleable via "Bhaiya mode active" / "Dev mode active").

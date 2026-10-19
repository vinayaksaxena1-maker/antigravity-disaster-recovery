# Antigravity Disaster Recovery Setup

This repository provides a Disaster Recovery bundle for Antigravity **skills, custom rules, directory junctions, and companion CLI tooling** (it restores agent capabilities and customizations, not the IDE binary itself).

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
- Creates Windows Directory Junctions linking `C:\Users\<user>\.gemini\config\skills` and `C:\Users\<user>\.gemini\antigravity\skills` to `D:\antigravity-skills` (saving C: drive space).
- Copies active global rules (`autonomous-skills.md` and `developer-mode.md`) to `~/.gemini/config/rules/`.
- Ensures `graphifyy` CLI tool is installed (prefers `uv tool install`, falls back to `pip`).

---

## 📦 Installed Skills (23 Skills tracked in `.antigravity-install-manifest.json`)

1. **`concise-planning`** — Atomic planning before major feature development.
2. **`systematic-debugging`** — Root-cause bug diagnosis from traces and logs.
3. **`ui-ux-pro-max`** — Modern design systems, palettes, typography tokens, and UX guidelines.
4. **`mobile-design`** — Mobile-first touch targets (44px+) and gesture layouts.
5. **`component-state-craftsman`** — Enforces 5-state component resilience (Default, Hover, Loading Skeleton, Error Fallback, Empty).
6. **`accessibility-compliance-accessibility-audit`** — WCAG 2.1 AA standards and ARIA auditing.
7. **`react-clean-modular`** — 300-line max component limits and prop-drilling prevention.
8. **`react-best-practices`** — State management, hooks memoization, and re-render optimization.
9. **`nextjs-best-practices`** — App Router patterns, Server vs Client components, and caching.
10. **`fastapi-pro`** — Async REST APIs, Pydantic V2, and dependency injection.
11. **`python-pro`** — Python 3.12+ syntax, strict types, and clean architecture.
12. **`flutter-expert`** — Flutter widget compositions, reactive state, and performance.
13. **`code-review-checklist`** — Edge cases, maintainability, and clean code audits.
14. **`security-auditor`** — OWASP top-10, input sanitization, and secret protection.
15. **`e2e-testing-patterns`** — Critical user flow automated test designs.
16. **`graphify`** — Interactive codebase graph extraction and architecture navigation.
17. **`paperclip-bridge`** — Multi-agent orchestrator connecting Antigravity with Paperclip at `D:\paperclip`.
18. **`token-efficiency`** — Cuts LLM token spend by 40%-60% via sliced reads and compressed tool outputs.
19. **`context-engineering`** — Prevents attention rot ('Lost in the Middle') and keeps long-running memory razor-sharp.
20. **`vedic-astronomy-math`** — High-precision Vedic astronomy and Jyotish mathematical engine (Lahiri ayanamsha, Sripati cusps, Shodashvarga D1-D60, Shadbala virupas, SAV 337 invariant, Vimshottari/Yogini dashas, 36 Guna Milan).
21. **`google-artemis`** — Autonomous Android mobile automation & QA testing agent via ADB and multimodal vision (Flash & Pro self-healing modes).
22. **`brag`** — Generates viral 20-second project launch videos, motion graphics, soundtracks, and social media copy directly from codebase analysis.
23. **`brag-slim`** — Standalone lightweight launch video creator that builds visuals, audio, and animations with zero external bundled assets.

---

## 📎 Multi-Agent Control Plane (Paperclip)

- **Control Plane Location:** `D:\paperclip`
- **Integration Blueprint:** `PAPERCLIP_INTEGRATION.md`
- **Architecture:** Zero-overlap boundary model separating Paperclip management operations (`paperclip-*`) from Antigravity domain craftsmanship skills (`ui-ux-pro-max`, `flutter-expert`, etc.).
- **Governance:** Enforces human approval gates and token spend budgets across autonomous background agent teams.

---

## ⚙️ Global Rules (`rules/`)

- **`autonomous-skills.md`**: On-demand progressive disclosure orchestrator, YAGNI/zero-bloat pragmatism, and Paperclip context isolation boundaries.
- **`developer-mode.md`**: Developer direct response mode in Hinglish (no chat fluff, toggleable via "Bhaiya mode active" / "Dev mode active").
- **`user-project-boundaries.mdc`**: Project sovereignty rules protecting user repositories (`D:\Sanatan_Watch`, etc.) from unapproved core modifications.

---

## 🔌 Configured MCP Servers (`mcp_config.json` & `mcp/`)

- **`puppeteer`**: Local browser automation tool (`@modelcontextprotocol/server-puppeteer`) for navigating URLs, taking UI screenshots, clicking buttons, and automated web testing without API keys.
- **`artemis`**: Google Artemis Android automation MCP server (`mcp_server`) for controlling real Android devices or emulators via ADB, capturing mobile screenshots, tapping UI elements, inspecting traces, and automated mobile QA.


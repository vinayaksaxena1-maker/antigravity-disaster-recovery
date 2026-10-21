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
- Copies active global rules (`autonomous-skills.md`, `developer-mode.md`, `teacher-anti-sycophancy-protocol.md`, and `developer-profile.md`) to `~/.gemini/config/rules/`.
- Ensures `graphifyy` CLI tool is installed (prefers `uv tool install`, falls back to `pip`).

---

## ⚡ Active Skills (15 High-Signal Skills)

These skills are actively discovered by Antigravity in the root of `D:\antigravity-skills`:

1. **`vedic-astronomy-math`** — High-precision Vedic astronomy and Jyotish mathematical engine (Lahiri ayanamsha, Sripati cusps, Shodashvarga D1-D60, Shadbala virupas, SAV 337 invariant, Vimshottari/Yogini dashas, 36 Guna Milan).
2. **`ui-ux-pro-max`** — Modern design systems, palettes, typography tokens, and UX guidelines.
3. **`react-clean-modular`** — 300-line max component limits, hooks modularity, and prop-drilling prevention.
4. **`react-best-practices`** — Vercel React/Next performance patterns, state management, and re-render optimization.
5. **`component-state-craftsman`** — Enforces 5-state component resilience (Default, Hover, Loading Skeleton, Error Fallback, Empty).
6. **`systematic-debugging`** — Root-cause bug diagnosis from traces and logs.
7. **`mobile-design`** — Mobile-first touch targets (44px+) and gesture layouts.
8. **`google-artemis`** — Autonomous Android mobile automation & QA testing agent via ADB and multimodal vision (Flash & Pro self-healing modes).
9. **`paperclip-bridge`** — Multi-agent orchestrator connecting Antigravity with Paperclip at `D:\paperclip`.
10. **`graphify`** — Interactive codebase graph extraction and architecture navigation.
11. **`reverse-engineer-anything`** — Decompilation, forensic analysis, and runtime reverse engineering.
12. **`security-auditor`** — OWASP top-10, input sanitization, and secret protection.
13. **`code-review-checklist`** — Edge cases, maintainability, and clean code audits.
14. **`accessibility-compliance-accessibility-audit`** — WCAG 2.1 AA standards and ARIA auditing.
15. **`e2e-testing-patterns`** — Critical user flow automated test designs.

---

## 📦 Archived Skills (`archived_skills/`)

These skills are preserved in `archived_skills/` to eliminate token bloat during normal workflows. They can be restored in 1 second whenever a specific project needs them:

- **Mobile & Stacks:** `flutter-expert`, `fastapi-pro`, `python-pro`, `nextjs-best-practices`.
- **Motion & Video Engine:** `hyperframes`, `hyperframes-animation`, `hyperframes-audio`, `hyperframes-cli`, `hyperframes-core`, `hyperframes-creative`, `hyperframes-keyframes`, `hyperframes-registry`, `hyperframes-studio`, `media-use`, `brag`, `brag-slim`.
- **Absorbed into Native Features / Rules:** `concise-planning` (absorbed by native `/plan`), `context-engineering` (absorbed by native `/compact`), `token-efficiency` (absorbed into `autonomous-skills.md` rule).

### How to Restore an Archived Skill:
```powershell
# Example: To restore flutter-expert for a Flutter project:
Move-Item "D:\antigravity-skills\archived_skills\flutter-expert" "D:\antigravity-skills\"
```

---

## 📎 Multi-Agent Control Plane (Paperclip)

- **Control Plane Location:** `D:\paperclip`
- **Integration Blueprint:** `PAPERCLIP_INTEGRATION.md`
- **Architecture:** Zero-overlap boundary model separating Paperclip management operations (`paperclip-*`) from Antigravity domain craftsmanship skills (`ui-ux-pro-max`, `flutter-expert`, etc.).
- **Governance:** Enforces human approval gates and token spend budgets across autonomous background agent teams.

---

## ⚙️ Global Rules (`rules/`)

- **`teacher-anti-sycophancy-protocol.md`**: Strict Anti-Sycophancy & True Teacher protocol. Forbids blind flattery / "हाँ में हाँ मिलाना", mandates top 3 drawbacks/risks analysis before adopting tools, enforces hard refusal ("नहीं") against flawed shortcuts, and maintains absolute architectural integrity.
- **`autonomous-skills.md`**: On-demand progressive disclosure orchestrator, YAGNI/zero-bloat pragmatism, **Token & Context Engineering Protocol**, and Paperclip context isolation boundaries.
- **`developer-mode.md`**: Developer direct response mode in Hinglish (no chat fluff, toggleable via "Bhaiya mode active" / "Dev mode active").
- **`developer-profile.md`**: Vinayak's technical profile, system specs, standard stack conventions, and development environment anchors.
- **`user-project-boundaries.mdc`**: Project sovereignty rules protecting user repositories (`D:\Sanatan_Watch`, etc.) from unapproved core modifications.

---

## 🔌 Configured MCP Servers (`mcp_config.json` & `mcp/`)

- **`puppeteer`**: Local browser automation tool (`@modelcontextprotocol/server-puppeteer`) for navigating URLs, taking UI screenshots, clicking buttons, and automated web testing without API keys.
- **`artemis`**: Google Artemis Android automation MCP server (`mcp_server`) for controlling real Android devices or emulators via ADB, capturing mobile screenshots, tapping UI elements, inspecting traces, and automated mobile QA.

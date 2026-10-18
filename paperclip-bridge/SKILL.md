---
name: paperclip-bridge
description: Orchestrates multi-agent tasks between Antigravity and the Paperclip control plane located at D:\paperclip. Ensures zero overlap, role-based skill assignment (ui-ux-pro-max, flutter-expert, etc.), budget enforcement, and approval gate management.
---

# Paperclip Bridge & Multi-Agent Orchestrator

This skill connects Antigravity with the Paperclip control plane at `D:\paperclip`, ensuring seamless multi-agent collaboration with zero conflict.

## Architecture & Boundary Principles

1. **Management vs Craftsmanship**:
   - **Paperclip (`D:\paperclip`)**: Manages Org charts, schedules, budgets, and Human-in-the-loop approval gates.
   - **Antigravity Skills (`D:\antigravity-skills`)**: Governs code quality, UI tokens (`ui-ux-pro-max`), performance (`modern-web-guidance`), and engineering rigor (`rules/autonomous-skills.md`).

2. **Namespacing Standard**:
   - Internal Paperclip skills use prefix `paperclip-*` (`paperclip-board`, `paperclip-create-agent`).
   - Domain skills retain their global identity (`ui-ux-pro-max`, `flutter-expert`, `python-pro`).

3. **Tool Reuse**:
   - Paperclip agents use the existing host tools (Puppeteer MCP, Git, PowerShell) rather than downloading separate duplicate browser binaries or daemons.

## Role-Based Skill Mapping

| Paperclip Agent Role | Assigned Skill(s) | Function |
|---|---|---|
| **Product Manager** | `concise-planning`, `PROJECT_WORKFLOW.md` | Break roadmap into atomic tasks & acceptance criteria |
| **UI/UX Designer** | `ui-ux-pro-max`, `modern-web-guidance` | Palette tokens, 44px+ touch targets, 60fps native CSS motion |
| **Mobile Engineer** | `flutter-expert`, `mobile-design` | Clean architecture, state management, offline ephemeris |
| **QA / Tester** | `e2e-testing-patterns`, `puppeteer` | Headless browser testing, multi-viewport visual audits |
| **Code Reviewer** | `code-review-checklist`, `security-auditor` | Security, linting, YAGNI enforcement, approval gates |

## Operational Commands

- Location: `D:\paperclip`
- Run local server / CLI:
  ```powershell
  cd D:\paperclip
  pnpm install # (isolated to D:\ drive, zero C: drive bloat)
  pnpm dev
  ```

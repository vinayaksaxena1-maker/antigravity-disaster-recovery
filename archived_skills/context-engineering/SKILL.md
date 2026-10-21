---
name: context-engineering
description: Advanced context window management and attention engineering. Mitigates context rot, attention dilution ('Lost in the Middle'), and memory degradation during long-running multi-step tasks.
---

# Context Engineering & Memory Architecture

Inspired by Addy Osmani's agent engineering practices, this skill keeps the model's active attention window razor-sharp and prevents context degradation across long multi-turn sessions.

## Core Directives

### 1. Atomic Attention Budgeting
- **Rule**: Focus working memory exclusively on the current active sub-task (Current Wave).
- **Practice**:
  - Do not load background documentation or tangential skill files until the specific wave requiring them is reached.
  - Keep task context modular. Once a wave is verified, summarize its outcome into a single checkpoint line rather than carrying raw execution logs forward.

### 2. Observation Masking & Log Compaction
- Large tool step outputs (like raw HTML dumps or extensive dependency trees) degrade attention.
- When inspecting web pages or raw responses:
  - Extract only the relevant DOM selector or JSON key.
  - Discard transient intermediary scrapers once facts are verified.

### 3. Context Rot Prevention ("Lost in the Middle")
- In conversations extending beyond 15–20 steps:
  - Synthesize the current state into an atomic checklist.
  - Suggest `/compact` when conversational turns accumulate heavy dead weight.
  - Ensure critical project constraints (e.g., zero `src/` modification, YAGNI, exact color palettes) are anchored at the top of active reasoning.

### 4. Synergy with Planning & Multi-Agent Systems
- **With `concise-planning`**: `concise-planning` creates the task breakdown; `context-engineering` clears out memory between waves so later tasks run with the same fresh accuracy as task 1.
- **With Paperclip**: When Paperclip heartbeats trigger an agent session, `context-engineering` ensures the agent only pulls the specific ticket context, not the entire company history.

## Overlap Boundaries

- **Boundary with `concise-planning`**: `concise-planning` defines *what* tasks need to be done. `context-engineering` defines *how memory is preserved and cleaned* while executing those tasks.
- **Boundary with Rules**: Operates strictly within user-defined autonomy rules without introducing any third-party framework overhead.

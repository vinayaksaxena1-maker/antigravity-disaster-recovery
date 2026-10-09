---
name: react-clean-modular
description: "React and TypeScript code splitting rules, design variables, and local python automation refactoring playbooks."
triggers:
  - "react-clean-modular"
  - "modular refactor"
  - "split components"
  - "code splitting"
  - "clean react architecture"
---

# React Clean Modular Architecture Playbook

This playbook enforces strict modular rules on React & TypeScript applications to maintain readability, error boundaries, and reduce token usage for AI development.

## Core Rules

1. **Maximum File Size:** No component file should exceed 300 lines of code. If a component grows larger, split its child components into separate files under `src/components/`.
2. **Prop Drilling:** Avoid prop-drilling more than 3 levels deep. Use React Context or state libraries if state is global.
3. **Tailwind Design Variables:** Move recurring hex codes into central CSS variables (`src/index.css`) rather than inline Tailwind classes.
4. **Zero-Token Refactoring:** Use the automated helper python script (`scripts/universal_split.py`) to split components locally on your machine instead of using LLM output tokens to rewrite files.

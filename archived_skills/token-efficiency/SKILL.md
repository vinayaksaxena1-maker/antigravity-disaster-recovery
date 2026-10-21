---
name: token-efficiency
description: Optimizes LLM token consumption across tool executions, file inspections, terminal outputs, and conversational context. Enforces sliced reads, targeted symbol queries, output compression, and ghost token elimination.
---

# Token Efficiency & Cost Optimization

This skill governs the agent's internal operational behavior to minimize token consumption by 40%–60% without sacrificing code quality or reasoning depth.

## Core Directives

### 1. Sliced File Inspections (Never Dump Full Files)
- **Rule**: Never view an entire 500+ line file with `view_file` without specifying line ranges.
- **Practice**:
  - Always specify `StartLine` and `EndLine` (inspect 40–80 lines around the target symbol or change site).
  - Use `search_files` or `grep` to locate exact line numbers before reading.
  - Sliced reads save 80%–90% of file-reading token costs.

### 2. Output Filtering at Source (Compress Terminal Dumps)
- **Rule**: Do not stream massive terminal logs into active context.
- **Practice**:
  - Pipe commands through filters:
    - Windows PowerShell: `| Select-String -Pattern "error|failed|warning" -Context 0,2`
    - Or limit count: `| Select-Object -First 20`
  - For tests: Run only the specific failing test file or suite, not the entire test suite on every minor edit.

### 3. Ghost Token Elimination (Zero Redundant Reads)
- **Rule**: Do not re-read files that have already been read and remain unchanged in the current session.
- Keep a mental cache of the file structure from earlier steps.

### 4. Surgical Contiguous Diffs
- **Rule**: When editing code using `replace_file_content`, target only the exact contiguous lines that require modification.
- Never rewrite or regenerate 300 lines of unchanged boilerplate just to change 5 lines.

### 5. High Signal-to-Noise Communication
- Keep explanations crisp, technical, and formatted.
- Avoid repetitive preambles, generic filler pleasantries, and unnecessary recitation of what code does line-by-line.

## Overlap Boundaries

- **Boundary with App Code**: `token-efficiency` governs *agent tool execution* only. It never removes application features or necessary comments from user code.
- **Boundary with Paperclip**: Acts as the fuel efficiency engine inside Paperclip heartbeats, ensuring scheduled autonomous background tasks consume minimal tokens.

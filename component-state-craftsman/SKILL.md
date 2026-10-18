---
name: component-state-craftsman
description: Enforces production-grade 5-state UI component resilience (Default, Hover/Active, Loading Skeleton, Error/Fallback, Empty Data). Works with ui-ux-pro-max and modern-web-guidance to eliminate blank screens, broken images, and unhandled states.
---

# Component State Craftsman

This skill ensures that every UI component, widget, card, and interactive element implements all 5 critical lifecycle states, preventing UI bugs, blank screens, layout jumps, and uncaught async failures.

## The 5 Immutable Component States

Every component that displays data, fetches content, or renders interactive media MUST account for these 5 states:

```
┌────────────────────────────────────────────────────────────────────────┐
│                   THE 5 IMMUTABLE COMPONENT STATES                     │
├─────────────────┬─────────────────┬──────────────────┬─────────────────┤
│ 1. DEFAULT      │ 2. INTERACTIVE  │ 3. LOADING       │ 4. ERROR/FALLBACK│
│ (Populated UI)  │ (Hover/Focus)   │ (Skeleton/Shimmer│ (Graceful Retry) │
│                 │                 │  Zero CLS Shift) │                 │
├─────────────────┴─────────────────┴──────────────────┴─────────────────┤
│ 5. EMPTY / ZERO DATA (Helpful illustration, message & action call)     │
└────────────────────────────────────────────────────────────────────────┘
```

### 1. Default / Populated State
- Clean typography and palette tokens aligned with `ui-ux-pro-max`.
- Accessible contrast ratios (WCAG AAA/AA).

### 2. Interactive State (Hover, Focus, Active, Disabled)
- Visible focus rings (`focus-visible:ring-2 focus-visible:ring-amber-500`).
- Minimum touch target: 44px x 44px for touchscreens (`mobile-design` compliance).
- Disabled buttons show visual opacity reduction (`disabled:opacity-50 disabled:cursor-not-allowed`) and prevent double-clicks.

### 3. Loading State (Content-Shaped Skeletons)
- **Zero Cumulative Layout Shift (CLS < 0.1)**: Always reserve aspect ratio and min-height for async components.
- Use pulsating skeleton placeholders instead of blank white blocks or generic full-screen spinners.

### 4. Error & Offline Fallback State
- Graceful degradation: Never show raw uncaught error stack traces to users.
- Image fallbacks: For deity posters or external thumbnails, always provide an `onerror` fallback to a local placeholder.
- Provide a clear, friendly recovery button (e.g., "पुनः प्रयास करें / Retry").

### 5. Empty State (Zero Data)
- When a search, list, or filter returns 0 results:
  - Do not leave an awkward empty white/black card.
  - Render an informative icon/illustration, descriptive Hindi/English text, and a reset/action button.

## Overlap Boundaries

- **Boundary with `ui-ux-pro-max`**: `ui-ux-pro-max` supplies color palettes, fonts, and visual hierarchy. `component-state-craftsman` guarantees structural resilience across all async states.
- **Boundary with `modern-web-guidance`**: `modern-web-guidance` optimizes CSS performance and transitions. This skill provides the state machine logic.

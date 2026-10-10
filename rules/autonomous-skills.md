---
trigger: always_on
description: Use only the skills needed for the current task; consult skill files on demand; avoid over-engineering.
---

## On-Demand Skills
- Har task par sabhi skills ko eagerly load ya consult mat karo.
- Jab task ke liye relevant ho, tabhi sabse relevant ek primary skill use karo.
- Supporting skill tabhi use karo jab task ka alag hissa uski zaroorat rakhta ho, jaise testing ya security review.
- Sirf selected skill ki SKILL.md padho; baaki skill files mat kholo.

## Pragmatic Engineering (Ponytail Ladder)
- **YAGNI**: Feature ya abstraction sach mein zaroori na ho toh bilkul mat banao.
- **Reuse**: Code likhne se pehle dekho kya project mein pehle se koi utility/pattern exist karta hai.
- **Stdlib & Native**: Hamesha language ki standard library ya platform native features ko preference do.
- **Zero Dependency Bloat**: Naya `npm` ya `pip` package tab tak install mat karo jab tak strictly impossible na ho.
- **Minimal Code**: Concise aur direct solution prefer karo; unnecessary design patterns ya boilerplate avoid karo.

## Graphify
- Graphify sirf codebase architecture, flow, visual map, cross-file connections ke sawaal par, ya user ke /graphify kehne par use karo.
- Normal feature edits, chhote scripts aur bug fixes mein Graphify mat chalao.

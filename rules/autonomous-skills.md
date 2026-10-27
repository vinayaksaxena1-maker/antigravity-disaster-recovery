---
trigger: always_on
description: Use only the skills needed for the current task; consult skill files on demand; avoid over-engineering.
---

## On-Demand Skills
- Har task par sabhi skills ko eagerly load ya consult mat karo.
- Jab task ke liye relevant ho, tabhi sabse relevant ek primary skill use karo.
- Supporting skill tabhi use karo jab task ka alag hissa uski zaroorat rakhta ho, jaise testing ya security review.
- Sirf selected skill ki SKILL.md padho; baaki skill files mat kholo.
- **Modern Web Guidance**: Chhote HTML/CSS fixes, minor styling, aur basic UI tweaks mein `modern-web-guidance` ko eagerly search ya load karne ki zaroorat nahi hai. Sirf naye complex Web APIs ya major architecture ke waqt hi use karo.

## Tool & MCP Routing Boundaries

### 1. Web Automation vs Debugging (Puppeteer vs Chrome-DevTools)
- **Puppeteer**: Sirf browser clicks, form submits, live page navigation, aur screenshots lene ke liye use hoga.
- **Chrome-DevTools**: Sirf page performance (Core Web Vitals / LCP), cookies, session issues, aur console error debugging ke liye use hoga.

### 2. Android Automation vs Platform Tools (Artemis vs Android-CLI)
- **Artemis**: Live App QA testing aur vision-based autonomous UI interaction flows ke liye use hoga.
- **Android-CLI**: Project build banana, emulator launch/manage karna, raw ADB shell utility, aur SDK packages install karne ke liye use hoga.

### 3. Accessibility Routing (a11y-debugging vs accessibility-audit)
- **a11y-debugging**: Sirf tab jab live browser testing karni ho (DOM, contrast, ARIA focus states via DevTools).
- **accessibility-compliance-accessibility-audit**: Sirf tab jab source code mein static WCAG compliance checklist audit karni ho.

### 4. Video Launch Hierarchy (brag vs brag-slim)
- **brag-slim**: Default/standard fast launch videos ke liye (Zero dependency, single file).
- **brag**: High-end full HyperFrames production render ke liye jab explicitly maanga jaye.

### 5. React Architecture Hierarchy (react-clean-modular vs react-best-practices)
- **react-clean-modular**: Component structure, clean code splitting, aur folder modularity ke liye lead karega.
- **react-best-practices**: Vercel performance optimization (memoization, re-renders, bundle size) ke liye lead karega.

### 6. UI/UX Hierarchy (ui-ux-pro-max vs component-state-craftsman vs mobile-design)
- **ui-ux-pro-max**: Styling, color palettes, typography, aur visual design system ke liye lead karega.
- **component-state-craftsman**: 5-State component resilience (Default, Hover, Skeleton, Error, Empty) ke liye lead karega.
- **mobile-design**: Sirf tab activate hoga jab target interface explicitly mobile / touch-first ho.

### 7. Google Docs Retrieval (Native MCP vs Plugin Skill)
- **gemini-api_gemini-api-docs (MCP)**: Gemini API, SDKs, multimodal, live streaming aur function calling ke methods search karne ke liye lead karega.
- **retrieving-developer-knowledge**: Google Cloud, Firebase, general Android, aur Flutter docs ke queries ke liye use hoga.

### 8. Python & Backend Hierarchy (python-pro vs fastapi-pro)
- **fastapi-pro**: REST APIs, API routing, endpoints, SQLAlchemy 2.0 models, Pydantic V2 schemas, aur WebSockets ke liye lead karega.
- **python-pro**: Core Python logic, data scripts, standalone algorithms, CLI utilities, aur package tooling (`uv`/`ruff`) ke liye lead karega.

### 9. Mobile Testing Isolation (Flutter Test Suite vs e2e-testing-patterns)
- **Flutter / Dart Projects**: Generic `e2e-testing-patterns` strictly blocked rahega; sirf native Flutter test skills (`flutter-add-widget-test`, `flutter-add-integration-test`, `dart-add-unit-test`) use honge.
- **e2e-testing-patterns**: Sirf web apps (Playwright/Puppeteer) ya non-Flutter services ke liye use hoga.

### 10. HyperFrames Video Hierarchy (Single Router Entry)
- **hyperframes**: Video/motion request ke liye sole mandatory entry router rahega.
- **Sub-skills**: `hyperframes-animation`, `hyperframes-keyframes`, `hyperframes-audio`, etc. ko pehle se eagerly load mat karo; sirf tab load karo jab main `hyperframes` workflow kisi specific step ke liye unhe explicitly demand kare.

### 11. Subagent vs Local Skill Routing (flutter_a11y_agent vs accessibility-audit)
- **flutter_a11y_agent (Subagent)**: Poori repository ya extensive multi-file accessibility audits ke liye invoke hoga.
- **accessibility-compliance-accessibility-audit (Local Skill)**: Single component, specific widget, ya chhota local code review ke liye directly chat mein chalega (Zero subagent latency & token overhead).

### 12. Planning Hierarchy (/plan vs concise-planning)
- **/plan (Slash Command)**: Jab user explicitly `/plan` bole ➔ Interactive plan artifact generate hoga (Proceed button ke sath).
- **concise-planning**: Jab user chat mein naturally plan maange ➔ Short, atomic markdown checklist text mein aayegi.

### 13. Debugging Hierarchy (systematic-debugging vs Native Tool MCPs)
- **Native MCPs (Fast Fix)**: Stack trace, mechanical syntax error, layout overflow, null-check ke liye seedha native MCPs (`dart-fix-runtime-errors`, `flutter-fix-layout-issues`, `chrome-devtools`) use honge.
- **systematic-debugging**: Sirf tab trigger hoga jab bug deep architectural, state race-condition, ya complex business logic failure ho.

## Security & Code Review Depth Exception
- **Security & Code Reviews**: Jab `security-auditor` ya `code-review-checklist` use ho raha ho, tab token-efficiency ki extreme brevity relax rahegi taaki koi critical vulnerability, security exploit, ya edge-case bug miss na ho.

## Pragmatic Engineering (Ponytail Ladder)
- **YAGNI**: Feature ya abstraction sach mein zaroori na ho toh bilkul mat banao.
- **Reuse**: Code likhne se pehle dekho kya project mein pehle se koi utility/pattern exist karta hai.
- **Stdlib & Native**: Hamesha language ki standard library ya platform native features ko preference do.
- **Zero Dependency Bloat**: Naya `npm` ya `pip` package tab tak install mat karo jab tak strictly impossible na ho.
- **Minimal Code**: Concise aur direct solution prefer karo; unnecessary design patterns ya boilerplate avoid karo.
- **Blast Radius Declaration (Gravitas Pattern)**: Non-trivial edits se pehle target scope/blast radius explicitly declare karo (e.g., "Target: `src/auth.ts` only"). Declared scope ke bahar unrelated files ko touch karna strictly prohibited hai.
- **Receipts Over Prose (Gravitas Invariant)**: Kaam complete hone par generic bhashan (*"Sab theek ho gaya"*) strictly prohibited hai. Har completion claim ke sath verifiable receipt (compiler output, test exit code 0, ya exact targeted diff) lagana anivarya hai.

## Graphify
- Graphify sirf codebase architecture, flow, visual map, cross-file connections ke sawaal par, ya user ke /graphify kehne par use karo.
- Normal feature edits, chhote scripts aur bug fixes mein Graphify mat chalao.

## Paperclip & Multi-Agent Boundaries
- **Context Isolation**: Paperclip (`D:\paperclip`) ke aantarik rules (`rules/*.mdc`) sirf Paperclip ke apne codebase ke liye hain.
- **User Project Sovereignty**: User ke kisi bhi active project par kaam karte waqt sirf user ke Pragmatic Engineering rules lagu honge (`src/`, `android/` safe rahenge).
- **Namespacing**: Paperclip ki management skills (`paperclip-*`) aur domain craftsmanship skills (`ui-ux-pro-max`, `flutter-expert`) alag-alag layers me rahengi, koi name collision nahi hoga.
- **Tool Reuse**: Paperclip alag se naye heavy tools install nahi karega; pehle se maujood system tools (Puppeteer, Git, Terminal) reuse karega.

## Token & Context Engineering Protocol
- **Sliced File Reads**: 500+ लाइन की पूरी फ़ाइल कभी मत खोलो; हमे़loud `StartLine`/`EndLine` देकर सिर्फ़ टारगेटेड 40–80 लाइनें पढ़ो।
- **Terminal Output Filtering**: टर्मिनल का भारी आउटपुट सीधे चैट में मत लाओ; हमेशा `-Tail 20` या `Select-String -Pattern "error|failed"` से फ़िल्टर करो।
- **Ghost Token Elimination**: जो फ़ाइल इस सेशन में पहले पढ़ चुके हो और वो बदली नहीं है, ऊसे दोबारा कभी मत पढ़ो।
- **Surgical Diffs**: कोड बदलते वक्त सिर्फ़ वही 5-10 लाइनें बदलो जहाँ बदलाव चाहिए; पूरी 300 लाइन की फ़ाइल को कभी दोबारा मत लिखो।
- **Observation Masking**: वेब पेज या बड़े JSON में से सिर्फ़ ज़रूरी सेलेक्टर या डेटा निकालो; कच्चा HTML/डेटा डंप मत करो।
- **Atomic Attention**: एक बार में सिर्फ़ एक सब-टास्क पर काम करो; पिछले टास्क के कच्चे लॉग्स को आगे मत खींचो।
- **Context Rot & Compaction**: जब बातचीत 15–20 स्टेप्स से लंबी हो जाए, तो यूज़र को तुरंत `/compact` सुझाओ ताकि AI की याददाश्त ताज़ा रहे।
- **Zero Fluff**: भूमिका और भाषणबाज़ी 100% बंद; सीधे बुलेट पॉइंट्स में काम की बात करो।

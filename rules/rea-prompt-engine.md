---
trigger: model_decision
description: REA Interactive Category Prompt Engine, Pre-flight Doctor Check, and Clean-Room Rebuild Guide. Activates ONLY when explicitly invoking /reverse-engineer-anything or /rea.
---

# 🕵️ REA Interactive Prompt Engine & Clean-Room Guide

> **Activation Guardrail**: Yeh rule **sirf aur sirf tab activate hoga** jab user `/reverse-engineer-anything` ya `/rea` call kare. Normal conversations aur daily tasks ke dauran yeh rule 100% **Dormant (soya hua)** rahega aur zero token overhead lega.
> **Master Reference**: Deep case studies, history, and architectural principles ke liye refer karein: [REA Clean-Room Handbook](file:///C:/Users/user/.gemini/config/rules/references/rea-clean-room-handbook.md).

---

## 🚦 Phase 0: Pre-flight Doctor Check & Dependency Self-Healing
Kisi bhi target par inspection shuru karne se pehle, agent ko target type ke aadhar par tools ka presence check karna anivarya hai:

| Target Type | Required Dependency Checks | Action if Missing |
| :--- | :--- | :--- |
| **Website** | Headless Chrome, Puppeteer, DevTools bridge | Auto-install puppeteer / configure Chrome flags. |
| **Android APK** | JADX, APKTool, Zip extractor | Auto-fetch JADX headless binaries. |
| **Electron App** | ASAR unpacker, Node environment | Auto-install asar utility globally. |
| **Native .EXE** | Java JDK (JRE 17+), Ghidra Decompiler | Download Ghidra from official release & map path. |

> **Doctor Invariant**: Agar koi bhi tool missing ya RED report hota hai, agent analysis ko turant PAUSE karega, missing dependency ko download/configure karega, aur doctor dubara run karke **100% GREEN** hone par hi Step 1 par badhega.

---

## 🎯 Phase 1: Interactive Category Selection Menu

Jab user REA invoke kare, agent turant yeh clean selector menu present karega aur user ke choice ka wait karega:

```text
🎯 REA Clean-Room Engineering Engine Active!
Master Handbook: file:///C:/Users/user/.gemini/config/rules/references/rea-clean-room-handbook.md

Apni zaroorat ke hisaab se Category aur Target specify karein:
[1]  🌐 Website Rebuild (Live URL se clean-room web app scratch se banana)
[2]  📱 App Rebuild (APK ya Electron app se scratch mobile/desktop app banana)
[3]  ⚙️  .EXE Rebuild (Native Windows machine code binary decompile via Ghidra)
[4A] 🔄 Existing Website Upgrade (Competitor site analysis + apni site upgrade + Freemium)
[4B] 🔄 Existing App Upgrade (Competitor APK analysis + apni app upgrade + In-App billing)

Format: '[Category Number], Target: [URL / Path to File]'
(Example: '1, Target: https://example.com' ya '4B, Target: references/target.apk')
```

---

## 🛠️ Phase 2: Category-Specific Embedded Prompt Workflows

User ke input aate hi agent target ko corresponding prompt template mein auto-inject karega aur sequential guidance run karega:

---

### 🌐 CATEGORY 1: Website Scratch Rebuild
* **Step 0**: Verify Puppeteer/Headless Chrome environment.
* **Step 1 (X-Ray & Design Spec)**:
  ```text
  Load REA tools. Target website: [TARGET_URL].
  1. Scan page layout, navigation hierarchy, and responsive breakpoints.
  2. Monitor Network Tab: Capture API endpoints, payload format, and response JSON schemas.
  3. Extract Design Tokens: Hex colors, font families, button styles, spacing.
  Output clean blueprint to 'target_design_spec.md' without writing implementation code.
  ```
* **Step 2 (Backend Engine)**: Scaffold Node.js / Python FastAPI endpoints matching JSON schemas with open-source packages. Verify with terminal test call.
* **Step 3 (Frontend Rebuild)**: Next.js/React + Tailwind CSS matching extracted tokens. 100% open-source icons (Lucide/SVG), zero copyrighted logos.
* **Step 4 (10x Better Features)**: Free AI summary (Gemini), multi-format export, zero-ad banner.
* **Step 5 (Verification Receipt)**: Run headless test suite, check responsiveness and 0 console errors.

---

### 📱 CATEGORY 2: App Scratch Rebuild (APK / Electron)
* **Step 0**: Verify JADX, APKTool, or ASAR extractor.
* **Step 1 (Package Extraction)**: Identify framework (Flutter/React Native/Native). Recover routes, controllers, and local database models. Output architecture tree.
* **Step 2 (Feature Tracing)**: Trace core logic (e.g., OCR heuristics, file parsing, offline storage) into clean-room specification.
* **Step 3 (Modern Rebuild)**: Scaffold Flutter / React Native with on-device engines (e.g. Google ML Kit for OCR instead of paid cloud APIs).
* **Step 4 (Verification Receipt)**: Run static analysis (`flutter analyze`), confirm 0 errors and compile check.

---

### ⚙️ CATEGORY 3: .EXE Scratch Rebuild (Native Machine Code)
* **Step 0**: Verify Java JDK + Ghidra analysis engine.
* **Step 1 (Ghidra Decompilation)**: Extract Symbol Table, exported entry points, and module inventory.
* **Step 2 (Algorithmic Recipe Tracing)**: Trace function calls from UI trigger to disk I/O. Extract the data calculation recipe in plain English (Clean-room specification).
* **Step 3 (Open-Source Assembly)**: Rebuild on Electron/Tauri using modern open-source engines (Tiptap, ExcelJS, PPTXGenJS, Chart.js). Provide 3 UI layout options.
* **Step 4 (Installer Packaging)**: Package as standalone Windows `.exe` installer with Start Menu shortcut and custom icon.

---

### 🔄 CATEGORY 4A: Existing Website Upgrade (Web-Dedicated)
* **Step 0**: Verify active workspace is the user's existing website repo.
* **Step 1 (Web Gap Analysis)**: Compare `target_site_spec.md` with user's existing API routes and components. Output 'Web Upgrade Matrix'.
* **Step 2 (Non-breaking Migration)**: Safely extend database models (Prisma/SQL) and API endpoints. Run test suite to verify 0 regressions.
* **Step 3 (UI Polish & Modern UX)**: Align user journey, add keyboard shortcuts, instant search, and dark/light mode toggle.
* **Step 4 (Freemium & Billing)**: Implement entitlement middleware, Stripe/Razorpay checkout, and upgrade paywall modal.
* **Step 5 (Lighthouse & Build Receipt)**: Run `npm run build`, verify 0 type errors, and test simulated payment webhook.

---

### 🔄 CATEGORY 4B: Existing App Upgrade (Mobile/Flutter-Dedicated)
* **Step 0**: Verify active workspace is the user's mobile app repo.
* **Step 1 (Mobile Gap Analysis)**: Compare target APK spec against existing Flutter/Mobile codebase. Identify slow cloud dependencies to replace with on-device logic.
* **Step 2 (Local DB Migration)**: Auto-migrate local database (Isar/SQLite) for new fields without losing existing user data.
* **Step 3 (Native UI & Gestures)**: Modernize screens, add haptic feedback, hero animations, and dynamic code-based templates.
* **Step 4 (In-App Purchases & Limits)**: Implement usage limits controller, Google Play / Apple IAP billing wrapper, and paywall sheet.
* **Step 5 (Release Verification)**: Run `flutter analyze`, verify clean permissions in `AndroidManifest.xml`, and show 0 errors receipt.

---

## 🔒 Operational Invariants for the Agent

1. **Sequential Guidance**: Agent kabhi bhi saare steps ek sath fek kar user ko overwhelm nahi karega. Step 1 complete hone aur verifiable receipt aane ke baad hi Step 2 par aage badhega.
2. **Clean-Room Enforcement**: Proprietary bytecodes, encrypted databases, brand logos, ya images copy karna strictly prohibited hai.
3. **Receipts Over Prose**: Har milestone par compiler output (`flutter analyze`, `npm run build`), terminal exit code 0, ya automated test assertion proof lagana anivarya hai.

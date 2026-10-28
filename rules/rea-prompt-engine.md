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

## 🎯 Phase 1: Interactive Category Selection (Dot-Click Modal via `ask_question`)

Jab user REA invoke kare (`/rea`), agent ko text menu likhne ke bajaye **hamesha interactive modal (`ask_question` tool)** render karna anivarya hai:

### Mandatory Interactive Modal UI:
* **Tool Call**: `ask_question`
* **Question**: `"🎯 REA Clean-Room Engine Active! Apni category choose karein:"`
* **Options (Radio Buttons / Dots)**:
  1. `[1] 🌐 Website Rebuild (Live URL se clean-room web app scratch se banana)`
  2. `[2] 📱 App Rebuild (APK ya Electron app se scratch mobile/desktop app banana)`
  3. `[3] ⚙️ .EXE Rebuild (Native Windows machine code binary decompile via Ghidra)`
  4. `[4A] 🔄 Existing Website Upgrade (Competitor analysis + apni site upgrade + Freemium)`
  5. `[4B] 🔄 Existing App Upgrade (Competitor APK analysis + apni app upgrade + In-App billing)`

### Modal Response Flow:
1. User screen par aane wale radio button (dot) par click karke option submit karega.
2. User ke option submit karte hi agent agle prompt mein target URL, File Path, ya **Google Play Store Link** maangega:
   > *"Aapne **[Selected Option]** chuna hai. Kripya apne Target ka URL, local File Path, ya **Google Play Store Link** enter karein:*  
   > *(e.g. `references/target.apk` ya `https://play.google.com/store/apps/details?id=com.vendor.app` ya `https://example.com`):"*
3. Target aate hi agent Phase 0 (Doctor check & Auto-downloader if Play Link) verify karega aur Phase 2 ke step-wise workflows ko auto-pilot par execute karega.
*(Power-user shortcut: Agar user ne prompt mein pehle se hi category aur target path/link dono de diye hon, toh modal skip karke seedha execution shuru kiya ja sakta hai).*

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

### 📱 CATEGORY 2: App Scratch Rebuild (APK / Play Store Link / Electron)
* **Step 0**: Verify JADX, APKTool, or ASAR extractor.
* **Step 0.5 (Google Play Auto-Downloader - Optional)**:
  - Agar user ne Google Play Store link diya hai (`id=package.name`), toh package ID extract karke APK/XAPK bundle auto-download karega.
* **Step 1 (Package Extraction & Engine Classification)**:
  - **Classification Gate**: Check karein ki target kya hai:
    * *Type A: Normal UI/Utility App* (Flutter, React Native, Java/Kotlin).
    * *Type B: Game Engine* (Unity IL2CPP `libil2cpp.so`, Unreal, Godot).
  - **Dimension Gate (2D vs 3D Invariant)**:
    * Agar target mein 3D engine, procedural meshes (`MeshGen`), ya 3D cameras detect hon, toh agent **bina user ki written permission ke silently 2D flat canvas choose NAHI karega**.
    * Agent mandatory question puchega:
      > *"Original target pure 3D engine (Unity/Mesh) par hai. Kya hum iska exact 3D render banayein (Godot/Three.js/Flutter 3D shader) ya lightweight 2D canvas?"*
* **Step 2 (Feature Tracing)**: Trace core logic, math formulas, and level assets into clean-room specification (`CLEAN_ROOM_SPECIFICATION.md`).
* **Step 3 (Stack Scaffolding)**: User ke chune hue dimension aur framework ke aadhar par project scaffold karein (Utility app ke liye Flutter/RN; 3D Game ke liye explicit 3D engine stack).
* **Step 4 (Native Deliverable Verification)**:
  * **True Deliverable Invariant**: Target APK hone par final completion receipt **`flutter build apk` ka real `.apk` binary on disk** hoga.
  * Browser/Web preview (`flutter run -d chrome`) ko final APK completion nahi maana jayega. Run static analysis (`flutter analyze`), confirm 0 errors.

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
* **Step 0.5 (Google Play Auto-Downloader - Optional)**:
  - Agar user ne competitor ka Google Play link diya hai, toh package ID extract karke APK/XAPK bundle auto-download karke `references/` mein unpack karega.
* **Step 1 (Mobile Gap Analysis)**: Compare target APK spec against existing Flutter/Mobile codebase. Identify slow cloud dependencies to replace with on-device logic.
* **Step 2 (Local DB Migration)**: Auto-migrate local database (Isar/SQLite) for new fields without losing existing user data.
* **Step 3 (Native UI & Gestures)**: Modernize screens, add haptic feedback, hero animations, and dynamic code-based templates.
* **Step 4 (In-App Purchases & Limits)**: Implement usage limits controller, Google Play / Apple IAP billing wrapper, and paywall sheet.
* **Step 5 (Release Verification)**: Run `flutter analyze`, verify clean permissions in `AndroidManifest.xml`, and show 0 errors receipt.

---

## 🔒 Operational Invariants & Smart Routing for the Agent

1. **Dynamic Framework & Skill Routing (Context Isolation)**:
   * **Flutter Projects (`pubspec.yaml` detected)**:
     - Agent strictly Flutter/Dart native skills use karega (`flutter-expert`, `dart-add-unit-test`, `flutter-fix-layout-issues`).
     - Generic `e2e-testing-patterns` strictly blocked rahegi.
   * **Web/React Projects (`package.json` detected)**:
     - Agent `react-clean-modular` (component structure & clean splitting) aur `react-best-practices` (performance & memoization) ko active karega.
   * **Python/Backend Projects (`pyproject.toml` / `requirements.txt`)**:
     - Agent REST/API tasks ke liye `fastapi-pro` aur data logic ke liye `python-pro` route karega.

2. **Automated Verification Tool Routing (Puppeteer vs Artemis)**:
   * **Web Verification (Category 1 & 4A)**:
     - Sirf **Puppeteer** use hoga live browser navigation, DOM render checks, button clicks, aur visual verification ke liye.
   * **Mobile/Android App Verification (Category 2 & 4B)**:
     - Sirf **Google Artemis** use hoga live Android device/emulator QA testing, touch interactions, aur multimodal visual assertion receipts ke liye.

3. **Concise Planning Protocol (Sequential Roadmap Checkpoints)**:
   * Step 1 (Gap Analysis) complete hone ke baad agent seedha blind coding shuru nahi karega.
   * Agent **`concise-planning`** rule use karke ek 4-step atomic roadmap (`• Step 2: ...`, `• Step 3: ...`) dikhayega aur user se permission maangega (*"Kya hum Step 2 se shuru karein?"*).

4. **Token & Context Engineering Invariant**:
   * **Ghost Token Elimination**: Raw 18MB binary ya hazaron lines ka decompiled dump context mein kabhi nahi aayega; sirf targeted classes/models extract honge (98% token savings).
   * **Surgical Diffs Over Rewrites**: Badi 300-500 line ki files ko poora overwrite karna strictly prohibited hai. Sirf targeted `+N -M` lines badli jayengi taaki purana working code 100% safe rahe.

5. **Clean-Room Enforcement**:
   * Proprietary bytecodes, encrypted databases, brand logos, ya images copy karna strictly prohibited hai. Open-source engines aur code-based vector UI use honge.

6. **Receipts Over Prose**:
   * Har milestone par compiler output (`flutter analyze 0 errors`, `npm run build`), terminal exit code 0, ya automated test assertion proof lagana anivarya hai.

7. **Engine Classification & Dimension Gate (Zero Silent 3D->2D Downgrades)**:
   * Target analysis mein game engines (Unity, Unreal, Godot) ya 3D meshes/cameras detect hone par agent **bina user confirmation ke 2D flat canvas (`CustomPainter`) par silently downgrade NAHI kar sakta**.
   * Agent ko 3D vs 2D ka explicit sawaal user se puchna aur stack align karna anivarya hai.

8. **True Deliverable Invariant (Native Binary over Ephemeral Web Previews)**:
   * Agar target ek Mobile APK tha, toh final deliverable receipt **`flutter build apk` ka real `.apk` binary on disk** hoga.
   * Temporary web preview (`flutter run -d chrome`) ko final task completion claim nahi maana jayega.

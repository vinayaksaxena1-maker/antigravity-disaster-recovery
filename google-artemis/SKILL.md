---
name: google-artemis
description: Official Google Artemis Android automation and testing agent skill. Translates natural-language instructions into reliable end-to-end actions on real Android devices or emulators via ADB and multimodal vision (Gemini, Claude, GPT-4o). Features native Antigravity MCP integration, Flash/Pro execution modes, self-healing popups, scrcpy screen mirroring, and automated QA testing.
---

# Google Artemis: Android AI Automation & Testing Platform

## 1. Overview & Capabilities

**Google Artemis** (`google/artemis`) is an open-source autonomous Android automation agent and platform developed by Google. It enables AI agents to interact with real Android devices and emulators using natural language, multimodal computer vision, and the Android Debug Bridge (ADB).

### Core Features
* **Multimodal UI Perception:** Uses multimodal LLMs (Gemini 2.5/Flash, Claude 3.5+, GPT-4o) to visually understand screen elements, buttons, text, and icons without requiring hardcoded pixel coordinates or brittle XPath selectors.
* **Dual Execution Modes:**
  * **Flash Mode:** Reactive observe-and-act loop (3–5 seconds/step) ideal for fast, linear workflows, navigation, and form inputs.
  * **Pro Mode:** Multi-agent architecture with pre-action target verification, self-healing popup recovery, exploratory planning, and safety nets.
* **Native Antigravity MCP Integration:** Built-in Model Context Protocol (MCP) server allowing Antigravity agents to directly inspect screens, trigger touch/keyboard gestures, capture screenshots, and read Logcat logs.
* **Live Web Dashboard:** Local web UI (`http://localhost:8000`) with real-time `scrcpy` device screen mirroring, prompt sandboxing, and step-by-step action replays.
* **99%+ Benchmark Accuracy:** Achieves top-tier performance on Google Research's AndroidWorld mobile benchmark.

---

## 2. Environment Prerequisites

* **Operating System:** Windows 10/11, macOS, or Linux.
* **Python:** Python 3.12+ (compatible with system Python at `python`).
* **Package Manager:** `uv` or `pip` (`pip install uv`).
* **Android Debug Bridge (ADB):** Installed and accessible (e.g., `D:\Android\Sdk\platform-tools\adb.exe`).
* **Android Device / Emulator:**
  * USB Debugging enabled in **Developer Options**.
  * Connected via USB cable or wireless ADB (`adb connect <ip>:<port>`).
  * Verify via terminal: `adb devices`.

---

## 3. Installation & Quickstart

### 3.1 Repository Setup
The codebase is located at `D:\artemis`:
```powershell
git clone https://github.com/google/artemis.git D:\artemis
cd D:\artemis
```

### 3.2 Automated Startup
Run the startup script to initialize dependencies (`uv`, ADB, `scrcpy`, FFmpeg) and launch the web dashboard:
```powershell
# In PowerShell:
.\start.bat
```
* The interactive web dashboard will become accessible at `http://localhost:8000`.

---

## 4. Antigravity MCP Server Configuration

Artemis includes a native one-command installer for Antigravity:

### 4.1 Automated MCP Installation
From the `D:\artemis` directory:
```powershell
uv run artemis mcp --install antigravity
```

### 4.2 Manual MCP Configuration
Alternatively, register the Artemis MCP server directly in Antigravity's MCP configuration (`mcp_servers`):
```json
{
  "mcpServers": {
    "artemis": {
      "command": "uv",
      "args": [
        "--directory",
        "D:\\artemis",
        "run",
        "artemis",
        "mcp"
      ],
      "env": {
        "GEMINI_API_KEY": "${GEMINI_API_KEY}"
      }
    }
  }
}
```

---

## 5. Execution Workflows & Prompt Patterns

When interacting with an Android device via Artemis, use the following operational patterns:

### 5.1 App Launch & Navigation
```text
Artemis, launch the app with package name "com.example.myapp". Wait for the home screen to render, and confirm the main dashboard is visible.
```

### 5.2 Form Filling & User Onboarding
```text
Artemis:
1. Tap the "Sign In" button on the screen.
2. Enter "testuser@example.com" into the email field.
3. Enter "TestPassword123" into the password field.
4. Tap "Submit" and take a screenshot of the resulting screen.
```

### 5.3 Automated QA & Bug Verification
```text
Artemis, run a full exploratory smoke test on the current screen:
- Inspect all buttons and links.
- Test tap the primary action button.
- Verify whether any crash dialog, ANR (Application Not Responding), or unexpected toast message appears.
- If an unexpected permission popup appears, handle it and continue.
- Pull Logcat logs if any error status code is encountered.
```

### 5.4 Screenshot & Visual Validation
```text
Artemis, capture a full-resolution screenshot of the current activity, check if the navigation bar is properly aligned with no overlapping text elements, and report any visual glitches.
```

---

## 6. Best Practices & Troubleshooting

1. **Device Authorization:** If `adb devices` shows `unauthorized`, unlock the physical device screen and tap **"Always allow from this computer"** on the RSA fingerprint prompt.
2. **Scrcpy Performance:** For smoother mirroring on high-resolution devices, set bit-rate limit: `scrcpy -b 8M -m 1920`.
3. **Multi-Device Selection:** If multiple devices or emulators are connected, specify the target device serial:
   ```powershell
   artemis run --device <SERIAL_NUMBER> "Task description"
   ```
4. **Self-Healing Popups:** In Pro mode, Artemis automatically detects and dismisses system alerts (location access, notifications, battery optimization prompts) that would otherwise derail traditional scripts.

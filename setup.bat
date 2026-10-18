@echo off
setlocal enabledelayedexpansion
echo ======================================================
echo    Antigravity Disaster Recovery Setup
echo ======================================================
echo.

set "SOURCE_DIR=%~dp0"
if "%SOURCE_DIR:~-1%"=="\" set "SOURCE_DIR=%SOURCE_DIR:~0,-1%"

set "GEMINI_DIR=%USERPROFILE%\.gemini"
set "CONFIG_DIR=%GEMINI_DIR%\config"
set "RULES_DIR=%CONFIG_DIR%\rules"
set "SKILLS_JUNCTION=%CONFIG_DIR%\skills"
set "AGY_SKILLS_JUNCTION=%GEMINI_DIR%\antigravity\skills"

set "HAS_ERROR=0"

echo [*] Target Antigravity Config: %CONFIG_DIR%
echo [*] Skills Source Location:    %SOURCE_DIR%
echo.

if not exist "%CONFIG_DIR%" mkdir "%CONFIG_DIR%"
if not exist "%RULES_DIR%" mkdir "%RULES_DIR%"
if not exist "%GEMINI_DIR%\antigravity" mkdir "%GEMINI_DIR%\antigravity"

echo [*] Configuring Windows Junction Links...
if exist "%SKILLS_JUNCTION%" (
    rmdir "%SKILLS_JUNCTION%" 2>nul || del /q /f "%SKILLS_JUNCTION%" 2>nul
)
mklink /J "%SKILLS_JUNCTION%" "%SOURCE_DIR%"
if %errorlevel% equ 0 (
    echo [V] Junction Active: %SKILLS_JUNCTION% -^> %SOURCE_DIR%
) else (
    echo [X] ERROR: Failed to create junction for %SKILLS_JUNCTION%
    set "HAS_ERROR=1"
)

if exist "%AGY_SKILLS_JUNCTION%" (
    rmdir "%AGY_SKILLS_JUNCTION%" 2>nul || del /q /f "%AGY_SKILLS_JUNCTION%" 2>nul
)
mklink /J "%AGY_SKILLS_JUNCTION%" "%SOURCE_DIR%"
if %errorlevel% equ 0 (
    echo [V] Junction Active: %AGY_SKILLS_JUNCTION% -^> %SOURCE_DIR%
) else (
    echo [X] ERROR: Failed to create junction for %AGY_SKILLS_JUNCTION%
    set "HAS_ERROR=1"
)

echo.
echo [*] Installing Global Rules...
if exist "%SOURCE_DIR%\rules" (
    copy /Y "%SOURCE_DIR%\rules\*.md" "%RULES_DIR%\" >nul
    if %errorlevel% equ 0 (
        echo [V] Rules deployed to %RULES_DIR%:
        dir /b "%RULES_DIR%\*.md"
    ) else (
        echo [X] ERROR: Failed to copy rules to %RULES_DIR%
        set "HAS_ERROR=1"
    )
) else (
    echo [X] ERROR: Rules source folder not found at %SOURCE_DIR%\rules
    set "HAS_ERROR=1"
)

echo.
echo [*] Deploying MCP Server Configuration...
if exist "%SOURCE_DIR%\mcp_config.json" (
    copy /Y "%SOURCE_DIR%\mcp_config.json" "%CONFIG_DIR%\mcp_config.json" >nul
    copy /Y "%SOURCE_DIR%\mcp_config.json" "%GEMINI_DIR%\antigravity\mcp_config.json" >nul
    echo [V] MCP servers configured (puppeteer browser automation).
)

echo.
echo [*] Checking Graphify CLI tool (prefers uv, falls back to pip)...
where uv >nul 2>&1
if %errorlevel% equ 0 (
    echo [V] uv detected. Installing/updating graphifyy via uv tool...
    uv tool install --upgrade graphifyy >nul 2>&1
    if %errorlevel% equ 0 (
        echo [V] graphifyy CLI ready via uv.
    ) else (
        echo [!] WARNING: Failed to install/update graphifyy via uv.
    )
) else (
    where python >nul 2>&1
    if %errorlevel% equ 0 (
        echo [V] Python detected. Installing/updating graphifyy via pip...
        pip install --upgrade graphifyy >nul 2>&1
        if %errorlevel% equ 0 (
            echo [V] graphifyy CLI ready via pip.
        ) else (
            echo [!] WARNING: Failed to install/update graphifyy via pip.
        )
    ) else (
        echo [!] WARNING: Neither uv nor Python found in PATH. Please install uv or Python 3.10+ for Graphify.
    )
)

echo.
echo [*] Checking Paperclip Multi-Agent Control Plane...
if exist "D:\paperclip" (
    echo [V] Paperclip repository found at D:\paperclip.
    if exist "%SOURCE_DIR%\rules\user-project-boundaries.mdc" (
        copy /Y "%SOURCE_DIR%\rules\user-project-boundaries.mdc" "D:\paperclip\rules\user-project-boundaries.mdc" >nul 2>&1
        echo [V] Deployed user-project-boundaries.mdc to D:\paperclip\rules\
    )
) else (
    echo [*] Paperclip not found at D:\paperclip. Attempting clone...
    git clone https://github.com/vinayaksaxena1-maker/paperclip.git D:\paperclip
    if !errorlevel! equ 0 (
        echo [V] Paperclip cloned successfully to D:\paperclip.
        if exist "%SOURCE_DIR%\rules\user-project-boundaries.mdc" (
            copy /Y "%SOURCE_DIR%\rules\user-project-boundaries.mdc" "D:\paperclip\rules\user-project-boundaries.mdc" >nul 2>&1
            echo [V] Deployed user-project-boundaries.mdc to D:\paperclip\rules\
        )
    ) else (
        echo [!] WARNING: Could not auto-clone Paperclip. You can clone it manually later.
    )
)

echo.
echo ======================================================
if "%HAS_ERROR%"=="0" (
    echo    Disaster Recovery Completed Successfully!
) else (
    echo    [!] Disaster Recovery Completed With ERRORS!
    echo    Please check the errors reported above.
)
echo ======================================================
pause

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
)

if exist "%AGY_SKILLS_JUNCTION%" (
    rmdir "%AGY_SKILLS_JUNCTION%" 2>nul || del /q /f "%AGY_SKILLS_JUNCTION%" 2>nul
)
mklink /J "%AGY_SKILLS_JUNCTION%" "%SOURCE_DIR%"
if %errorlevel% equ 0 (
    echo [V] Junction Active: %AGY_SKILLS_JUNCTION% -^> %SOURCE_DIR%
)

echo.
echo [*] Installing Global Rules...
if exist "%SOURCE_DIR%\rules" (
    copy /Y "%SOURCE_DIR%\rules\*.md" "%RULES_DIR%\" >nul
    echo [V] Rules deployed to %RULES_DIR%:
    dir /b "%RULES_DIR%\*.md"
)

echo.
echo [*] Checking Python & Graphify CLI tool...
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo [V] Python detected. Checking graphifyy package...
    pip install --upgrade graphifyy >nul 2>&1
    echo [V] graphifyy CLI ready.
) else (
    echo [!] Python not found in PATH. Please install Python 3.10+ if you use Graphify.
)

echo.
echo ======================================================
echo    Disaster Recovery Completed Successfully!
echo ======================================================
pause

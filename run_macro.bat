@echo off
title Lunar Tear // VD
cd /d "%~dp0"

echo ===================================================
echo   Starting Lunar Tear...
echo ===================================================
echo.

:: Detect Python executable or Python Launcher
set PYTHON_CMD=
where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    set PYTHON_CMD=python
) else (
    where py >nul 2>nul
    if %ERRORLEVEL% EQU 0 (
        set PYTHON_CMD=py
    )
)

if "%PYTHON_CMD%"=="" (
    echo [ERROR] Python is not installed or not found in system PATH.
    echo Please install Python 3.10+ from https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation.
    echo.
    pause
    exit /b 1
)

:: Verify required runtime dependencies
%PYTHON_CMD% -c "import mss" >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [INFO] Required dependencies not found. Installing from requirements.txt...
    %PYTHON_CMD% -m pip install -r requirements.txt
    if %ERRORLEVEL% NEQ 0 (
        echo.
        echo [ERROR] Failed to install dependencies. Please run manually:
        echo     pip install -r requirements.txt
        echo.
        pause
        exit /b 1
    )
    echo [INFO] Dependencies installed successfully.
    echo.
)

:: Launch Lunar Tear macro
%PYTHON_CMD% qte_macro.py

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] Macro stopped unexpectedly with error code %ERRORLEVEL%.
    pause
)

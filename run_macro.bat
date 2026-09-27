@echo off
title Violence District QTE Macro
cd /d "%~dp0"

echo ===================================================
echo   Starting Violence District QTE Auto-Macro...
echo ===================================================
echo.

python qte_macro.py

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] Macro stopped unexpectedly with error code %ERRORLEVEL%.
    pause
)

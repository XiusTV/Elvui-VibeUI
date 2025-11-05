@echo off
title pfQuest Merger - Build Executable

echo ========================================
echo   pfQuest Merger Tool - Build Script
echo ========================================
echo.
echo This will create a standalone .exe file
echo that can be run without Python installed.
echo.
pause

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo.
    echo Please install Python from: https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation
    echo.
    pause
    exit /b 1
)

REM Run build script
python build_exe.py

pause


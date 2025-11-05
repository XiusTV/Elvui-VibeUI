@echo off
echo ========================================
echo   pfQuest Database Merger
echo ========================================
echo.
echo This script will monitor Ascension.exe and automatically
echo merge captured quest data when the game closes.
echo.
echo Checking for psutil...
python -c "import psutil" 2>nul
if errorlevel 1 (
    echo.
    echo psutil not found! Installing...
    python -m pip install psutil
    echo.
)

echo.
echo Starting monitor...
echo Press Ctrl+C to stop the script.
echo.
pause

python "%~dp0pfquest_db_merger.py"

pause


@echo off
echo ========================================
echo pfQuest Manual Merge Test
echo ========================================
echo.
echo This will manually run the merger WITHOUT waiting for game close.
echo Use this to test if the merger can read your SavedVariables.
echo.
pause

cd "%~dp0Merger Via CMD"

echo.
echo Running merger script...
echo.

python pfquest_db_merger.py --manual-merge

echo.
echo ========================================
echo Done! Check output above for errors.
echo ========================================
pause


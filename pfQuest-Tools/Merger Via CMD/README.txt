================================================================================
                pfQuest Merger - Command-Line Version
================================================================================

THIS FOLDER: Python script version for advanced users who prefer command-line

RECOMMENDED FOR MOST USERS: Use ..\dist\pfQuest Merger Tool.exe instead!

================================================================================

TO USE THIS VERSION:
====================

REQUIREMENTS:
-------------
• Python 3.7+
• psutil package

INSTALL DEPENDENCIES:
---------------------
python -m pip install -r requirements.txt

Or manually:
python -m pip install psutil

START THE MERGER:
-----------------
Double-click: RUN_MERGER_HERE.bat

You'll see:
┌─────────────────────────────────────┐
│ pfQuest Database Merger started     │
│ Monitoring for: Ascension.exe       │
│ Game path: D:\Games\...             │
│ Addon path: D:\Games\...            │
└─────────────────────────────────────┘

Leave this window open while playing!

WHEN GAME CLOSES:
-----------------
The script will:
1. Detect game closed
2. Wait 10 seconds
3. Extract captured data
4. Generate ..\dist\pfQuest-wotlk\db\captured\quests.lua
5. Show "Merge complete!"

================================================================================

FILES IN THIS FOLDER:
=====================

LAUNCHER:
---------
RUN_MERGER_HERE.bat         - Start the merger (DOUBLE-CLICK THIS)

SOURCE:
-------
pfquest_db_merger.py        - Merger script

DEPENDENCIES:
-------------
requirements.txt            - psutil only

DOCUMENTATION:
--------------
README_MERGER.md            - Technical details
README.txt                  - This file

================================================================================

CONFIGURING PATHS:
==================

Edit: pfquest_db_merger.py

Find these lines (around line 14-17):
┌─────────────────────────────────────────────────────────┐
│ GAME_PATH = r"D:\Games\Ascension\Live"                 │
│ ADDON_PATH = r"D:\Games\...\pfQuest-wotlk"            │
│ GAME_EXE = "Ascension.exe"                             │
└─────────────────────────────────────────────────────────┘

Update to match your installation.

================================================================================

WHY USE THIS INSTEAD OF .EXE?
==============================

PROS:
-----
✓ Lightweight (~50 KB vs 15-20 MB)
✓ Fast startup
✓ See Python code directly
✓ Easy to modify/debug
✓ No compilation needed

CONS:
-----
✗ Requires Python installed
✗ Requires manual path editing
✗ Command-line interface only
✗ Harder for non-technical users

RECOMMENDATION:
---------------
Use the .exe version (..\dist\pfQuest Merger Tool.exe) unless you:
• Prefer command-line tools
• Want to modify the code
• Have Python development setup
• Don't want the .exe size

================================================================================

COMPARISON:
===========

COMMAND-LINE VERSION (this folder):
• RUN_MERGER_HERE.bat → Python script → Text output
• Manual path editing required
• Requires Python + psutil

.EXE VERSION (..\dist\):
• pfQuest Merger Tool.exe → GUI → Activity log
• Settings dialog for paths
• No Python required

Both do the exact same job!

================================================================================

TROUBLESHOOTING:
================

"Python not found"
→ Install from: https://python.org/downloads
→ Check "Add Python to PATH"

"psutil not found"
→ python -m pip install psutil

"Path not found" error
→ Edit pfquest_db_merger.py
→ Update GAME_PATH and ADDON_PATH

"SavedVariables not found"
→ Make sure you've logged into WoW at least once
→ Check: WTF\Account\<Account>\SavedVariables\

Script doesn't detect game
→ Check GAME_EXE name in script
→ Look in Task Manager for exact .exe name

================================================================================

FOR MORE HELP:
==============

See:
• README_MERGER.md - Technical details
• ..\PFQUEST_COMPLETE_GUIDE.md - Full documentation
• ..\README_USERS.txt - Main README

Or switch to the .exe version for easier configuration!

================================================================================


================================================================================
                    pfQuest Database Merger - GUI Version
================================================================================

NEW: Graphical interface to control the merger tool!

FEATURES:
---------
✓ Start/Stop monitoring with a button
✓ Configure game and addon paths
✓ Real-time activity log
✓ Status indicators
✓ Settings dialog
✓ Dependency installer
✓ Path validation

QUICK START:
------------
1. Double-click: RUN_MERGER_GUI.bat
2. Click "Settings" button
3. Set your paths (or verify defaults are correct)
4. Click "Save"
5. Click "▶ Start Monitoring"
6. Play WoW!

The GUI will:
• Show when game starts/stops
• Automatically merge when game closes
• Display all activity in the log
• Show merge completion status

SETTINGS:
---------
Game Path:       Where your Ascension.exe is located
                 Example: D:\Games\Ascension\Live

Addon Path:      Where pfQuest-wotlk addon is located
                 Example: D:\Games\Ascension\Live\Interface\AddOns\pfQuest-wotlk

Game Executable: Name of your game .exe file
                 Default: Ascension.exe
                 (Change if using different server/client)

Check Interval:  How often to check if game is running (seconds)
                 Default: 5 seconds

Cooldown:        Wait time after game closes before merging
                 Default: 10 seconds

Auto-start:      Start monitoring automatically when GUI launches
                 Default: Off

MENU OPTIONS:
-------------
File Menu:
• Settings - Configure paths and options
• Exit - Close the application

Tools Menu:
• Install Dependencies - Install psutil if needed
• Test Paths - Verify paths are valid
• Open Addon Folder - Open addon folder in explorer
• Clear Log - Clear the activity log

Help Menu:
• Quick Start - Show quick start guide
• About - About this application

ACTIVITY LOG:
-------------
The log shows:
• When monitoring starts/stops
• When game starts/closes
• SavedVariables detection
• Merge progress
• Merge completion
• Any errors

Color coding:
• Black - Normal messages
• Green - Success messages
• Orange - Warnings
• Red - Errors

CONFIGURATION FILE:
-------------------
Settings are saved to: merger_config.json

This file stores your paths and preferences.
You can edit it manually if needed (valid JSON format).

COMPARISON TO BATCH FILE:
--------------------------
OLD: RUN_MERGER_HERE.bat
• Command-line interface
• Manual path editing in Python file
• Text-only output

NEW: RUN_MERGER_GUI.bat
• Graphical interface
• Settings dialog for paths
• Color-coded log
• Status indicators
• Easy start/stop

Both do the same thing, use whichever you prefer!

TROUBLESHOOTING:
----------------
"Python is not installed"
→ Install from: https://python.org/downloads
→ Check "Add Python to PATH"

"psutil not installed"
→ Click Tools → Install Dependencies
→ Or run: python -m pip install psutil

"Invalid Path" error
→ Click Settings and verify paths
→ Click Tools → Test Paths

Game not detected
→ Verify game executable name in Settings
→ Check Task Manager for exact .exe name

Merge not happening
→ Check log for error messages
→ Verify addon path is correct
→ Make sure you've played and captured quests

ADVANCED:
---------
The GUI updates the merger script's configuration automatically.
Both the GUI and command-line versions use the same paths.

If you want to use both:
1. Configure paths in GUI
2. Both GUI and batch file will use same settings

The GUI saves settings to merger_config.json
The batch file reads from pfquest_db_merger.py

================================================================================

Enjoy the new GUI! It makes monitoring much easier.

For full documentation, see: PFQUEST_COMPLETE_GUIDE.md


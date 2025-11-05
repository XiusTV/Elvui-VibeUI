================================================================================
                      pfQuest Merger Tool
================================================================================

WHAT IS THIS?
-------------
A tool that automatically captures quest data from World of Warcraft 3.3.5
and integrates it into the pfQuest addon database.

NO PYTHON REQUIRED - This .exe runs on any Windows PC!

================================================================================
                          FIRST TIME SETUP
================================================================================

STEP 1: Configure Paths
------------------------
1. Double-click "pfQuest Merger Tool.exe"
2. Click the "⚙ Settings" button
3. Configure these paths:

   Game Path: 
   Where your game .exe is located
   Example: D:\Games\Ascension\Live

   Addon Path:
   Where pfQuest addon is installed
   Example: D:\Games\Ascension\Live\Interface\AddOns\pfQuest-wotlk

   Game Executable:
   Name of your game's .exe file
   Example: Ascension.exe (or WoW.exe, etc.)

4. (Optional) Check "Start with Windows" to auto-start this tool

5. Click "Save"

STEP 2: Start Monitoring
-------------------------
1. Click "▶ Start Monitoring"
2. Leave the tool running

================================================================================
                          HOW TO USE
================================================================================

EVERY TIME YOU PLAY:
--------------------
1. Start "pfQuest Merger Tool.exe"
2. Click "▶ Start Monitoring" (if not auto-started)
3. Play your game normally
   - Accept quests
   - Complete objectives
   - Turn in quests
4. Close the game
5. Tool automatically extracts and merges quest data
6. Restart game - captured quests now permanent!

THE TOOL WILL SHOW:
-------------------
• When game starts/stops (in activity log)
• When merge begins
• Progress messages
• "✓ Merge complete!" when done

================================================================================
                          FEATURES
================================================================================

✓ Start/Stop Monitoring - One button control
✓ Configurable Paths - Easy settings dialog
✓ Activity Log - See everything that happens
✓ Windows Startup - Auto-start with Windows
✓ Path Validation - Test if paths are correct
✓ Portable - Move it anywhere, no installation

================================================================================
                          MENU OPTIONS
================================================================================

File Menu:
----------
• Settings - Configure paths and options
• Exit - Close the tool

Tools Menu:
-----------
• Install Dependencies - Install required packages (psutil)
• Test Paths - Verify your paths are correct
• Open Addon Folder - Open addon folder in explorer
• Clear Log - Clear the activity log

Help Menu:
----------
• Quick Start - Show quick start guide
• About - About this application

================================================================================
                          WHAT GETS CAPTURED
================================================================================

When you play the game, this tool automatically captures:

✓ Quest giver NPC (name, ID, location)
✓ Quest text and objectives
✓ Objective completion locations
✓ Turn-in NPC location
✓ Quest item drop sources
✓ Quest rewards

All with accurate zone detection!

================================================================================
                          TROUBLESHOOTING
================================================================================

Tool won't start?
→ Make sure "pfquest_db_merger.py" is in the same folder

"Invalid Path" error?
→ Click Settings and verify your paths
→ Click Tools → Test Paths

Game not detected?
→ Check Settings: Is the game executable name correct?
→ Look in Task Manager for the exact .exe name

Merge not happening?
→ Check the activity log for errors
→ Verify addon path points to pfQuest-wotlk folder
→ Make sure you've captured quests in-game first

"psutil not found"?
→ Click Tools → Install Dependencies
→ Wait for installation to complete
→ Restart the tool

Tool starts minimized?
→ Check system tray (bottom-right of screen)
→ Look for pfQuest Merger icon

================================================================================
                          WINDOWS STARTUP
================================================================================

To make the tool start automatically with Windows:

1. Click "⚙ Settings"
2. Check "Start with Windows (run on system startup)"
3. Check "Auto-start monitoring on launch" (optional)
4. Click "Save"

Now the tool will:
• Start when Windows starts
• (Optional) Begin monitoring automatically
• Run quietly in the background

To disable:
• Uncheck the option in Settings

================================================================================
                          FILE LOCATIONS
================================================================================

Required Files (keep together):
--------------------------------
pfQuest Merger Tool.exe     ← This program
pfquest_db_merger.py        ← Required (merger script)

Optional Files:
---------------
PFQUEST_COMPLETE_GUIDE.md   ← Full documentation
PFQUEST_SETUP_QUICK.md      ← Quick start guide
GUI_README.txt              ← GUI documentation

Configuration:
--------------
merger_config.json          ← Auto-created (stores your settings)

================================================================================
                          SYSTEM REQUIREMENTS
================================================================================

Windows 7 or later
No Python required (bundled in .exe)
No admin rights required
~15-20 MB disk space

================================================================================
                          SUPPORT & HELP
================================================================================

In-App Help:
• Click Help → Quick Start
• Click Help → About

Activity Log:
• Shows all events in real-time
• Color-coded: Green = success, Red = error

Settings:
• All paths configurable via GUI
• Test paths before starting

================================================================================

For complete documentation, see: PFQUEST_COMPLETE_GUIDE.md

Happy questing! 🎮


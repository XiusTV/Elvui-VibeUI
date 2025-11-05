================================================================================
                    pfQuest Enhanced Distribution Package
================================================================================

Thank you for downloading pfQuest Enhanced!

This package includes:
- pfQuest addon with automated quest capture
- Standalone merger tool (.exe - NO PYTHON REQUIRED)
- Command-line version (for advanced users)
- Complete documentation

================================================================================
                            WHAT'S INCLUDED
================================================================================

ADDONS (Copy to Interface\AddOns\):
------------------------------------
pfQuest-wotlk\          - Main addon with quest database
pfQuest-bronzebeard\    - Server-specific overrides (if included)

MERGER TOOL (Copy to Interface\):
----------------------------------
pfQuest-Tools\          - Quest capture merger tool
  ├── dist\                         ← .exe version (RECOMMENDED)
  │   └── pfQuest Merger Tool.exe  - Standalone app (no Python!)
  ├── Merger via CMD\               ← Python version (backup)
  └── Merger via EXE\               ← Build tools (developers)

================================================================================
                          QUICK START (3 MINUTES)
================================================================================

STEP 1: Install Addons
----------------------
Copy to your WoW Interface\AddOns\ folder:
- pfQuest-wotlk\
- pfQuest-bronzebeard\ (if included)

STEP 2: Install Merger Tool
---------------------------
Copy to your WoW Interface\ folder:
- pfQuest-Tools\

STEP 3: Run Merger Tool
------------------------
OPTION A - .exe Version (RECOMMENDED):
1. Go to: pfQuest-Tools\dist\
2. Double-click: pfQuest Merger Tool.exe
3. Click Settings → Configure your paths
4. (Optional) Check "Start with Windows"
5. Click Save
6. Click "Start Monitoring"

OPTION B - Python Version:
1. Install Python 3.7+ (https://python.org/downloads)
2. Go to: pfQuest-Tools\Merger via CMD\
3. Run: python -m pip install -r requirements.txt
4. Double-click: RUN_MERGER_HERE.bat

STEP 4: Configure pfQuest in WoW
---------------------------------
1. Start WoW and enable pfQuest addon
2. Type: /pfquest config
3. Enable "Show Available Quests" and "Show Low Level Quests"
4. Open world map - should see quest icons!

STEP 5: Play and Capture
-------------------------
1. Play WoW normally (accept/complete quests)
2. Close game
3. Merger automatically extracts and saves quest data
4. Restart → Captured quests now permanent!

================================================================================
                           DOCUMENTATION FILES
================================================================================

MAIN README:
------------
pfQuest-Tools\README.txt - Quick overview and folder guide

FOR USERS (.exe):
-----------------
pfQuest-Tools\dist\PFQUEST_COMPLETE_GUIDE.md - Full features & troubleshooting
pfQuest-Tools\dist\PFQUEST_SETUP_QUICK.md - Quick setup
pfQuest-Tools\dist\GUI_README.txt - GUI usage

FOR ADVANCED USERS (Python):
-----------------------------
pfQuest-Tools\Merger via CMD\README.txt - Command-line guide

FOR DEVELOPERS:
---------------
pfQuest-Tools\Merger via EXE\SETUP_GUIDE.md - Build instructions
pfQuest-Tools\Merger via EXE\EXE_BUILD_INSTRUCTIONS.md - Complete build guide
pfQuest-Tools\Merger via EXE\EXE_SUMMARY.md - Technical details

FOR SHARING:
------------
pfQuest-Tools\DISTRIBUTION_README.txt - This file
pfQuest-Tools\DISCORD_POST_SHORT.txt - Discord announcement

================================================================================
                            KEY FEATURES
================================================================================

CORE QUEST ADDON:
-----------------
✓ 10,000+ quests (Vanilla, TBC, WotLK)
✓ Quest locations on world map
✓ Quest tracker with routing
✓ Minimap integration
✓ Quest browser and search
✓ Database browser (items, NPCs, objects)
✓ Smart filtering (level, faction, class)

AUTOMATED QUEST CAPTURE:
------------------------
✓ Auto-detects new quests
✓ Captures quest giver NPC location
✓ Tracks objective completion spots
✓ Records quest item drop sources
✓ Saves turn-in NPC location
✓ Generates shareable database files

MERGER TOOL (.exe):
-------------------
✓ Graphical interface (easy to use)
✓ No Python required
✓ Configure paths via Settings dialog
✓ Start/Stop monitoring with button
✓ Activity log with color coding
✓ Can start with Windows
✓ Dependency installer built-in

MERGER TOOL (Python):
---------------------
✓ Lightweight command-line version
✓ Same functionality as .exe
✓ For advanced users who prefer scripts
✓ Easy to modify source code

================================================================================
                           ESSENTIAL COMMANDS
================================================================================

IN-GAME:
--------
/pfquest config          - Open configuration window
/pfquest history check   - View character's quest history
/pfquest history reset   - Reset character's quest history

/questcapture            - Open capture monitor
/questcapture status     - Show capture system status
/questcapture inject     - Make captured quests show immediately
/questcapture export     - Export as Lua code

QUEST TRACKER:
--------------
- Right-click title bar: Lock/unlock tracker
- Drag to move when unlocked
- Click quest: Show on map

================================================================================
                          HOW THE SYSTEM WORKS
================================================================================

TWO-STAGE CAPTURE:

STAGE 1: In-Game Capture
-------------------------
1. Accept quest → System captures data
2. Complete objectives → Tracks locations
3. Turn in quest → Captures everything
4. Quest shows on map immediately

STAGE 2: Merger Tool (Permanent Storage)
-----------------------------------------
1. Close game → Merger detects
2. Waits 10 seconds
3. Extracts data from SavedVariables
4. Generates: pfQuest-wotlk\db\captured\quests.lua
5. Next restart → Quests permanent for all characters!

WHAT GETS CAPTURED:
-------------------
✓ Quest giver NPC (name, ID, location with correct zone)
✓ Quest text, description, objectives
✓ Objective completion locations
✓ Quest item drop sources
✓ Turn-in NPC location
✓ Quest rewards and choices

================================================================================
                          SHARING YOUR SETUP
================================================================================

MINIMAL PACKAGE (For End Users):
---------------------------------
Give them:
  pfQuest-Tools\dist\                    ← Entire folder
  ├── pfQuest Merger Tool.exe           ← Standalone tool
  ├── pfquest_db_merger.py              ← Required script
  ├── PFQUEST_COMPLETE_GUIDE.md         ← Full guide
  └── ...

Recipients:
1. Copy dist\ folder to their Interface\
2. Rename to "pfQuest-Tools"
3. Double-click pfQuest Merger Tool.exe
4. Configure paths
5. Done!

COMPLETE PACKAGE:
-----------------
Give them entire pfQuest-Tools\ folder

Includes:
• .exe version (dist\)
• Python version (Merger via CMD\)
• Build tools (Merger via EXE\)
• All documentation

ADDON FILES:
------------
Also share:
  Interface\AddOns\pfQuest-wotlk\       ← Complete addon folder
  Interface\AddOns\pfQuest-bronzebeard\ ← If applicable

JUST YOUR CAPTURED QUESTS:
---------------------------
Share only:
  pfQuest-wotlk\db\captured\quests.lua

Recipients copy to their:
  Interface\AddOns\pfQuest-wotlk\db\captured\quests.lua

================================================================================
                        BUILDING THE .EXE YOURSELF
================================================================================

TO BUILD:
---------
1. Go to: pfQuest-Tools\Merger via EXE\
2. Double-click: BUILD_EXE.bat
3. Wait 1-2 minutes
4. Output: ..\dist\pfQuest Merger Tool.exe

REQUIREMENTS FOR BUILDING:
---------------------------
• Python 3.7+
• PyInstaller (auto-installed by BUILD_EXE.bat)
• psutil (auto-installed by BUILD_EXE.bat)

The build script checks and installs missing dependencies automatically!

OUTPUT LOCATION:
----------------
pfQuest-Tools\dist\pfQuest Merger Tool.exe

WHEN TO REBUILD:
----------------
• After modifying source code
• After updating merger logic
• To distribute latest version

================================================================================
                        USING THE PYTHON VERSION
================================================================================

FOR ADVANCED USERS:
-------------------
1. Go to: pfQuest-Tools\Merger via CMD\
2. Install Python 3.7+
3. Run: python -m pip install -r requirements.txt
4. Edit pfquest_db_merger.py (set GAME_PATH and ADDON_PATH)
5. Double-click: RUN_MERGER_HERE.bat

ADVANTAGES:
-----------
✓ Lightweight (~50 KB vs 15-20 MB)
✓ Fast startup
✓ Easy to modify
✓ See Python code

DISADVANTAGES:
--------------
✗ Requires Python installed
✗ Manual path editing
✗ Command-line only

RECOMMENDATION: Use the .exe version for easier setup!

================================================================================
                        SYSTEM REQUIREMENTS
================================================================================

FOR .EXE VERSION:
-----------------
• Windows 7 or later
• NO PYTHON REQUIRED
• ~20 MB disk space

FOR PYTHON VERSION:
-------------------
• Windows 7 or later
• Python 3.7+
• psutil package
• ~50 KB disk space

FOR WOW ADDON:
--------------
• World of Warcraft 3.3.5 (WotLK)

================================================================================
                        TROUBLESHOOTING
================================================================================

QUEST NOT SHOWING ON MAP:
--------------------------
1. /pfquest config → Enable "Show Available Quests"
2. /pfquest config → Enable "Show Low Level Quests"
3. /pfquest history check (character completed it?)
4. /reload or restart game

MERGER TOOL (.exe):
-------------------
"Could not add to startup" error?
→ Rebuild the .exe with latest version

Paths not saving?
→ Check Settings dialog, verify paths exist

Game not detected?
→ Verify game executable name in Settings

MERGER TOOL (Python):
---------------------
"psutil not found"?
→ python -m pip install psutil

"Path not found"?
→ Edit pfquest_db_merger.py
→ Update GAME_PATH and ADDON_PATH

Game not detected?
→ Check GAME_EXE in script
→ Verify exact .exe name from Task Manager

NPC DETECTION FAILED:
---------------------
• Always target/mouseover quest giver before accepting
• Enable debug: /run pfQuest_CaptureConfig.debug = true
• Check capture status: /questcapture status

PERFORMANCE/LAG:
----------------
Optimizations applied:
✓ Reduced routing update frequency
✓ Deferred quest capture processing
✓ Removed constant NPC monitoring
✓ Smart routing only for >3 nodes

If still laggy:
→ Disable smart routing: /pfquest config → Routes → Smart Routing OFF

================================================================================
                        FOLDER ORGANIZATION
================================================================================

YOUR INSTALL:
-------------
D:\Games\<YourGame>\Interface\
├── AddOns\
│   └── pfQuest-wotlk\              ← Addon
│       └── db\captured\
│           └── quests.lua          ← Captured quests saved here
└── pfQuest-Tools\                   ← Merger tool
    ├── dist\                        ← .exe here
    ├── Merger via CMD\              ← Python version
    └── Merger via EXE\              ← Build tools

WHAT TO SHARE:
--------------
FOR END USERS (Minimal):
  pfQuest-Tools\dist\                ← Just the dist folder
  pfQuest-wotlk\                     ← And the addon

FOR DEVELOPERS:
  pfQuest-Tools\                     ← Entire folder
  pfQuest-wotlk\                     ← And the addon

================================================================================
                        WORKFLOW SUMMARY
================================================================================

EVERY GAMING SESSION:
---------------------
1. Start pfQuest Merger Tool.exe (from dist\)
   OR
   Start RUN_MERGER_HERE.bat (from Merger via CMD\)

2. Click "Start Monitoring" (if using .exe)

3. Play WoW normally

4. Close game → Merger runs automatically

5. Restart game → Captured quests permanent!

SHARING YOUR CAPTURES:
----------------------
Share file: pfQuest-wotlk\db\captured\quests.lua

Recipients copy to same location and restart WoW.

================================================================================
                        VERSION COMPARISON
================================================================================

┌──────────────────┬─────────────────┬──────────────────┐
│ Feature          │ .exe (dist\)    │ Python (CMD\)    │
├──────────────────┼─────────────────┼──────────────────┤
│ Python Required  │ NO              │ YES              │
│ Interface        │ GUI             │ Command-line     │
│ Path Config      │ Settings UI     │ Edit script      │
│ File Size        │ ~15-20 MB       │ ~50 KB           │
│ User-Friendly    │ ⭐⭐⭐⭐⭐       │ ⭐⭐⭐            │
│ Location         │ dist\           │ Merger via CMD\  │
│ Recommended      │ YES             │ Advanced only    │
└──────────────────┴─────────────────┴──────────────────┘

================================================================================
                        FIRST RUN CHECKLIST
================================================================================

FOR .EXE VERSION:
-----------------
□ Copied pfQuest-Tools\ to Interface\
□ Opened dist\pfQuest Merger Tool.exe
□ Configured paths in Settings
□ Clicked "Start Monitoring"
□ Enabled pfQuest addon in WoW
□ Configured /pfquest config in-game
□ Tested: Map shows quest icons

FOR PYTHON VERSION:
-------------------
□ Copied pfQuest-Tools\ to Interface\
□ Installed Python 3.7+
□ Ran: python -m pip install psutil
□ Edited pfquest_db_merger.py (set paths)
□ Ran: RUN_MERGER_HERE.bat
□ Enabled pfQuest addon in WoW
□ Configured /pfquest config in-game
□ Tested: Map shows quest icons

================================================================================
                        BUILDING THE .EXE
================================================================================

LOCATION:
---------
pfQuest-Tools\Merger via EXE\

TO BUILD:
---------
1. Double-click: BUILD_EXE.bat
2. Wait 1-2 minutes
3. Output: ..\dist\pfQuest Merger Tool.exe

REQUIREMENTS:
-------------
• Python 3.7+
• PyInstaller (auto-installed)
• psutil (auto-installed)

The BUILD_EXE.bat script automatically:
✓ Checks for dependencies
✓ Installs missing packages
✓ Builds the .exe
✓ Copies files to dist\

NO MANUAL STEPS NEEDED!

REBUILD WHEN:
-------------
• You modify pfquest_merger_gui.py
• You modify pfquest_db_merger.py
• You want latest version
• Sharing with others

WHAT GETS CREATED:
------------------
dist\
├── pfQuest Merger Tool.exe       ← The application
├── pfquest_db_merger.py          ← Required script
├── PFQUEST_COMPLETE_GUIDE.md     ← Auto-copied
├── PFQUEST_SETUP_QUICK.md        ← Auto-copied
└── Other documentation files

================================================================================
                        SETUP GUIDES BY VERSION
================================================================================

.EXE VERSION:
-------------
See: dist\PFQUEST_COMPLETE_GUIDE.md
See: dist\PFQUEST_SETUP_QUICK.md
See: dist\GUI_README.txt

PYTHON VERSION:
---------------
See: Merger via CMD\README.txt

BUILD TOOLS:
------------
See: Merger via EXE\SETUP_GUIDE.md
See: Merger via EXE\EXE_BUILD_INSTRUCTIONS.md

================================================================================
                        DISTRIBUTION OPTIONS
================================================================================

OPTION 1: Minimal Package (End Users)
--------------------------------------
Share:
  pfQuest-Tools\dist\               ← Just this folder
  pfQuest-wotlk\                    ← And the addon

Size: ~20 MB
Contents: .exe + docs
Users: Just run the .exe

OPTION 2: Complete Package (All Users)
---------------------------------------
Share:
  pfQuest-Tools\                    ← Entire folder
  pfQuest-wotlk\                    ← And the addon

Size: ~25 MB
Contents: .exe + Python + build tools
Users: Choose .exe or Python version

OPTION 3: Just Captured Quests
-------------------------------
Share:
  pfQuest-wotlk\db\captured\quests.lua

Size: < 1 MB
Contents: Just your captured quest data
Users: Copy to their addon folder

================================================================================
                        RECIPIENT INSTRUCTIONS
================================================================================

FOR .EXE VERSION (Easiest):
---------------------------
1. Extract to: Interface\pfQuest-Tools\
2. Go to: pfQuest-Tools\dist\
3. Run: pfQuest Merger Tool.exe
4. Configure paths in Settings
5. Click "Start Monitoring"
6. Play WoW!

FOR PYTHON VERSION:
-------------------
1. Extract to: Interface\pfQuest-Tools\
2. Install Python 3.7+ (https://python.org/downloads)
3. Go to: pfQuest-Tools\Merger via CMD\
4. Run: python -m pip install -r requirements.txt
5. Edit pfquest_db_merger.py (set GAME_PATH, ADDON_PATH)
6. Run: RUN_MERGER_HERE.bat
7. Play WoW!

FOR CAPTURED QUESTS ONLY:
--------------------------
1. Copy quests.lua to: Interface\AddOns\pfQuest-wotlk\db\captured\
2. Restart WoW
3. Captured quests now show on map!

================================================================================
                        SUPPORT & HELP
================================================================================

DOCUMENTATION:
--------------
Main guide: dist\PFQUEST_COMPLETE_GUIDE.md
Quick setup: dist\PFQUEST_SETUP_QUICK.md

IN-GAME HELP:
-------------
/questcapture help       - Capture system commands
/run pfQuest_CaptureConfig.debug = true  - Enable debug mode

COMMON ISSUES:
--------------
See "TROUBLESHOOTING" section above
Or see: dist\PFQUEST_COMPLETE_GUIDE.md (comprehensive troubleshooting)

================================================================================
                        VERSION & CREDITS
================================================================================

pfQuest Enhanced v7.0.1
Based on pfQuest by Shagu (https://github.com/shagu/pfQuest)

ENHANCEMENTS:
• Automated quest capture system
• External merger tool (.exe + Python)
• Accurate zone ID calculation
• Per-character quest history
• Live database injection
• Capture monitor UI
• Export functionality
• Performance optimizations
• Enhanced configuration
• Comprehensive documentation

LICENSE:
GNU General Public License v3.0

DEPENDENCIES:
• Python 3.7+ (PSF License) - for Python version only
• psutil (BSD License) - for process monitoring
• PyInstaller (GPL License) - for building .exe

================================================================================

GETTING STARTED NOW:

1. Choose your version (dist\ .exe or Merger via CMD\ Python)
2. Follow the setup steps above
3. Read the appropriate guide
4. Start capturing quests!

Questions? See: dist\PFQUEST_COMPLETE_GUIDE.md

Happy questing! 🎮

================================================================================

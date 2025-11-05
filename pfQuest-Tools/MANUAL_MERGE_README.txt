================================================================================
                    pfQuest Manual Merge Tool
================================================================================

UPDATED PATHS: Scripts now use E:\ drive (your actual game location)

================================================================================

OPTION 1: Use the GUI Tool (Recommended)
================================================================================

1. Go to: pfQuest-Tools\dist\
2. Run: pfQuest Merger Tool.exe
3. It will use the paths from merger_config.json (already set to E:\)
4. Click "Start Monitoring"
5. Play WoW normally
6. Close WoW - tool auto-merges

The GUI tool is ALREADY configured for your E:\ drive!

================================================================================

OPTION 2: Manual Merge (Testing/Debugging)
================================================================================

If you want to test the merge WITHOUT closing WoW:

1. Make sure WoW is CLOSED (important!)
2. Run: TEST_MERGE_NOW.bat
3. It will attempt to merge SavedVariables immediately
4. Check for errors in the output

Note: Requires Python 3.7+ and psutil module
Install: python -m pip install psutil

================================================================================

CURRENT PATHS (Updated):
================================================================================

Game Path:    E:\Games\Ascension\Live
Addon Path:   E:\Games\Ascension\Live\Interface\AddOns\pfQuest-wotlk
SavedVars:    E:\Games\Ascension\Live\WTF\Account\*\SavedVariables\pfQuest-wotlk.lua

These paths are now set in:
- dist\pfquest_db_merger.py (E:\)
- Merger Via CMD\pfquest_db_merger.py (E:\)
- dist\merger_config.json (E:\)

================================================================================

VERIFY DATA EXISTS:
================================================================================

Check your SavedVariables file:
E:\Games\Ascension\Live\WTF\Account\XIUS\SavedVariables\pfQuest-wotlk.lua

Should contain:
- pfQuest_CapturedQuests = { ... }
- pfQuest_InjectedData = { ... }

If these exist, the merger can process them!

================================================================================

OUTPUT LOCATION:
================================================================================

After merge completes, check:
E:\Games\Ascension\Live\Interface\AddOns\pfQuest-wotlk\db\captured\quests.lua

This file will be automatically loaded by pfQuest on next /reload.

================================================================================


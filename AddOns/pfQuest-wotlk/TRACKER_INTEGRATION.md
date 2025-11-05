# Quest Tracker Integration - Complete

## Summary
The modern scrollable tracker from the "busted" version has been successfully integrated into both `pfQuest-wotlk` and `pfQuest-wotlk-busted`, with **ALL** the top bar functions from the original tracker now included.

## Changes Made

### Updated Files
1. **pfQuest-wotlk/tracker.lua** - Main tracker (also used by pfQuest-bronzebeard via dependency)
2. **pfQuest-wotlk-busted/tracker.lua** - Busted version tracker

### Top Bar Functions (ALL INCLUDED)

#### Left Side - Mode Switching Buttons
1. **Show Current Quests** (`btnquest`) - Shows active quests from your quest log
   - Icon: `tracker_quests.tga`
   - Highlights in cyan when active
   - Default mode on load

2. **Show Database Results** (`btndatabase`) - Shows database search results
   - Icon: `tracker_database.tga`
   - Switches tracker to DATABASE_TRACKING mode

3. **Show Quest Givers** (`btngiver`) - Shows available quest givers
   - Icon: `tracker_giver.tga`
   - Switches tracker to GIVER_TRACKING mode

#### Right Side - Utility Buttons
4. **Open Database Browser** (`btnsearch`) - Opens the quest database browser
   - Icon: `tracker_search.tga`
   - Opens `pfBrowser` window

5. **Clean Database Results** (`btnclean`) - Clears database search results from map
   - Icon: `tracker_clean.tga`
   - Removes PFDB nodes from map

6. **Open Settings** (`btnsettings`) - Opens pfQuest configuration panel
   - Icon: `tracker_settings.tga`
   - Opens `pfQuestConfig` window

7. **Close Tracker** (`btnclose`) - Hides the tracker
   - Icon: `tracker_close.tga`
   - Can be reopened with `/db tracker` command

## Modern Features Retained

### From Busted Version
- ✅ Scrollable content area for unlimited quests
- ✅ Resizable window (drag bottom-right corner)
- ✅ Movable via drag (unless locked)
- ✅ Lock/Unlock via right-click on title bar
- ✅ Expand/collapse individual quest objectives (click)
- ✅ Expand/collapse ALL quests (Shift+click)
- ✅ View quest on map (Ctrl+click)
- ✅ Quest entry pooling for performance
- ✅ Throttled updates to prevent stuttering
- ✅ Word-wrapped objectives (up to 2 lines)

### Interface Features
- Resize grip with visual indicators (3 diagonal lines)
- Comprehensive tooltips on all interactive elements
- Title bar with helpful usage instructions
- Saves position and size to config
- Persists expanded/collapsed state per quest

## Compatibility

### Dependencies
- Works with `pfQuest-wotlk` and `pfQuest-bronzebeard` (via dependency)
- Requires pfUI for button skinning and fonts
- Uses `pfMap`, `pfBrowser`, `pfQuestConfig`, and `pfDatabase` integration

### Modes
The tracker now supports 3 modes (from OG tracker):
1. **QUEST_TRACKING** - Shows active quests with progress
2. **DATABASE_TRACKING** - Shows database search results
3. **GIVER_TRACKING** - Shows available quest givers

## Configuration

All original config options are supported:
- `showtracker` - "0" or "1" to hide/show
- `trackeralpha` - Transparency (0.0 to 1.0)
- `trackerfontsize` - Font size (default 12)
- `trackerexpand` - Auto-expand objectives ("0" or "1")
- `trackerlevel` - Show quest levels ("0" or "1")
- `trackerpos` - Saved position {anchor, x, y}
- `trackersize` - Saved size {width, height}
- `lock` - Lock position/size (true/false)

## Slash Commands

- `/db tracker` - Toggle tracker visibility
- `/db lock` - Toggle lock state
- `/db trackerdebug` - Show debug information
- `/db trackershow` - Force show at default position

## Key Improvements Over OG Tracker

1. **Scrollable** - No limit on number of quests shown
2. **Resizable** - Adjust to your preferred size
3. **Better Performance** - Entry pooling and throttled updates
4. **Word Wrapping** - Long objectives wrap instead of truncate
5. **Modern UI** - Cleaner look with better visual feedback
6. **All Functions** - Retains ALL 7 top bar buttons from OG

## Testing Notes

When testing in-game:
1. Verify all 7 buttons appear on top bar
2. Test mode switching (Quest/Database/Giver)
3. Verify database search integration works
4. Test quest giver display
5. Confirm clean database button works
6. Check settings and browser buttons open their windows
7. Verify close/reopen with `/db tracker`

## Next Steps

If you encounter issues with quest objectives not showing on the map, we'll need to investigate:
1. The quest injection system
2. Map node rendering for quest objectives
3. Integration between tracker modes and map display

This is likely a separate system from the tracker UI itself.


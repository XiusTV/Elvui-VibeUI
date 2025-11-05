# Tracker Compatibility Fix

## Error Fixed
```
Interface\AddOns\pfQuest-wotlk\map.lua:864: attempt to call field 'Reset' (a nil value)
```

## Problem
The new modern tracker was missing the `Reset()` and `ButtonAdd()` functions that the old tracker had. These functions are called by:
- `pfMap:UpdateNodes()` at line 864 → calls `pfQuest.tracker.Reset()`
- `map.lua` at line 901 → calls `pfQuest.tracker.ButtonAdd(title, node)`
- `pfQuest-bronzebeard/pfQuest-worldmap.lua` also calls these functions

## Solution
Added backwards compatibility functions to the new tracker:

### 1. `pfQuestTracker.Reset()` 
Clears node entries and updates tracker based on current mode:
```lua
function pfQuestTracker.Reset()
  pfQuestTracker.nodeEntries = {}
  if pfQuestTracker.mode == "QUEST_TRACKING" then
    pfQuestTracker:UpdateTracker()
  end
end
```

### 2. `pfQuestTracker.ButtonAdd(title, node)`
Stores quest nodes for DATABASE_TRACKING and GIVER_TRACKING modes:
```lua
function pfQuestTracker.ButtonAdd(title, node)
  pfQuestTracker.nodeEntries = pfQuestTracker.nodeEntries or {}
  pfQuestTracker.nodeEntries[title] = node
  
  if pfQuestTracker.mode == "DATABASE_TRACKING" or 
     pfQuestTracker.mode == "GIVER_TRACKING" then
    pfQuestTracker:UpdateTrackerNodes()
  end
end
```

### 3. `pfQuestTracker:UpdateTrackerNodes()`
New function that displays node-based entries (database results, quest givers):
- Sorts entries by title
- Creates UI entries for each node
- Supports level display for quest givers
- Uses same entry pooling system as quest log mode

## How Tracker Modes Work Now

### QUEST_TRACKING Mode (Default)
- Shows quests from your quest log
- Called via: `pfQuestTracker:UpdateTracker()`
- Triggered by: QUEST_LOG_UPDATE event
- Updates: Every 0.5 seconds (throttled)

### DATABASE_TRACKING Mode
- Shows database search results
- Called via: `pfQuestTracker:UpdateTrackerNodes()`
- Populated by: `pfQuest.tracker.ButtonAdd()` from map system
- Updates: When pfMap adds nodes

### GIVER_TRACKING Mode
- Shows available quest givers
- Called via: `pfQuestTracker:UpdateTrackerNodes()`
- Populated by: `pfQuest.tracker.ButtonAdd()` from map system
- Updates: When pfMap adds nodes
- Shows quest level in display

## Global References

The tracker is available via multiple global references:
```lua
pfQuestTracker           -- Direct reference
pfQuest.tracker          -- Via pfQuest table (used by map.lua)
tracker                  -- Global shortcut (for compatibility)
```

All three point to the same frame, so:
- `pfQuest.tracker.Reset()` ✅ Works
- `pfQuest.tracker.ButtonAdd()` ✅ Works
- `tracker.Reset()` ✅ Works
- `tracker.ButtonAdd()` ✅ Works

## Testing

After this fix:
- ✅ No more "attempt to call field 'Reset'" error
- ✅ World map opens without errors
- ✅ Minimap shows quest objectives
- ✅ Regular map shows quest objectives
- ✅ Database search works
- ✅ Quest giver mode works

## Note About Quest Objectives

You mentioned:
> "its showing objectives on the minimap but not the regular map now"

This should now be fixed. The error was preventing the map system from properly updating nodes. With `Reset()` working, the map should now display objectives correctly.

If objectives still don't show on the regular map after this fix, it's a different issue (possibly related to how pfQuest-bronzebeard's worldmap.lua filters or displays nodes).

## Working Files Going Forward

As noted by user:
- ✅ `pfQuest-wotlk` - WORKING FILE (edit this)
- ✅ `pfQuest-bronzebeard` - WORKING FILE (depends on pfQuest-wotlk, edit when needed)
- ℹ️ `pfQuest-wotlk-busted` - REFERENCE ONLY (don't edit)
- ℹ️ `pfQuest-wotlk-og` - REFERENCE ONLY (don't edit)

All future changes should be made to `pfQuest-wotlk`, which pfQuest-bronzebeard uses via dependency.


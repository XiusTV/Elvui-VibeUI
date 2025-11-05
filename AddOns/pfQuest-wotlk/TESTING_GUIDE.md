# Quest Capture System - Testing Guide

## Quick Test (5 minutes)

### Before Testing
1. Load into game with pfQuest-wotlk or pfQuest-bronzebeard
2. Open chat and type `/questcapture status` to verify capture system is loaded

### Test 1: Quest Objectives Display ✅
**Goal**: Verify quest objectives show on map and tracker

1. Accept any quest with objectives (e.g. "Kill 10 wolves")
2. **Check**: Does the quest appear in the tracker?
3. **Check**: Does it show objectives (e.g. "0/10 wolves killed")?
4. **Check**: Do the objectives appear on the map/minimap?
5. Kill one objective target
6. **Check**: Does the tracker update (e.g. "1/10 wolves killed")?
7. **Check**: Does the map show where to find more targets?

**Expected**: ✅ All should work perfectly

---

### Test 2: Capture System Still Works 📸
**Goal**: Verify capture system still collects data

1. Type `/questcapture` to open the capture UI
2. **Check**: Does it show captured quests?
3. Accept a new quest
4. Wait 5 seconds
5. **Check**: Does the new quest appear in capture UI?
6. Complete an objective (kill a mob, collect an item)
7. Wait 10 seconds (objective tracking interval)
8. Type `/questcapture show <quest name>`
9. **Check**: Does it show objective locations?

**Expected**: ✅ All should work - data is captured

---

### Test 3: No Performance Issues 🚀
**Goal**: Verify no lag or stuttering

1. Accept 3-5 quests at once
2. **Check**: No lag spike when accepting quests?
3. During combat, check quest progress
4. **Check**: No stuttering when objectives update?
5. Open/close quest log rapidly
6. **Check**: Smooth performance?

**Expected**: ✅ No performance problems

---

### Test 4: Manual Injection Works 💉
**Goal**: Verify captured quests can be injected into database

1. Type `/questcapture status`
2. Note how many quests are captured
3. Type `/questcapture inject`
4. **Check**: Does it say "Injected X quests"?
5. Type `/db tracker` if tracker is hidden
6. Switch tracker to "Quest Givers" mode (top left button)
7. **Check**: Do the injected quests show as available on map?

**Expected**: ✅ Quests show on map after manual injection

---

## Detailed Test (15 minutes)

### Test 5: Multi-Quest Tracking
1. Accept 10+ quests with various objectives
2. **Check tracker**:
   - All quests appear?
   - Objectives visible?
   - Progress updates?
3. Complete some objectives
4. **Check map**:
   - Shows remaining objectives?
   - Markers update as you complete them?

**Expected**: ✅ Tracker and map work perfectly with many quests

---

### Test 6: Capture Data Integrity
1. Accept a quest
2. Note start NPC, objectives, rewards
3. Complete the quest
4. Type `/questcapture show <quest name>`
5. **Check captured data**:
   - Start NPC recorded?
   - End NPC recorded?
   - Objectives recorded?
   - Objective locations captured?

**Expected**: ✅ All quest data captured accurately

---

### Test 7: Export Functionality
1. Type `/questcapture export`
2. **Check**: Export window opens?
3. **Check**: Shows quest data in exportable format?
4. Press Ctrl+A to select all
5. **Check**: Text is selectable?

**Expected**: ✅ Export works for sharing data

---

## Regression Tests

### Test 8: Tracker Features
Test all tracker features still work:

**Top Bar Buttons**:
- [ ] Show Current Quests button works
- [ ] Show Database Results button works
- [ ] Show Quest Givers button works
- [ ] Open Database Browser button works
- [ ] Clean Database Results button works
- [ ] Open Settings button works
- [ ] Close Tracker button works

**Quest Interaction**:
- [ ] Click quest to expand/collapse objectives
- [ ] Shift+Click expands/collapses ALL quests
- [ ] Ctrl+Click shows quest on map
- [ ] Right-click title bar to lock/unlock
- [ ] Drag title bar to move
- [ ] Drag corner to resize

**Expected**: ✅ All buttons and features work

---

### Test 9: Database Search Integration
1. Open database browser (`/db search` or search button)
2. Search for a quest/item/NPC
3. Click "Database" mode on tracker
4. **Check**: Search results appear in tracker?
5. **Check**: Results show on map?
6. Click "Clean" button on tracker
7. **Check**: Database results cleared from map?

**Expected**: ✅ Database integration works

---

## Known Issues to Watch For

### ❌ If Quest Objectives DON'T Show
**Symptoms**:
- Quest appears in log but not on map
- Tracker shows quest but no objectives
- Map has no markers for quest targets

**Check**:
1. Is capture system disabled? `/questcapture toggle`
2. Are you in QUEST_TRACKING mode? (Click "Quests" button on top left)
3. Type `/db trackerdebug` to see tracker status

**Report**: If still broken, capture system optimization didn't work

---

### ❌ If Performance is Bad
**Symptoms**:
- Lag when accepting quests
- Stuttering during combat
- Freezes when opening quest log

**Check**:
1. Type `/questcapture debug` to see what's happening
2. Type `/db trackerdebug`
3. Note frequency of objective checks in debug output

**Report**: If excessive checks (>1 per second), optimization didn't apply

---

### ❌ If Capture Doesn't Work
**Symptoms**:
- Quests don't appear in capture UI
- No data recorded
- `/questcapture show <quest>` says "not found"

**Check**:
1. Is capture enabled? `/questcapture status`
2. Did you wait 10+ seconds after objective progress?
3. Type `/questcapture scan` to force a scan

**Report**: If still not capturing, capture system may be fully disabled

---

## Success Criteria

The optimization is **successful** if:

1. ✅ Quest objectives show on map and tracker
2. ✅ Objectives update as you progress
3. ✅ No lag or stuttering during questing
4. ✅ Capture system still records quest data
5. ✅ Manual injection works when you want it
6. ✅ All tracker features work normally
7. ✅ Database search integration works

The optimization has **failed** if:

1. ❌ Quest objectives missing from map
2. ❌ Lag when accepting/updating quests
3. ❌ Tracker shows quests but no objectives
4. ❌ Map has no objective markers

---

## Reporting Results

### If Everything Works ✅
Great! The optimization is successful. You can use the capture system safely:

```
/questcapture         # View captured quests
/questcapture inject  # Inject when you want to share
/questcapture export  # Export to contribute to pfQuest
```

### If Something Doesn't Work ❌
Report which test failed and provide:

1. **Test number** that failed
2. **Symptoms** you observed
3. **Debug output** from:
   ```
   /questcapture debug
   /db trackerdebug
   /questcapture status
   ```
4. **Quest name** if it's quest-specific
5. **Error messages** if any in chat

---

## Recommended Testing Sequence

1. **Quick Test** (5 min) - Verify basic functionality
2. If Quick Test passes → **Detailed Test** (15 min)
3. If Detailed Test passes → **Normal gameplay** (ongoing)
4. If any test fails → **Report with debug output**

---

## Normal Usage After Testing

Once testing confirms everything works:

### Daily Questing
- Quest normally, capture runs in background
- Objectives show on map automatically
- Tracker works as expected

### Weekly Maintenance
- Type `/questcapture` to review what's captured
- Type `/questcapture inject` to make new quests available
- Type `/questcapture export` to share data (optional)

### If You Notice Issues
- Type `/questcapture debug` to enable debug mode
- Look for errors or excessive messages
- Type `/questcapture status` to check health

---

## Performance Expectations

### Before Optimization
- 100+ objective checks per second
- Lag on quest acceptance
- Stuttering during combat
- Quest objectives broken

### After Optimization
- 0.1 objective checks per second (10 second intervals)
- Smooth quest acceptance
- No combat stuttering
- Quest objectives working perfectly

**You should feel a dramatic difference!**


# pfQuest Enhanced - Quick Setup Guide

**Get started in 5 minutes!**

---

## What This Is

**pfQuest Enhanced** = Quest database addon + Automated quest capture system

- Shows quest locations on map/minimap
- Quest tracker with routing
- **NEW**: Automatically captures quest data as you play
- **NEW**: Makes your captured quests permanent and shareable

---

## Installation (One Time)

### 1. Copy Addon Folders
```
Copy to: Interface\AddOns\
- pfQuest-wotlk\
- pfQuest-bronzebeard\ (if provided)
```

### 2. Copy Merger Tool
```
Copy to: Interface\
- pfQuest-Tools\
```

### 3. Install Python
- Download from: https://www.python.org/downloads/
- During install: **CHECK "Add Python to PATH"**
- Or use Microsoft Store version

### 4. Install Dependencies
Double-click: `pfQuest-Tools\RUN_MERGER_HERE.bat`

It will auto-install `psutil` (the only dependency).

---

## First Run

### In-Game:
1. Start WoW
2. At character select, enable `pfQuest` addon
3. Log in
4. Type: `/pfquest config`
5. Under "Map & Minimap" tab:
   - ✅ Show Available Quests
   - ✅ Show Quest Objectives
6. Open world map → Should see quest giver icons!

---

## Using the Quest Capture System

### Every Time You Play:

#### 1. Start Merger Tool (Before Game)
```
Double-click: Interface\pfQuest-Tools\RUN_MERGER_HERE.bat
```
Leave this window open.

#### 2. Play Normally
- Accept quests
- Complete objectives
- Turn in quests
- System captures everything automatically

#### 3. Check What's Captured (Optional)
```
In-game: /questcapture
```
Shows a window with all captured quests.

#### 4. Close the Game
Merger tool will detect game closed and:
- Extract captured quest data
- Generate permanent database file
- Make quests available to all characters

You'll see:
```
[timestamp] ✓ Ascension.exe closed
[timestamp] Waiting 10 seconds...
[timestamp] Found X captured quests
[timestamp] ✓ Merged X quests into pfDB
[timestamp] ✓ Merge complete!
```

#### 5. Restart Game
Your captured quests now show on the map for ALL characters!

---

## Key Commands

### In-Game:
```
/pfquest config          - Open configuration
/questcapture            - Show capture monitor
/questcapture status     - Check capture system
/questcapture inject     - Make captured quests show immediately
/questcapture export     - Export as Lua code
/questcapture help       - Show all commands
```

---

## How It Works (Simple)

### The Two-Stage System:

**Stage 1: In-Game (Temporary)**
```
You accept quest → Captured → Shows on map immediately
(Lost on /reload)
```

**Stage 2: External Merger (Permanent)**
```
You close game → Merger runs → Writes to addon files → Permanent!
(Survives /reload, game restart, reinstalls)
```

### What Gets Captured:
- ✅ Quest giver NPC (name, ID, location)
- ✅ Quest text and objectives
- ✅ Turn-in NPC location
- ✅ Objective completion locations
- ✅ Quest item drop sources
- ✅ Rewards

---

## Sharing Your Captured Quests

### To Share With Others:

**Send them this file:**
```
pfQuest-wotlk\db\captured\quests.lua
```

**They copy it to:**
```
Their Interface\AddOns\pfQuest-wotlk\db\captured\quests.lua
```

**They restart game → See your captured quests!**

---

## Troubleshooting

### Quest Not Showing on Map?

**Checklist:**
1. Enable quest givers: `/pfquest config` → Map & Minimap → ✅ Show Available Quests
2. Enable low-level quests: `/pfquest config` → General → ✅ Show Low Level Quests
3. Check character hasn't completed it: `/pfquest history check`
4. Restart game if you just merged

### Merger Tool: "ModuleNotFoundError: psutil"
```bash
python -m pip install psutil
```

### Merger Tool Not Detecting Game?
Edit `pfQuest-Tools\pfquest_db_merger.py`:
```python
GAME_PATH = r"D:\Your\Path\To\WoW"  ← Update this line
```

### Debug Mode:
```
/run pfQuest_CaptureConfig.debug = true
```
Shows detailed capture messages.

---

## Advanced Features

### Manual Quest Injection
```
/questcapture inject
```
Makes ALL captured quests show immediately (without waiting for game close).

### Export as Lua
```
/questcapture export
```
Generates pfDB-compatible Lua code you can copy/paste.

### Reset Quest History
```
/pfquest history reset
```
Clears current character's completed quest history (makes all quests show again).

### Clear Captured Data
```
/questcapture clear
```
Removes all captured quest data (fresh start).

---

## File Locations

### Your Captured Quests:
```
pfQuest-wotlk\db\captured\quests.lua  ← Share this file!
```

### SavedVariables (backup):
```
WTF\Account\<Account>\SavedVariables\pfQuest-wotlk.lua
```

### Merger Tool:
```
pfQuest-Tools\RUN_MERGER_HERE.bat  ← Start this every time
```

---

## Tips

### For Best Results:

1. **Always target/mouseover the quest giver** before accepting
   - Ensures NPC is captured correctly

2. **Complete objectives in different locations**
   - Captures multiple spawn points

3. **Let the merger finish** before restarting game
   - Wait for "✓ Merge complete!" message

4. **Share your captures** with the community
   - Help expand the quest database!

### Quest Tracker Tips:

- **Right-click title bar** to lock/unlock tracker
- **Drag** to move when unlocked
- **Shift+Drag edges** to resize
- **Click quest** to show on map
- **Right-click quest** to abandon

### Routing Tips:

- **Auto-route** to nearest quest objective
- **Hearthstone integration** for efficient turn-ins
- **Manual waypoints** for custom routes

---

## What's Next?

### After Setup:

1. ✅ Addon installed
2. ✅ Merger tool ready
3. ✅ First quests captured
4. ✅ Verified they show on map

### Keep Using:

- Start merger tool before each session
- Play normally
- Close game to merge data
- Restart to see permanent quests
- Share `db\captured\quests.lua` with friends!

---

## Full Documentation

For complete details, see:
```
pfQuest-Tools\PFQUEST_COMPLETE_GUIDE.md
```

Covers:
- Full feature list
- Technical details
- Advanced configuration
- Troubleshooting
- Data structures
- Contribution guidelines

---

**Questions? Enable debug mode:**
```
/run pfQuest_CaptureConfig.debug = true
/questcapture status
```

**Happy questing!** 🎮


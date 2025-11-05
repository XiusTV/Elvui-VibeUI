# pfQuest Complete Guide
## Enhanced Version with Automated Quest Capture System

---

## Table of Contents
1. [Overview](#overview)
2. [Feature List](#feature-list)
3. [Quest Capture System](#quest-capture-system)
4. [Installation & Setup](#installation--setup)
5. [How to Use](#how-to-use)
6. [Sharing with Others](#sharing-with-others)
7. [Troubleshooting](#troubleshooting)

---

## Overview

**pfQuest** is a comprehensive quest database and helper addon for World of Warcraft 3.3.5 (WotLK), enhanced with an automated quest capture and learning system that allows players to contribute new quest data without manual database editing.

### What Makes This Version Special

This enhanced version includes:
- **Automated Quest Capture**: Automatically records quest data as you play
- **Live Database Injection**: Captured quests appear on your map immediately
- **Permanent Storage**: External merger tool makes captured quests part of the addon
- **Shareable Database**: Contribute and share quest data with the community
- **Per-Character History**: Quest completion tracked separately for each character

---

## Feature List

### Core pfQuest Features

#### 1. **Quest Database**
- 10,000+ quests for Vanilla, TBC, and WotLK
- Quest locations (start and end NPCs)
- Quest objectives and rewards
- Quest level requirements
- Faction-specific quests

#### 2. **World Map Integration**
- Quest givers shown on world map
- Quest objective locations
- Turn-in locations
- Clickable icons to track quests
- Zone-based filtering

#### 3. **Minimap Integration**
- Quest givers on minimap
- Quest objectives
- Configurable icon size and transparency
- Right-click to show quest details

#### 4. **Quest Tracker**
- Movable, resizable quest tracker
- Lock/unlock with right-click on title bar
- Shows active quest objectives
- Progress tracking
- Color-coded by difficulty
- Clickable to show on map

#### 5. **Smart Routing System**
- Automatic quest route calculation
- Optimized turn-in order
- Hearthstone integration
- Flight path consideration
- Manual route adjustment
- Route import/export

#### 6. **Advanced Filtering**
- Show/hide low-level quests
- Show/hide high-level quests
- Filter by faction
- Filter by class
- Filter by profession
- Filter by event/holiday

#### 7. **Quest Browser**
- Browse all available quests by zone
- Search quests by name
- Filter by level range
- Favorite quests
- Quest chain visualization

#### 8. **Database Browser**
- Browse items, NPCs, objects
- Search by name or ID
- Show spawn locations on map
- Vendor information
- Loot tables

### Enhanced Features (This Version)

#### 9. **Automated Quest Capture System** ⭐
- **Automatic detection**: Detects when you accept new quests not in the database
- **NPC tracking**: Captures quest giver NPC (name, ID, location with correct zone)
- **Objective tracking**: Records where you complete each objective
- **Turn-in tracking**: Captures turn-in NPC location
- **Item drops**: Tracks quest item sources
- **Reward data**: Captures quest rewards and choices
- **Multi-zone support**: Accurate zone ID calculation for all continents

#### 10. **Live Database Injection**
- Runtime injection into pfDB
- Captured quests show on map immediately after accepting
- No `/reload` needed for immediate display
- Works like native database quests
- Per-character quest history (completed quests don't show)

#### 11. **Capture Monitor UI**
- Real-time display of captured quests
- Shows `[NEW!]` for uncaptured quests or `[DB]` for existing
- Displays start/end NPCs, quest items, objective locations
- Resizable window (drag bottom-right corner)
- Export function (generates pfDB-compatible Lua code)
- Inject function (push all captured quests to live database)
- Clear function (clear captured data)
- Refresh function (update display)

#### 12. **External Merger Tool** ⭐
- **Process monitoring**: Watches for game exe (doesn't touch it)
- **Automatic merging**: When game closes, extracts captured data
- **Permanent storage**: Writes to `db/captured/quests.lua`
- **Persistent across sessions**: Captured quests survive `/reload` and game restarts
- **Shareable**: Generated database file can be distributed

#### 13. **Configuration Enhancements**
- Tabbed config window (organized by category)
- RESET button for data management
- Reset configuration
- Reset quest history (per-character)
- Reset cache
- Reset everything
- No `/reload` needed for most config changes

#### 14. **Slash Commands**
```
/pfquest                    - Open quest browser
/pfquest config             - Open configuration window
/pfquest history check      - Check current character's quest history
/pfquest history reset      - Reset current character's quest history
/pfquest clean              - Clear all map nodes
/pfquest clean captured     - Clear only captured quest nodes
/pfquest clean all          - Clear everything (nodes + cache)
/pfquest reset config       - Reset configuration
/pfquest reset cache        - Clear database cache
/pfquest reset all          - Reset everything

/questcapture               - Toggle capture monitor window
/questcapture status        - Show capture system status
/questcapture scan          - Manually scan quest log for new quests
/questcapture inject        - Inject all captured quests into live database
/questcapture export        - Export captured quests as Lua code
/questcapture clear         - Clear all captured quest data
/questcapture show <quest>  - Show detailed quest info with locations
/questcapture check <quest> - Verify quest exists in database
/questcapture debugnpc <id> - Debug NPC data in database
/questcapture help          - Show all commands
```

---

## Quest Capture System

### How It Works

The quest capture system has two modes of operation:

#### Mode 1: Runtime Injection (In-Game, Temporary)
```
┌─────────────────────────────────────────┐
│ 1. You accept a quest                   │
│    ↓                                     │
│ 2. Capture system records:              │
│    - Quest giver NPC (name, ID)         │
│    - Your location (with correct zone)  │
│    - Quest text and objectives          │
│    ↓                                     │
│ 3. As you play:                          │
│    - Tracks objective completion spots  │
│    - Records quest item drops           │
│    ↓                                     │
│ 4. You turn in quest                     │
│    - Captures turn-in NPC               │
│    - Records rewards                     │
│    ↓                                     │
│ 5. Data saved to TWO places:            │
│    A. pfQuest_InjectedData              │
│       (SavedVariable - persistent)       │
│    B. pfDB (runtime only)               │
│       Quest shows on map immediately!    │
└─────────────────────────────────────────┘
```

**Result**: Quest shows on map right away, but runtime injection is lost on `/reload`.

#### Mode 2: External Merger (Permanent Storage)
```
┌─────────────────────────────────────────┐
│ 1. Merger tool monitors game process    │
│    ↓                                     │
│ 2. You close the game                    │
│    ↓                                     │
│ 3. Merger waits 10 seconds              │
│    (for SavedVariables to write)         │
│    ↓                                     │
│ 4. Reads: WTF\Account\...\              │
│           SavedVariables\                │
│           pfQuest-wotlk.lua              │
│    ↓                                     │
│ 5. Extracts pfQuest_InjectedData        │
│    ↓                                     │
│ 6. Generates pfDB-compatible format     │
│    ↓                                     │
│ 7. Writes to: pfQuest-wotlk\            │
│              db\captured\quests.lua      │
│    ↓                                     │
│ 8. Updates .toc to include file         │
│    ↓                                     │
│ 9. Next game start: Quests load from    │
│    addon files (permanent!)              │
└─────────────────────────────────────────┘
```

**Result**: Captured quests become permanent part of pfDB, work for all characters, survive reinstalls.

### Data Flow Diagram

```
GAME SESSION:
┌──────────────┐
│ Accept Quest │
└──────┬───────┘
       ↓
┌──────────────────────────────┐
│ Capture System               │
│ - NPC detection (4 methods)  │
│ - Zone ID (name lookup)      │
│ - Objective tracking         │
└──────┬───────────────────────┘
       ↓
┌──────────────────────────────┐
│ Complete & Turn In           │
└──────┬───────────────────────┘
       ↓
┌──────────────────────────────┐
│ Save to SavedVariables       │
│ pfQuest_InjectedData = {     │
│   quests = {                 │
│     loc = {[qid] = {...}},   │
│     data = {[qid] = {...}},  │
│   },                          │
│   units = {                  │
│     loc = {[npcID] = "..."}  │
│     data = {[npcID] = {...}} │
│   }                           │
│ }                             │
└──────┬───────────────────────┘
       ↓
┌──────────────────────────────┐
│ Runtime Injection (Optional) │
│ → pfDB[...] = data           │
│ → Shows on map immediately   │
└──────────────────────────────┘

AFTER CLOSING GAME:
┌──────────────────────────────┐
│ External Merger Tool         │
└──────┬───────────────────────┘
       ↓
┌──────────────────────────────┐
│ Read SavedVariables          │
└──────┬───────────────────────┘
       ↓
┌──────────────────────────────┐
│ Generate db\captured\        │
│ quests.lua                   │
│                              │
│ pfDB["quests"]["loc"][qid]   │
│ pfDB["quests"]["data"][qid]  │
│ pfDB["units"]["loc"][npcID]  │
│ pfDB["units"]["data"][npcID] │
└──────┬───────────────────────┘
       ↓
┌──────────────────────────────┐
│ PERMANENT STORAGE            │
│ (Part of addon files)        │
└──────────────────────────────┘

NEXT GAME START:
┌──────────────────────────────┐
│ Load db\captured\quests.lua  │
│ → Quests available to ALL    │
│ → Works like native DB       │
│ → Survives /reload           │
└──────────────────────────────┘
```

### NPC Detection Methods

The system uses 4 methods to capture quest giver NPCs reliably:

1. **GOSSIP_SHOW Event**: Caches NPC when you open gossip menu
2. **QUEST_GREETING Event**: Caches NPC when quest greeting appears
3. **PLAYER_TARGET_CHANGED**: Caches when you target an NPC
4. **UPDATE_MOUSEOVER_UNIT**: Caches when you mouseover an NPC

**Why multiple methods?** Different quest flows:
- Some NPCs show gossip menu before quest
- Some show quest directly
- Some require targeting
- This ensures reliable NPC capture in all cases

### Zone ID Calculation

**Problem**: `GetCurrentMapContinent()` returns the *open map's* zone, not the player's actual zone.

**Solution**: 
1. Force map to player's zone with `SetMapToCurrentZone()`
2. Use `pfMap:GetMapIDByName(zoneName)` as fallback
3. Lookup zone ID from zone name in pfDB.zones.loc

**Result**: Accurate zone IDs even when map is open to a different zone.

### Per-Character Quest History

**How it works:**
- `pfQuest_history` is a `SavedVariablesPerCharacter`
- Each character has their own completion history
- Quests in history are filtered from map display
- Commands:
  - `/pfquest history check` - View current character's history
  - `/pfquest history reset` - Clear current character's history

**Why this matters:**
- Character A completes "Stay a While" → won't see it on map
- Character B hasn't done it → WILL see it on map
- Prevents completed quests from showing for wrong characters

---

## Installation & Setup

### Requirements

1. **World of Warcraft 3.3.5** (WotLK)
2. **Python 3.7+** (for external merger tool)
3. **psutil Python package** (auto-installed by batch file)

### Installation Steps

#### Step 1: Install Addons

Copy these folders to `Interface\AddOns\`:
```
pfQuest-wotlk\        ← Main addon (WotLK database)
pfQuest-bronzebeard\  ← Server-specific overrides (optional)
```

#### Step 2: Install Merger Tool

Copy this folder to `Interface\`:
```
pfQuest-Tools\        ← External merger tool
```

#### Step 3: Install Python (if not already installed)

1. Download Python from: https://www.python.org/downloads/
2. During installation: **CHECK "Add Python to PATH"**
3. Or install from Microsoft Store (what you're using)

#### Step 4: Install Dependencies

The batch file auto-installs `psutil`, but you can also manually run:
```bash
python -m pip install psutil
```

### Folder Structure
```
D:\Games\Ascension\Live\Interface\
├── AddOns\
│   ├── pfQuest-wotlk\              ← Main addon
│   │   ├── questcapture.lua        ← In-game capture system
│   │   ├── database.lua            ← Database core
│   │   ├── quest.lua               ← Quest logic
│   │   ├── map.lua                 ← Map integration
│   │   ├── tracker.lua             ← Quest tracker UI
│   │   ├── config.lua              ← Configuration UI
│   │   ├── slashcmd.lua            ← Slash commands
│   │   ├── db\
│   │   │   └── captured\
│   │   │       └── quests.lua      ← Captured quests (generated)
│   │   └── pfQuest-wotlk.toc
│   │
│   └── pfQuest-bronzebeard\        ← Server overrides (optional)
│       └── ...
│
└── pfQuest-Tools\                   ← Merger tool
    ├── RUN_MERGER_HERE.bat         ← START THIS
    ├── pfquest_db_merger.py        ← Python script
    ├── requirements.txt            ← Dependencies
    ├── START_HERE.txt              ← Quick guide
    └── README_MERGER.md            ← Full documentation
```

---

## How to Use

### Basic Workflow

#### 1. Start the Merger Tool
```
Double-click: Interface\pfQuest-Tools\RUN_MERGER_HERE.bat
```

Leave this window open while playing.

#### 2. Play the Game Normally
- Accept quests
- Complete objectives (locations are auto-tracked)
- Turn in quests
- The capture system works silently in the background

#### 3. Check Captured Data (Optional)
```
In-game: /questcapture
```
This opens the capture monitor to see what's been captured.

#### 4. Close the Game

The merger tool will:
```
[timestamp] ✓ Ascension.exe closed
[timestamp] Waiting 10 seconds for files to save...
[timestamp] Found SavedVariables: ...
[timestamp] Reading SavedVariables...
[timestamp] Found X captured quests and Y NPCs
[timestamp] Generating pfDB-compatible file...
[timestamp] Successfully wrote captured quests to: pfQuest-wotlk\db\captured\quests.lua
[timestamp] ✓ Merged X quests and Y NPCs into pfDB
[timestamp] ✓ Merge complete!
```

#### 5. Restart the Game

Captured quests are now permanent! They:
- Show on the map for all characters
- Survive `/reload`
- Work exactly like native database quests
- Are filtered by per-character completion history

### Checking If It Worked

#### In-Game Check:
```lua
/run local q = 1660080; if pfDB.quests.data[q] then print("Quest "..q.." EXISTS in DB") else print("Quest "..q.." NOT in DB") end
```

#### Verify Quest Shows:
1. Log in on a character who hasn't done the quest
2. Open world map to the quest zone
3. Enable "Show Available Quests" in pfQuest config
4. Quest giver icon should appear on map

#### Debug Commands:
```
/questcapture check <quest name>     ← Check if quest is captured
/questcapture debugnpc <npc id>      ← Check NPC data in database
/pfquest history check               ← View character's quest history
```

### Configuration Options

#### Open Config:
```
/pfquest config
```

#### Key Settings:

**General Tab:**
- Quest database source
- Language selection
- Quest filtering (level, faction, class)
- Event quests

**Map & Minimap Tab:**
- Show quest givers on map
- Show available quests
- Show objectives
- Icon size and transparency
- Clustering options

**Quest Tracker Tab:**
- Enable/disable tracker
- Font size
- Show quest level
- Show distance
- Fade inactive objectives
- Lock/unlock tracker

**RESET Button:**
- Reset Configuration
- Reset Quest History (current character)
- Reset Cache
- Reset Everything

### Exporting Captured Data

#### Method 1: In-Game Export
```
/questcapture export
```
This opens a window with Lua code you can copy/paste.

#### Method 2: Automatic Export (Merger Tool)
The merger tool automatically creates `db\captured\quests.lua` with properly formatted pfDB data.

### Sharing Your Captured Quests

**To share with others:**

1. After capturing quests and running the merger, send them:
   ```
   pfQuest-wotlk\db\captured\quests.lua
   ```

2. They copy it to their:
   ```
   Interface\AddOns\pfQuest-wotlk\db\captured\quests.lua
   ```

3. The `.toc` file already includes this file, so it will load automatically.

4. They restart the game and see your captured quests!

---

## Sharing with Others

### What to Share

When sharing this pfQuest setup, provide:

#### 1. Core Files:
```
Interface\AddOns\pfQuest-wotlk\        ← Entire folder
Interface\AddOns\pfQuest-bronzebeard\  ← If using (server-specific)
Interface\pfQuest-Tools\               ← Entire folder
```

#### 2. Documentation:
```
Interface\pfQuest-Tools\PFQUEST_COMPLETE_GUIDE.md  ← This file
Interface\pfQuest-Tools\PFQUEST_SETUP_QUICK.md     ← Quick setup
Interface\pfQuest-Tools\README_MERGER.md           ← Merger details
```

### Setup Instructions for Recipients

**Create a simple README for them:**

```markdown
# pfQuest Enhanced - Quick Setup

## Installation
1. Copy `pfQuest-wotlk` folder to: `Interface\AddOns\`
2. Copy `pfQuest-bronzebeard` folder to: `Interface\AddOns\` (if provided)
3. Copy `pfQuest-Tools` folder to: `Interface\`
4. Install Python 3.7+ (https://www.python.org/downloads/)
   - CHECK "Add Python to PATH" during installation

## First Run
1. Start game, enable pfQuest addon
2. Configure: `/pfquest config`
3. Test: Open world map, should see quest icons

## Contributing Quest Data
1. Double-click: `Interface\pfQuest-Tools\RUN_MERGER_HERE.bat`
2. Play normally (accept and complete quests)
3. Close game (merger automatically extracts quest data)
4. Restart game (captured quests now permanent)

## Sharing Your Captures
- Send file: `pfQuest-wotlk\db\captured\quests.lua`
- Others copy to same location in their addon folder
- Restart game to see new quests

## Help
- In-game: `/questcapture help`
- Full guide: `pfQuest-Tools\PFQUEST_COMPLETE_GUIDE.md`
```

### Distribution Package

**Create a zip file with:**
```
pfQuest-Enhanced.zip
├── Interface\
│   ├── AddOns\
│   │   ├── pfQuest-wotlk\        ← Complete addon
│   │   └── pfQuest-bronzebeard\  ← If applicable
│   └── pfQuest-Tools\             ← Merger tool
│       ├── RUN_MERGER_HERE.bat
│       ├── pfquest_db_merger.py
│       ├── requirements.txt
│       ├── PFQUEST_COMPLETE_GUIDE.md
│       ├── PFQUEST_SETUP_QUICK.md
│       └── README_MERGER.md
│
└── README.txt                     ← Installation instructions
```

---

## Troubleshooting

### Common Issues

#### 1. Merger Tool: "ModuleNotFoundError: psutil"
**Solution:**
```bash
python -m pip install psutil
```
Or just run `RUN_MERGER_HERE.bat` - it auto-installs.

#### 2. Quest Not Showing on Map After Injection
**Checklist:**
- [ ] Quest giver icon enabled: `/pfquest config` → Map & Minimap → Show Available Quests
- [ ] Character hasn't completed it: `/pfquest history check`
- [ ] Quest in correct zone: `/questcapture debugnpc <id>` to verify zone ID
- [ ] Low-level quests enabled: `/pfquest config` → General → Show Low Level Quests
- [ ] Database reloaded: `/reload` or restart game

**Debug:**
```lua
/run local q = 1660080; print("Quest "..q.." min level:", pfDB.quests.data[q].min or "nil")
```
Should show `min level: 1` for captured quests.

#### 3. Quest Shows on Wrong Character
**Problem:** Character completed the quest but still sees it.

**Solution:**
```
/pfquest history reset
/reload
```

#### 4. Merger Tool: "Game path not found"
**Solution:** Edit `pfquest_db_merger.py`:
```python
GAME_PATH = r"D:\Games\Ascension\Live"  ← Update this
ADDON_PATH = r"D:\Games\Ascension\Live\Interface\AddOns\pfQuest-wotlk"  ← Update this
```

#### 5. Captured Data Not Persisting After `/reload`
**This is expected behavior!**
- Runtime injection is lost on `/reload`
- Use the merger tool to make it permanent
- Or just don't `/reload` until you're done playing

#### 6. NPC Detection Failed
**Debug messages:** Enable debug mode:
```
/run pfQuest_CaptureConfig.debug = true
```

Look for messages like:
```
[DEBUG] Failed to capture start NPC (no cached or target info)
```

**Solution:**
- Make sure you TARGET or MOUSEOVER the quest giver before accepting
- The system caches NPCs for 60 seconds
- If you use a quest starter item, NPC detection won't work (item-started quests)

#### 7. Wrong Zone ID Captured
**Symptoms:** Quest shows in wrong zone on map.

**Cause:** Zone ID was calculated from open map, not player's zone.

**Fixed in this version:** Zone detection now uses:
1. `SetMapToCurrentZone()` to force player's zone
2. `pfMap:GetMapIDByName(zoneName)` as fallback
3. Zone name lookup for accuracy

**Verify zone:**
```
/questcapture debugnpc <npcid>
```

#### 8. Merger Tool Stops Working
**Check:**
1. Is Python still installed?
2. Is `psutil` installed? Run: `python -c "import psutil; print('OK')"`
3. Is game path correct in script?
4. Are SavedVariables being written? Check: `WTF\Account\<Account>\SavedVariables\pfQuest-wotlk.lua`

### Getting Help

**In-game commands:**
```
/questcapture help       ← Show all capture commands
/pfquest help            ← Show pfQuest commands
```

**Debug mode:**
```
/run pfQuest_CaptureConfig.debug = true
```

**Check capture status:**
```
/questcapture status
```

**Verify database:**
```lua
/run print("Injected quests:", table.getn(pfQuest_InjectedData.quests.data or {}))
/run print("Captured quests:", table.getn(pfQuest_CapturedQuests or {}))
```

---

## Technical Details

### SavedVariables Structure

#### pfQuest_InjectedData (Account-wide)
```lua
pfQuest_InjectedData = {
  quests = {
    loc = {
      [questID] = {
        ["T"] = "Quest Title",
        ["D"] = "Quest Description",
        ["O"] = "Quest Objectives",
      }
    },
    data = {
      [questID] = {
        ["lvl"] = questLevel,
        ["min"] = 1,  -- Always 1 for captured quests
        ["start"] = {
          ["U"] = {npcID, ...}  -- Start NPCs
        }
      }
    }
  },
  units = {
    loc = {
      [npcID] = "NPC Name"
    },
    data = {
      [npcID] = {
        ["coords"] = {
          {x, y, zoneID, respawn},
          ...
        },
        ["lvl"] = "npcLevel"
      }
    }
  }
}
```

#### pfQuest_CapturedQuests (Account-wide)
```lua
pfQuest_CapturedQuests = {
  ["Quest Title"] = {
    title = "Quest Title",
    questID = 123456,
    level = 14,
    description = "...",
    startNPC = {
      name = "NPC Name",
      id = 292,
      type = "Humanoid",
      location = {x = 48.92, y = 52.66, zoneID = 1, zoneName = "Dun Morogh"}
    },
    endNPC = {...},
    objectives = {
      {text = "Objective 1: 3/3", type = "monster"},
      ...
    },
    objectiveLocations = {
      [1] = {
        text = "Objective 1",
        locations = {
          {x = 50, y = 60, zoneID = 1, zone = "Dun Morogh"},
          ...
        }
      }
    },
    questItems = {...},
    rewards = {...},
    choiceRewards = {...},
    timestamp = 1699123456
  }
}
```

#### pfQuest_history (Per-Character)
```lua
pfQuest_history = {
  [questID] = true,  -- Completed quests
  ...
}
```

### Database Integration Points

#### 1. Quest Filtering (`database.lua`)
```lua
function pfDatabase:QuestFilter(id, plevel, pclass, prace)
  -- Hide active quest
  if pfQuest.questlog[id] then return end
  
  -- Hide completed quests
  if pfQuest_history[id] then return end
  
  -- Skip level filter for injected quests (min == 1)
  if quests[id]["min"] ~= 1 and quests[id]["lvl"] and quests[id]["lvl"] < plevel - 4 and pfQuest_config["showlowlevel"] == "0" then
    return
  end
  
  -- ... other filters ...
  
  return true
end
```

#### 2. Quest Giver Display (`database.lua`)
```lua
function pfDatabase:SearchQuests(meta)
  for id in pairs(quests) do
    if pfDatabase:QuestFilter(id, plevel, pclass, prace) then
      -- Get quest start NPCs
      if quests[id]["start"] and quests[id]["start"]["U"] then
        for _, npcid in ipairs(quests[id]["start"]["U"]) do
          -- Add NPC to map
          pfDatabase:SearchMobID(npcid, meta, maps, prio)
        end
      end
    end
  end
end
```

#### 3. Map Node Creation (`map.lua`)
```lua
function pfMap:AddNode(meta)
  -- Creates map pins for quest givers, objectives, etc.
  -- Uses zone ID to place on correct map
  -- Filtered by pfDatabase:QuestFilter
end
```

### Merger Tool Logic

```python
def merge_into_pfdb(saved_vars_file):
    # 1. Read SavedVariables
    injected_data = extract_injected_data(saved_vars_file)
    
    # 2. Parse Lua tables
    parsed_data = parse_injected_data_detailed(content)
    
    # 3. Generate pfDB format
    db_content = generate_captured_db_file(injected_data, saved_vars_file)
    
    # 4. Write to db/captured/quests.lua
    output_file = os.path.join(ADDON_PATH, "db", "captured", "quests.lua")
    with open(output_file, 'w') as f:
        f.write(db_content)
    
    # 5. Update .toc if needed
    update_toc_file(output_file)
```

---

## Credits & License

### Original pfQuest
- **Author**: Shagu
- **Repository**: https://github.com/shagu/pfQuest
- **License**: GNU General Public License v3.0

### Enhanced Version
- **Quest Capture System**: Custom development
- **External Merger Tool**: Python script with process monitoring
- **Zone Detection Fix**: Accurate zone ID calculation
- **Per-Character History**: SavedVariablesPerCharacter implementation
- **Configuration Enhancements**: Tabbed UI, RESET functionality

### Dependencies
- **Python**: PSF License
- **psutil**: BSD License

---

## Version History

### v7.0.1 (Enhanced)
- ✅ Added automated quest capture system
- ✅ Added live database injection
- ✅ Added external merger tool
- ✅ Fixed zone ID calculation
- ✅ Implemented per-character quest history
- ✅ Added capture monitor UI
- ✅ Added export functionality
- ✅ Enhanced configuration window
- ✅ Added RESET button
- ✅ Fixed level filtering for injected quests
- ✅ Added comprehensive slash commands
- ✅ Added NPC detection fallbacks
- ✅ Added debug mode
- ✅ Documentation and setup guides

### v7.0.0 (Base)
- Original pfQuest for WotLK 3.3.5

---

## Appendix: File Locations

### Addon Files
```
Interface\AddOns\pfQuest-wotlk\
├── pfQuest-wotlk.toc           ← Addon manifest
├── questcapture.lua            ← Capture system
├── database.lua                ← Database core
├── quest.lua                   ← Quest logic
├── map.lua                     ← Map integration
├── tracker.lua                 ← Quest tracker
├── config.lua                  ← Configuration UI
├── slashcmd.lua                ← Slash commands
├── route.lua                   ← Routing system
├── db\
│   ├── init\                   ← Database files
│   └── captured\
│       └── quests.lua          ← YOUR captured quests
└── ...
```

### SavedVariables
```
WTF\Account\<YourAccount>\SavedVariables\
└── pfQuest-wotlk.lua           ← Contains pfQuest_InjectedData

WTF\Account\<YourAccount>\<Server>\<Character>\SavedVariables\
└── pfQuest-wotlk.lua           ← Contains pfQuest_history
```

### Merger Tool
```
Interface\pfQuest-Tools\
├── RUN_MERGER_HERE.bat         ← Launch script
├── pfquest_db_merger.py        ← Python merger
├── requirements.txt            ← Dependencies
└── *.md                        ← Documentation
```

---

**End of Guide**

For questions or issues, refer to the troubleshooting section or enable debug mode with `/run pfQuest_CaptureConfig.debug = true` to see detailed capture messages.


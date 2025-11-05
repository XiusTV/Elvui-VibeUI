# Quest Capture System

## Overview

The quest capture system is an automated quest learning system that records quest data as you play. It's designed to work **passively** without breaking pfQuest's core functionality.

## How It Works

### Stage 1: In-Game Capture (Passive)
- Automatically detects when you accept new quests
- Records quest details (title, description, level, objectives)
- Tracks NPC interactions (quest givers, turn-in NPCs with accurate coordinates and zone IDs)
- Monitors objective completion locations
- Tracks quest item drop sources
- Captures reward data

**Data is saved to:**
- `pfQuest_CapturedQuests` - Raw captured quest data
- `pfQuest_InjectedData` - Structured data ready for database merge

### Stage 2: External Merger Tool (Makes It Permanent)
- Reads captured data from SavedVariables
- Generates proper pfDB database files with correct structure
- Creates `db/captured/quests.lua` with quest data
- Properly formats objective structures (obj.U, obj.O, obj.I)
- Makes quests available for all characters

## Important: Why Auto-Injection is Disabled

**Auto-injection directly into pfDB was causing quest objectives to not display on the map.**

The problem was that live injection was:
1. Modifying pfDB tables while pfQuest was using them
2. Not creating proper objective structures that `SearchQuestID` requires
3. Calling `pfMap:UpdateNodes()` immediately, breaking pfQuest's update cycle

**Solution:**
- Quest capture saves data to SavedVariables only
- External merger tool properly formats and integrates the data
- Quest objectives work perfectly
- Captured quests become permanent after merger runs

## Usage

### In-Game Commands
```
/pfquest capture          - Open quest capture monitor UI
/pfquest capture scan     - Manually scan quest log
/pfquest capture export   - Export as Lua code
/pfquest capture clear    - Clear captured data
/pfquest capture status   - Show system status
```

### External Merger Tool

**Option 1: GUI (.exe) - Recommended**
1. Go to: `Interface\pfQuest-Tools\dist\`
2. Run: `pfQuest Merger Tool.exe`
3. Click Settings, configure paths
4. Click "Start Monitoring"
5. Play WoW normally
6. Close WoW - tool auto-merges captured data
7. Restart WoW - captured quests now permanent!

**Option 2: Python Script**
1. Go to: `Interface\pfQuest-Tools\Merger Via CMD\`
2. Run: `RUN_MERGER_HERE.bat`
3. Same workflow as GUI version

## What Gets Captured

### Quest Data
- Quest ID (detected from quest log link)
- Quest title and description
- Quest level and suggested level
- Quest objectives (text and type)
- Class restrictions (for class-specific quests)

### NPC Data
- Quest giver NPC (name, ID, coordinates, zone ID)
- Turn-in NPC (name, ID, coordinates, zone ID)
- Accurate zone ID calculation for all continents/instances
- NPC level and faction

### Objective Data
- Objective locations (tracked as you complete them)
- Monster kill locations
- Object interaction locations
- Quest item drop sources

### Reward Data
- Fixed rewards (items and amounts)
- Choice rewards (items you can choose from)

## Files

### Core Files
- `questcapture.lua` - Main capture system logic
- `questcapture-ui.lua` - Monitor UI interface

### Database Integration
Data flows: `In-Game Capture` → `SavedVariables` → `External Tool` → `db/captured/quests.lua` → `Available In-Game`

## Troubleshooting

### Quest objectives not showing on map?
- This happens if auto-injection is enabled
- Make sure auto-injection is disabled in `questcapture.lua`
- Use the external merger tool instead

### Captured quests not showing after merger?
- Make sure you `/reload` after the merger runs
- Check that `db/captured/quests.lua` was created
- Verify the quest isn't filtered by level/class restrictions

### Captured quests not persisting?
- Make sure merger tool ran successfully
- Check WTF folder for SavedVariables files
- Verify `pfQuest_InjectedData` exists in SavedVariables

## Technical Details

### SavedVariables
```lua
pfQuest_CapturedQuests = {
  ["Quest Title"] = {
    questID = 1234,
    title = "Quest Title",
    description = "Quest text...",
    level = 10,
    objectives = {...},
    startNPC = {id = 5678, name = "NPC Name", x = 45.2, y = 67.3, zoneID = 1519},
    endNPC = {...},
    rewards = {...},
    choiceRewards = {...},
  }
}

pfQuest_InjectedData = {
  quests = {
    loc = { [1234] = {T = "Quest Title", D = "Description", O = "Objectives"} },
    data = { [1234] = {lvl = 10, min = 1, start = {...}, end = {...}} }
  },
  units = {
    loc = { [5678] = "NPC Name" },
    data = { [5678] = {coords = {{45.2, 67.3, 1519, 0}}, lvl = "10"} }
  }
}
```

### Database Structure
The external merger tool converts `pfQuest_InjectedData` into proper pfDB format:
- Creates objective structures with unit/object/item IDs
- Formats coordinates correctly
- Adds proper quest relationships (start/end NPCs)
- Maintains database integrity

## Credits

**Quest Capture System:**
- Developed by XiusTV for Bronzebeard realm

**Original pfQuest:**
- Created by Shagu - [Original Repository](https://github.com/shagu/pfQuest)
- Database from VMaNGOS and CMaNGOS projects


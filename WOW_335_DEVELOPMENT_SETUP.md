# WoW 3.3.5 Addon Development Setup Guide

## Overview
This workspace is configured for developing World of Warcraft 3.3.5 (WotLK) addons on Ascension WoW (Bronzebeard realm).

## Required Extensions

### 1. **Lua Language Server (sumneko.lua)**
- **Extension ID:** `sumneko.lua`
- **Purpose:** Provides IntelliSense, linting, and code completion for Lua
- **Status:** ✅ Configured in `AddOns/.luarc.json`

### 2. **XML Tools (DotJoshJohnson.xml)**
- **Extension ID:** `DotJoshJohnson.xml`
- **Purpose:** Syntax highlighting and validation for WoW XML UI files
- **Used for:** `.xml`, `.toc` files

### 3. **Better Comments (aaron-bond.better-comments)**
- **Extension ID:** `aaron-bond.better-comments`
- **Purpose:** Enhanced comment highlighting
- **Optional but recommended**

### 4. **File Nesting (antfu.file-nesting)**
- **Extension ID:** `antfu.file-nesting`
- **Purpose:** Clean up file explorer view
- **Optional**

## Lua Language Server Configuration

The workspace is configured with `.luarc.json` in the `AddOns/` directory with:

### ✅ Runtime Settings
- **Lua Version:** 5.1 (WoW 3.3.5 uses Lua 5.1)
- **Special handling:** `reload` treated as `require`

### ✅ WoW 3.3.5 API Globals
Comprehensive list of WoW API functions including:
- **Core API:** `GetSpellInfo`, `UnitHealth`, `UnitAura`, `CreateFrame`
- **Action Bar API:** `GetActionInfo`, `HasAction`, `IsUsableAction`
- **Frame/UI:** `UIParent`, `GameTooltip`, `WorldFrame`
- **LibStub/Ace3:** `LibStub`, `AceLibrary`
- **ElvUI Specific:** `ElvUI`, `ElvDB`
- **Quest API:** `GetNumQuestLogEntries`, `GetQuestLogTitle` (for pfQuest)
- **Events:** All common WoW events

### ✅ Diagnostics
- Disabled: `lowercase-global`, `undefined-global` (WoW uses many globals)
- Warning: `redefined-local`
- Third-party checking disabled

## Project Structure

```
D:\Games\Ascension\Live\Interface\
├── AddOns/
│   ├── .luarc.json           ← Lua Language Server config
│   ├── ElvUI/                ← Main UI framework
│   │   └── Modules/
│   │       └── ActionBars/
│   │           ├── AuraTracker.lua      ← Custom countdown timer module
│   │           └── DebugHelper.lua      ← Debug commands
│   ├── ElvUI_OptionsUI/      ← ElvUI configuration interface
│   ├── pfQuest-wotlk/        ← Quest helper (WotLK version)
│   └── pfQuest-bronzebeard/  ← Bronzebeard-specific quests
├── CURSOR_HANDOFF_DOCUMENT.txt   ← Complete fix history
├── QUICK_START_FOR_NEXT_AGENT.txt ← Quick reference
└── TEST_CHECKLIST.txt        ← Testing procedures
```

## Important Files

### Documentation Files
- `CURSOR_HANDOFF_DOCUMENT.txt` - Complete debugging history and architecture
- `QUICK_START_FOR_NEXT_AGENT.txt` - Quick reference for AI assistants
- `TEST_CHECKLIST.txt` - Step-by-step testing procedures

### Working Files (Edit These)
- `AddOns/ElvUI/Modules/ActionBars/AuraTracker.lua` - Aura tracker module
- `AddOns/pfQuest-wotlk/` - WotLK quest database (working copy)
- `AddOns/pfQuest-bronzebeard/` - Bronzebeard quests (working copy)

### Reference Files (Read-Only)
- `AddOns/pfQuest-wotlk-og/` - Original pfQuest backup
- `AddOns/pfQuest-wotlk-busted/` - Broken version reference

## WoW 3.3.5 Specific Quirks

### Ascension Platform Differences
1. **Nil Caster Bug:** `UnitAura()` returns `nil` for caster even on your own auras
   - Workaround: Treat `nil` caster as yours
   
2. **Negative Timestamps:** ExpirationTime can be negative
   - Workaround: Validate `timeLeft > 0 and timeLeft < 86400`
   
3. **Spell Ranks:** All spells show rank in name: "Moonfire(Rank 14)"
   - Workaround: Strip ranks for matching: `spellName:match("^(.-)%(") or spellName`

### WoW 3.3.5 Lua Environment
- **No `continue`:** Lua 5.1 doesn't have `continue` - use `goto` or conditionals
- **No bitwise operators:** Use `bit` library: `bit.band()`, `bit.bor()`
- **`table.getn()` is deprecated:** Use `#table` instead
- **`arg` table:** Use `...` and `select()` for varargs

## Debug Commands

### ElvUI AuraTracker
```lua
/debugspells    -- MOST IMPORTANT: Shows spell-to-aura matching
/testautrack    -- Visual test of auraText rendering
/debugab        -- Full ActionBars diagnostic
/fixcount       -- Force reagent count display
/cleartest      -- Clear test mode
```

### General WoW
```lua
/reload         -- Reload UI (applies code changes)
/console        -- Open console (for advanced debugging)
/fstack         -- Show frame stack (what's under mouse)
/eventtrace     -- Trace events (performance debugging)
```

## Common Development Patterns

### 1. Module Registration (ElvUI)
```lua
local E = unpack(ElvUI)
local MyModule = E:NewModule('MyModule', 'AceEvent-3.0')

function MyModule:Initialize()
    if self.Initialized then return end
    self.Initialized = true
    -- Module code here
end

E:RegisterModule(MyModule:GetName(), function()
    MyModule:Initialize()
end)
```

### 2. Secure Buttons (Action Bars)
```lua
-- Must be careful in combat
if InCombatLockdown() then
    -- Queue changes for after combat
    return
end

-- Safe to modify
button:SetAttribute("type", "spell")
button:SetAttribute("spell", "Moonfire")
```

### 3. Font Strings (Text Display)
```lua
-- Create font string
local text = frame:CreateFontString(nil, "OVERLAY")
text:SetPoint("CENTER", frame, "CENTER")
text:FontTemplate(font, size, "OUTLINE")
text:SetText("Hello")
text:SetTextColor(1, 1, 1)  -- RGB (0-1 range)
```

### 4. Event Handling
```lua
-- Register events
self:RegisterEvent("UNIT_AURA")
self:RegisterEvent("PLAYER_TARGET_CHANGED")

-- Handle events
function MyModule:UNIT_AURA(event, unit)
    if unit == "target" then
        -- Do something
    end
end
```

## Current Projects

### 1. ElvUI AuraTracker ✅ (Needs Testing)
**Status:** Code fixed, awaiting user testing  
**Location:** `AddOns/ElvUI/Modules/ActionBars/AuraTracker.lua`  
**Purpose:** Shows countdown timers on action buttons for buffs/debuffs  
**Test:** `/reload` then `/debugspells` with Moonfire on target  

**Recent Fixes:**
- Fixed UIParent rendering (text now visible)
- Fixed Ascension nil caster bug
- Fixed spell rank matching
- Fixed negative timestamps
- Added comprehensive debugging

### 2. ButtonFacade Integration ✅ (Needs Testing)
**Status:** Code fixed, awaiting user testing  
**Location:** `AddOns/ElvUI/Modules/ActionBars/ActionBars.lua` (LAB_ButtonUpdate)  
**Purpose:** Keep reagent counts visible with ButtonFacade skins  
**Test:** Enable ButtonFacade, check if stack counts show  

**Recent Fixes:**
- Added count restoration in LAB_ButtonUpdate
- Added reload popup for skin changes
- Fixed Width=0 Height=0 bug

### 3. pfQuest Development 🔧 (Ongoing)
**Status:** Active development  
**Location:** `AddOns/pfQuest-wotlk/` and `AddOns/pfQuest-bronzebeard/`  
**Purpose:** Quest helper with Bronzebeard-specific data  
**Note:** Only edit working copies, not `-og` or `-busted` versions  

## Troubleshooting

### Lua Language Server Not Working
1. Check `.luarc.json` exists in `AddOns/` directory
2. Reload window: `Ctrl+Shift+P` → "Developer: Reload Window"
3. Check extension is installed: `sumneko.lua`
4. Check Lua extension status in bottom-right corner

### IntelliSense Not Showing WoW API
1. Ensure `.luarc.json` has comprehensive globals list
2. Check file is inside `AddOns/` directory
3. Restart Lua Language Server: `Ctrl+Shift+P` → "Lua: Restart Server"

### Code Changes Not Applying In-Game
1. Must use `/reload` after every change
2. Check for Lua errors: Red error text in chat
3. Run `/debugab` or `/testautrack` to verify module loaded
4. Check file saved (unsaved indicator in tab)

### "Undefined Global" Warnings
1. Add to `.luarc.json` `diagnostics.globals` array
2. Or disable: `diagnostics.disable: ["undefined-global"]`
3. Common for WoW API functions

## Testing Workflow

### Standard Testing Loop
1. **Edit** code in Cursor
2. **Save** file (`Ctrl+S`)
3. **Switch** to game window (`Alt+Tab`)
4. **Reload** UI (`/reload`)
5. **Test** with debug commands
6. **Check** for errors (red text in chat)
7. **Verify** functionality
8. **Repeat** if needed

### AuraTracker Testing
```bash
1. /reload
2. Target training dummy
3. Cast Moonfire
4. /debugspells          # Should show "MATCHES FOUND!"
5. Look at Moonfire button  # Should show countdown
```

### ButtonFacade Testing
```bash
1. /elvui → ActionBars → LBF Support
2. Enable ButtonFacade
3. Accept reload popup
4. Put potion on action bar
5. Check if stack number visible
6. Try /fixcount if needed
```

## Git Workflow (Not Set Up)
Currently no version control is configured. Consider:
- `.git` directory in workspace root
- `.gitignore` for SavedVariables and Cache
- Separate branches for ElvUI vs pfQuest work

## Performance Considerations

### OnUpdate Throttling
```lua
function MyModule:OnUpdate()
    if self.throttle and self.throttle > GetTime() then return end
    self.throttle = GetTime() + 0.1  -- Update 10x/second
    
    -- Your code here
end
```

### Event-Driven vs Polling
- **Prefer:** Event-driven (`RegisterEvent`)
- **Avoid:** Frequent OnUpdate polling
- **Exception:** Real-time countdown timers (AuraTracker uses 0.1s polling)

### Combat Lockdown
```lua
-- Check before modifying secure frames
if InCombatLockdown() then
    self:RegisterEvent("PLAYER_REGEN_ENABLED")  -- Wait for combat end
    return
end

function MyModule:PLAYER_REGEN_ENABLED()
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    -- Now safe to modify
end
```

## Additional Resources

### WoW 3.3.5 API Documentation
- **WoWWiki:** https://wowwiki-archive.fandom.com/wiki/World_of_Warcraft_API
- **WoWProgramming:** http://wowprogramming.com/docs.html (covers 3.3.5)
- **UI Object Reference:** http://wowprogramming.com/docs/widgets

### Ace3 Documentation
- **AceAddon:** Module/addon management
- **AceEvent:** Event handling
- **AceTimer:** Delayed/repeating timers
- **AceDB:** SavedVariables management
- **AceConfig:** Options UI

### LibStub
Pattern for library loading without dependencies:
```lua
local LibName = LibStub("LibName-1.0")
if not LibName then return end
```

## Support & Continuation

### For Next AI Assistant
Read these files in order:
1. `QUICK_START_FOR_NEXT_AGENT.txt` - Quick context
2. `CURSOR_HANDOFF_DOCUMENT.txt` - Complete history
3. `TEST_CHECKLIST.txt` - What needs testing
4. This file - Development environment

### For Human Developer
- All debug commands are in-game slash commands
- Documentation is inline in code files
- Check `.txt` and `.md` files for context
- Working files vs reference files distinction is critical

## Quick Reference Card

```
┌─────────────────────────────────────────────────────┐
│ WoW 3.3.5 Development Quick Reference               │
├─────────────────────────────────────────────────────┤
│ Lua Version:     5.1                                │
│ WoW Build:       3.3.5 (12340)                      │
│ Server:          Ascension WoW (Bronzebeard)        │
│ UI Framework:    ElvUI + Ace3                       │
│                                                      │
│ Key Commands:                                       │
│   /reload        Reload UI                          │
│   /debugspells   Test AuraTracker matching          │
│   /debugab       Full ActionBars diagnostic         │
│   /fstack        Show frame stack                   │
│                                                      │
│ Working Files:                                      │
│   - ElvUI/Modules/ActionBars/AuraTracker.lua        │
│   - pfQuest-wotlk/                                  │
│   - pfQuest-bronzebeard/                            │
│                                                      │
│ Reference Only:                                     │
│   - pfQuest-wotlk-og/                               │
│   - pfQuest-wotlk-busted/                           │
│                                                      │
│ Config:                                             │
│   - AddOns/.luarc.json (Lua LS settings)            │
│                                                      │
│ Docs:                                               │
│   - CURSOR_HANDOFF_DOCUMENT.txt (complete history)  │
│   - QUICK_START_FOR_NEXT_AGENT.txt (quick ref)     │
│   - TEST_CHECKLIST.txt (testing steps)              │
└─────────────────────────────────────────────────────┘
```

---

**Last Updated:** November 5, 2025  
**Workspace:** `D:\Games\Ascension\Live\Interface`  
**Primary Projects:** ElvUI AuraTracker, ButtonFacade Integration, pfQuest Bronzebeard


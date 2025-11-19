# ElvUI VibeUI - Development is halted on this project 

### Support: [Buy Me A Coffee](https://buymeacoffee.com/xius)

**Other WotLK 3.3.5 Addons by XiusTV:**

* [ElvUI VibeUI](https://github.com/XiusTV/Elvui-VibeUI) - Modern ElvUI configuration
* [Modern TSM](https://github.com/XiusTV/Modern-TSM-335) - Performance-optimized TradeSkillMaster
* [PFQuestie](https://github.com/XiusTV/PFQuestie) - Rework of Pfquest and Questie integrated together!

Interact with me on discord @ https://discord.gg/neEqeFFUsE for help related to all my addons!

---

# ElvUI VibeUI

**A comprehensive user interface replacement for World of Warcraft 3.3.5 (WotLK) with custom enhancements.**

## About This Branch

This is a **custom fork maintained exclusively by XiusTV** with modifications and enhancements specific to WotLK 3.3.5. This branch includes custom styling, performance improvements, and features tailored for the Ascension/Warcraft Reborn experience.

**⚠️ This is an independent project.** The original ElvUI developers (Elv, Bunny, and team) are not involved with this custom branch.

## Addons that have been integrated into VibeUI
You should **not** load these addons with this Elvui version seperately

- **Omen** | **Elvui Enhanced** | **Elvui AddonSkin**
- **Leatrix Plus** | **PortalBox** | **Tomtom**
- **Profession Menu** | **Mapster** | **Maginify WOTLK**
- **AutoQuest**

## Version

- **Version:** 1.4.0
- **Client:** WoW 3.3.5 (WotLK)
- **Maintained by:** XiusTV

## What's New in v1.4.0

### 🚀 Enhanced Systems & QoL
- Integrated ElvUI Enhanced feature set (toggleable) including Minimap Button Grabber, tooltip icons, progression info, and animated achievement bars
- Added action bar key press animations with configurable color, scale, and rotation
- Mailbox upgrades: Take All / Take Cash buttons, recent recipient history, and spam-safe automation
- Configurable error frame sizing, fonts, and movers directly in-game

### 🗺️ Map & Navigation Upgrades
- Cromulent-style zone info overlay in Mapster with level ranges, instance callouts, and fishing requirements
- World map warmup + expanded fog-clear preloading to eliminate first-open hitching

### ⚔️ Combat Utilities
- Totem bar border color shifts to red when the spell is out of range
- New "Train All" button at class trainers with cost preview and safe retry logic

## What's New in v1.3.2

### 🎯 Custom Buff Tracking for Reminder System
- **Custom Spell Tracking** - Add any buff to the 14 reminder slots (flasks, food, elixirs, etc.)
- **Add from Current Buffs** - Dropdown showing your active buffs with icons for easy selection
- **Manual Entry** - Input field to add buffs by name or spell ID even if you don't have them active
- **Easy Management** - Remove tracked spells via dropdown, real-time reminder updates
- **Smart Matching** - Case-insensitive buff name detection (e.g., "supreme power" works)
- **Location:** ElvUI → Buffs and Debuffs → Reminder → Custom Buff Tracking

**Example:** Track Flask of Supreme Power by selecting "Supreme Power" from your current buffs!

## What's New in v1.3.1

### 🎯 AuraTracker Enhancements
- **Black Color Preset** - Added black as a color choice for countdown timers
- **White Outline Toggle** - Option to invert outline color from black to white for better visibility
- **Menu Reorganization** - "Aura Tracker" moved to standalone tab under ActionBars (ElvUI → ActionBars → Aura Tracker)
- **Permanent Buff Fix** - Permanent buffs (shapeshifts, stances) no longer show text, only temporary buffs display countdown
- **Menu Cleanup** - Renamed "Raid Markers Bar" to "Raid Markers" for consistency

## What's New in v1.3.0

### 🎨 Major New Features
- **ButtonFacade Integration** - 30+ button skins for action bars with full customization
- **Omen Threat Meter** - Complete configuration embedded in ElvUI options menu
- **Quest Automation** - Auto-accept and complete quests with 700+ quest database (AutoQuest)
- **Comprehensive Commands Menu** - Complete command reference for all ElvUI features
- **Alphabetical Options Menu** - Reorganized for easier navigation

- **Aura Duration Tracker** - Shows buff/DoT time remaining directly on action bar buttons (in development)
  - Will display remaining time for your abilities on current target
  - Color-coded by urgency (green/yellow/red)
  - Options available in ActionBars → General Options → Aura Duration Tracker
  - *Note: Feature is being refined and will be fully functional in next update*

### 📍 Feature Locations
- **Quest Automation:** ElvUI → General → Automation → Quest Automation
- **PortalBox:** ElvUI → General → Miscellaneous
- **Omen:** ElvUI → Omen (full configuration)
- **Commands Reference:** ElvUI → Commands
- **ButtonFacade:** ElvUI → ButtonFacade or ActionBars → General Options → LBF Support

## Features

### Complete UI Replacement

- **Action Bars** - Fully customizable action bars with ButtonFacade skin support
- **Unit Frames** - Player, target, party, and raid frames with extensive options
- **Nameplates** - Enhanced nameplate system with styling and filtering
- **Bags** - Unified bag interface with sorting and searching
- **Chat** - Enhanced chat frames with URL detection and customization
- **Minimap & World Map** - Customizable map frames with advanced features
- **Data Texts** - Informative displays for various game statistics
- **Tooltips** - Enhanced tooltips with additional information
- **Auras** - Buff/debuff tracking and display
- **Skins** - Consistent UI skinning for all Blizzard frames

### Custom Enhancements (VibeUI)

- Mapster integration with fog clearing and coordinates
- Custom profile configurations
- Performance optimizations for WotLK
- VuhDo integration support
- Raid frame modules (Party, Raid, Raid-40, Raid Pets)

## Installation

1. Extract both `ElvUI` and `ElvUI_OptionsUI` folders to `Interface\AddOns`
2. Launch World of Warcraft
3. Complete the ElvUI installation wizard on first load
4. Configure through the options panel

## Configuration

Access ElvUI configuration:
- Type `/ec` or `/elvui` in-game
- Click the ElvUI button in the minimap menu

## Components

### ElvUI (Main Addon)
Core functionality and framework for the complete UI replacement.

### ElvUI_OptionsUI (Configuration)
Options interface for customizing all ElvUI features. Loads on demand.

## Credits

**This VibeUI Branch:**
- **Developed and maintained exclusively by XiusTV**
- Custom modifications, enhancements, and WotLK 3.3.5 optimizations

**Original ElvUI Framework:**
- **Created by Elv and Bunny** - Lead developers of original ElvUI
- oUF Framework Authors
- Ace3 Library Authors
- Community Contributors

This project is based on the ElvUI framework by Elv and Bunny but contains custom modifications and enhancements. This is not official ElvUI - it's a custom branch for WotLK 3.3.5.

## License

ElvUI is free software. Please respect the authors' work.

---

**For issues with this VibeUI branch, please open an issue on this repository.**

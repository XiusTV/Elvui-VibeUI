# Changelog

All notable changes to ElvUI VibeUI will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.2.0] - 2024-11-02

### Added
- **Party Frames Module** - Complete 5-player party unit frame system
  - Individual health, power, and buff/debuff tracking for all party members
  - Pet frames for each party member with full customization
  - Target frames for each party member
  - Customizable layout options (horizontal/vertical arrangements)
  - Role icons and ready check indicators
  - Full BuffIndicator and AuraWatch support
  - Smart visibility management based on group composition
  - Complete configuration panel in ElvUI options (`/ec → UnitFrames → Party`)

- **Raid Frames Module** - Standard raid frames supporting 1-25 players
  - Flexible group arrangements (1-5 groups of 5 players each)
  - Smart visibility based on raid size
  - Raid debuff highlighting with priority system
  - Class colors and role indicators
  - Heal prediction and incoming heal display
  - Full aura filtering and tracking
  - Customizable sorting and positioning
  - Complete configuration panel in ElvUI options (`/ec → UnitFrames → Raid`)

- **Raid-40 Frames Module** - Large raid support for 26-40 player raids
  - Optimized layout for massive groups
  - Separate configuration from standard raid frames
  - Smart switching based on raid size (auto-enables for 26+ players)
  - Compact display options for better screen real estate
  - All standard raid features (debuffs, heal prediction, etc.)
  - Complete configuration panel in ElvUI options (`/ec → UnitFrames → Raid-40`)

- **Raid Pet Frames Module** - Pet unit frames for all raid members
  - Automatic tracking of all raid member pets
  - Health and status monitoring for pets
  - Automatic visibility management (shows/hides based on pet existence)
  - Customizable positioning and appearance
  - BuffIndicator support for pet-specific auras
  - Complete configuration panel in ElvUI options (`/ec → UnitFrames → Raid Pet`)

### Changed
- Re-enabled `Load_Groups.xml` to include Party.lua, Raid.lua, Raid40.lua, and RaidPets.lua
- Updated `UnitFrames.lua` to restore BuffIndicator/AuraWatch updates for party, raid, and raid40 frames
- Re-enabled Blizzard default UI hiding for party frames (InterfaceOptionsStatusTextPanelParty)
- Restored conditional logic for party/raid/raid40 frame processing in profile updates

### Technical Details
- Modified `Modules/UnitFrames/Groups/Load_Groups.xml`:
  - Uncommented `<Script file="Party.lua"/>`
  - Uncommented `<Script file="Raid.lua"/>`
  - Uncommented `<Script file="Raid40.lua"/>`
  - Uncommented `<Script file="RaidPets.lua"/>`
  
- Modified `Modules/UnitFrames/UnitFrames.lua`:
  - Re-enabled party/raid/raid40 aura watch updates (lines 1051-1054)
  - Re-enabled Blizzard party frame interface hiding (lines 1487-1491)
  
- Modified `ElvUI_OptionsUI/UnitFrames.lua`:
  - Removed `if false then` wrapper from party frames configuration section
  - Removed `if false then` wrapper from raid frames configuration section
  - Removed `if false then` wrapper from raid40 frames configuration section
  - Removed `if false then` wrapper from raidpet frames configuration section
  - All 4 group frame configuration panels now fully accessible in options

### Files Modified
- `ElvUI/Modules/UnitFrames/Groups/Load_Groups.xml`
- `ElvUI/Modules/UnitFrames/UnitFrames.lua`
- `ElvUI_OptionsUI/UnitFrames.lua`
- `ElvUI/ElvUI.toc` (version bump to 1.2.0)
- `ElvUI_OptionsUI/ElvUI_OptionsUI.toc` (version bump to 1.2.0)

---

## [1.1.0] - 2024-11-02

### Removed
- **Harlem Shake Easter Egg Feature**
  - Removed `/harlemshake` chat command
  - Removed `Core/AprilFools.lua` file entirely
  - Removed `HARLEM_SHAKE` static popup dialog
  - Removed HarlemShake sound file (`Media/Sounds/HarlemShake.ogg`)
  - Removed command registration from `Core/Commands.lua`
  - Cleaned up media references in `Media/SharedMedia.lua`

- **Hello Kitty Easter Egg Feature**
  - Removed `/hellokitty` chat command
  - Removed `/hellokittyfix` chat command
  - Removed `HELLO_KITTY` static popup dialog
  - Removed `HELLO_KITTY_END` static popup dialog
  - Removed Hello Kitty initialization code from `Core/Core.lua`
  - Removed Hello Kitty sound file (`Media/Sounds/HelloKitty.ogg`)
  - Removed Hello Kitty texture files:
    - `Media/Textures/HelloKitty.tga`
    - `Media/Textures/helloKittyChat.tga`
    - `Media/ChatLogos/HelloKitty.tga`
  - Removed localization strings from all language files (enUS, zhTW, zhCN, ruRU, ptBR, koKR, frFR, esMX, deDE)
  - Cleaned up media references in `Media/SharedMedia.lua`

### Changed
- **Author Credits** - Added Xius to the author list
  - Updated `ElvUI/ElvUI.toc`: `## Author: Elv, Bunny, Xius`
  - Updated `ElvUI_OptionsUI/ElvUI_OptionsUI.toc`: `## Author: Elv, Bunny, Xius`
  - Updated README.md credits section

### Technical Details
- Deleted `ElvUI/Core/AprilFools.lua`
- Modified `ElvUI/Core/StaticPopups.lua` - removed 3 popup dialogs
- Modified `ElvUI/Core/Commands.lua` - removed 3 command registrations
- Modified `ElvUI/Media/SharedMedia.lua` - removed 5 media references
- Modified `ElvUI/Core/Core.lua` - removed Hello Kitty initialization code (lines 1216-1223)
- Modified 9 localization files - removed Hello Kitty revert message string
- Deleted 5 media files (2 sounds, 3 textures)

### Files Deleted
- `ElvUI/Core/AprilFools.lua`
- `ElvUI/Media/Sounds/HarlemShake.ogg`
- `ElvUI/Media/Sounds/HelloKitty.ogg`
- `ElvUI/Media/Textures/HelloKitty.tga`
- `ElvUI/Media/Textures/helloKittyChat.tga`
- `ElvUI/Media/ChatLogos/HelloKitty.tga`

### Files Modified
- `ElvUI/Core/StaticPopups.lua`
- `ElvUI/Core/Commands.lua`
- `ElvUI/Media/SharedMedia.lua`
- `ElvUI/Core/Core.lua`
- `ElvUI/Locales/enUS.lua`
- `ElvUI/Locales/zhTW.lua`
- `ElvUI/Locales/zhCN.lua`
- `ElvUI/Locales/ruRU.lua`
- `ElvUI/Locales/ptBR.lua`
- `ElvUI/Locales/koKR.lua`
- `ElvUI/Locales/frFR.lua`
- `ElvUI/Locales/esMX.lua`
- `ElvUI/Locales/deDE.lua`
- `ElvUI/ElvUI.toc` (version bump to 1.1.0, author update)
- `ElvUI_OptionsUI/ElvUI_OptionsUI.toc` (version bump to 1.1.0, author update)

---

## [1.0.0] - 2024-11-02

### Initial Release
Complete UI replacement addon for World of Warcraft 3.3.5a (WotLK)

### VibeUI Custom Features

This customized version includes several integrated plugins that are built directly into ElvUI VibeUI:

- **ElvUI_AddOnSkins** - Complete addon skinning system integrated directly
  - Automatically skins popular addons to match ElvUI's look
  - Supports WeakAuras, Details, DBM, Skada, and 50+ other addons
  - No separate addon required - fully built-in
  - Configurable through ElvUI options panel

- **ElvUI_RaidMarkers** - Raid marker bar module built-in and ready to use
  - Quick access bar for placing world markers
  - Customizable positioning and appearance
  - One-click marker placement and clearing
  - Integrated into ElvUI without additional addons

- **Mapster with Magnify-WotLK** - Enhanced world map and minimap features fully integrated
  - World map enhancements with better functionality
  - Minimap magnification and customization
  - Coordinate display and tracking improvements
  - Fog of war toggle and exploration features
  - All features built directly into the core addon

- **ProfessionMenu** - Integrated profession menu system
  - Removes the need for profession shortcuts on action bars
  - Easy access to all professions through dedicated menu
  - Frees up valuable action bar space
  - Built directly into ElvUI interface

### Added

#### Core Modules
- **Action Bars Module**
  - Fully customizable action bars (1-10)
  - Pet bar with full customization options
  - Stance/Form bar support for all classes
  - Totem bar for shamans with customizable layouts
  - Micro bar (character, spellbook, talents, etc.)
  - Keybind mode for easy key binding
  - Mouseover functionality for bars
  - Bar visibility conditions and fading options

- **Unit Frames Module** (oUF-based)
  - Player frame with full customization
  - Target and Target of Target frames
  - Focus and Focus Target frames
  - Pet and Pet Target frames
  - Boss frames (1-5 bosses)
  - Arena frames (1-5 opponents)
  - Tank frames (raid main tanks)
  - Assist frames (raid assist targets)
  - Extensive customization for all frame types:
    - Health/Power bar customization
    - Portrait options (2D/3D)
    - Aura filtering and positioning
    - Castbar customization
    - Class resource displays (combo points, holy power, etc.)
    - Debuff highlighting
    - Range fading
    - Threat indicators

- **Nameplates Module**
  - Complete nameplate overhaul with oUF framework
  - Style filters for conditional formatting
  - Threat detection and coloring
  - Class colors for players
  - Aura tracking on nameplates
  - Target highlighting
  - Quest indicator support
  - Customizable fonts, textures, and colors
  - Smart positioning and stacking

- **Bags Module**
  - Unified bag interface combining all bags
  - Bank integration with full customization
  - Item sorting by multiple criteria
  - Search functionality with item filters
  - Reverse slot order option
  - Bag bar for quick bag access
  - Item level display
  - Junk item identification
  - Scrap/vendor functionality

- **Chat Module**
  - Enhanced chat frames with tabs
  - URL detection and copying
  - Chat emoji support (70+ emojis)
  - Tab customization and coloring
  - Chat panel datatexts
  - Separate whisper windows option
  - Combat log enhancements
  - Copy chat functionality
  - Channel abbreviations
  - Sticky channels

- **Maps Module**
  - Customizable minimap with multiple shapes
  - World map enhancements
  - Coordinates display (player position)
  - Instance difficulty indicator
  - Combat fade options
  - Mouseover/hover functionality
  - Zone text positioning
  - Calendar integration
  - Tracking icons customization

- **DataBars Module**
  - Experience bar with level progress
  - Reputation bar with faction tracking
  - Pet experience bar (for hunter/warlock pets)
  - Customizable positioning anywhere on screen
  - Mouseover text display
  - Click functionality for easy interaction

- **DataTexts Module**
  - 25+ built-in datatext options:
    - Gold tracking
    - Durability monitoring
    - Friends list
    - Guild info
    - System stats (FPS, latency)
    - Bag space
    - And many more...
  - Customizable panels (up to 8 text positions)
  - Left-click and right-click actions
  - Detailed tooltip information
  - Auto-hide in combat option

- **Auras Module**
  - Buff display with filtering
  - Debuff display with type coloring
  - Consolidated buffs option
  - Custom aura filtering system
  - Wrap after X auras setting
  - Mouseover functionality
  - Duration display options
  - Grow direction options

- **Tooltip Module**
  - Enhanced tooltips with additional info
  - Item level display for equipment
  - Spell ID display for abilities
  - Guild ranks and info
  - Player titles
  - Talent specialization
  - Health bar on unit tooltips
  - Cursor anchor option
  - Custom positioning

- **Skins Module**
  - Consistent UI skinning for 150+ Blizzard frames
  - Addon skins support for popular addons:
    - WeakAuras integration
    - Details (damage meter) integration
    - DBM (Deadly Boss Mods) integration
    - Skada integration
    - And many more...
  - Custom texture and color support
  - Template system for consistent look

- **Blizzard Module** (Enhanced Blizzard UI elements)
  - Alert frame customization
  - Capture bar enhancements
  - Durability frame
  - GM frame
  - Kill/Honor frame improvements
  - Vehicle seat indicator
  - Watch frame (quest objectives)
  - Achievement frame enhancements
  - Archaeology bar

- **Misc Module**
  - Experience/reputation gain notifications
  - Loot roll enhancements
  - Automation features (auto-repair, auto-sell gray)
  - Threat meter integration
  - Error frame filtering
  - Already known item coloring
  - Item level display
  - Merchant frame improvements
  - And many more quality of life features

#### Core Features
- **Installation Wizard** - First-time setup guide
- **Profile System** - Save and switch between multiple setups
- **Layout System** - Pre-configured layouts (DPS, Healer, Tank)
- **Mover System** - Drag-and-drop positioning for all frames
- **Developer Tools** - Frame debugging and development utilities
- **Plugin Support** - LibElvUIPlugin for addon integration
- **Extensive Options** - Nearly every aspect is customizable

#### Embedded Libraries
- **Ace3 Framework**
  - AceAddon-3.0 (addon management)
  - AceConfig-3.0 (configuration system)
  - AceConfigDialog-3.0 (config GUI)
  - AceDB-3.0 (database management)
  - AceDBOptions-3.0 (profile management)
  - AceEvent-3.0 (event handling)
  - AceHook-3.0 (function hooking)
  - AceLocale-3.0 (localization)
  - AceTimer-3.0 (timer management)
  - AceSerializer-3.0 (data serialization)
  - CallbackHandler-1.0
  - LibStub

- **oUF Framework** - Unit frame framework
- **LibSharedMedia-3.0** - Shared media library (fonts, textures, sounds)
- **LibActionButton-1.0** - Action button library
- **LibAuraInfo-1.0** - Aura information library
- **LibDataBroker-1.1** - Data broker for addons
- **LibDualSpec-1.0** - Dual specialization support
- **LibElvUIPlugin-1.0** - Plugin framework
- **LibItemSearch-1.2** - Item search functionality
- **LibSpellRange-1.0** - Spell range detection
- **LibCompress** - Data compression
- **LibBase64-1.0** - Base64 encoding/decoding
- **LibChatAnims** - Chat animations
- **LibSimpleSticky** - Sticky frames
- **LibTranslit-1.0** - Text transliteration
- **UTF8** - UTF-8 string handling

#### Chat Commands
- `/ec` or `/elvui` - Toggle configuration GUI
- `/rl` or `/reloadui` - Reload the UI
- `/moveui` - Open movable frames options
- `/bgstats` - Toggle Battleground datatexts
- `/egrid` - Toggle alignment grid
- `/farmmode` - Toggle Minimap farm mode
- `/in <seconds> <command>` - Delayed command execution
- `/enable <addon>` - Enable an addon
- `/disable <addon>` - Disable an addon
- `/luaerror on/off` - Toggle Lua errors
- `/cpuimpact` - Toggle CPU impact calculations
- `/cpuusage` - Calculate CPU usage
- `/resetui [module]` - Reset frame positions

#### Localization
- Full translations for 9 languages:
  - English (enUS)
  - Chinese Traditional (zhTW)
  - Chinese Simplified (zhCN)
  - Russian (ruRU)
  - Portuguese Brazilian (ptBR)
  - Korean (koKR)
  - French (frFR)
  - Spanish Mexican (esMX)
  - German (deDE)

### Technical Information
- **Interface Version:** 30300 (WotLK 3.3.5a)
- **Game Version:** World of Warcraft 3.3.5a
- **Tested Server:** Ascension.gg Warcraft Reborn
- **Dependencies:** None (fully standalone)
- **Optional Dependencies:** SharedMedia, Tukui, ButtonFacade
- **Saved Variables:** ElvDB, ElvPrivateDB
- **Saved Variables Per Character:** ElvCharacterDB
- **Load on Demand:** ElvUI_OptionsUI (configuration interface)

### Credits
- **Elv** - Original ElvUI Lead Developer
- **Bunny** - Original ElvUI Co-Developer
- **Xius** - VibeUI Customization and Maintenance
- oUF Framework Authors (haste, lightspark, etc.)
- Ace3 Library Authors (nevcairiel, mikk, ammo, etc.)
- Community Contributors and Testers

---

## Version Format

This project uses [Semantic Versioning](https://semver.org/):
- **MAJOR.MINOR.PATCH** (e.g., 1.2.0)
- **MAJOR** - Breaking changes or major overhauls
- **MINOR** - New features added (backward compatible)
- **PATCH** - Bug fixes and small improvements

## Links

- **Repository:** https://github.com/XiusTV/Elvui-VibeUI
- **Releases:** https://github.com/XiusTV/Elvui-VibeUI/releases
- **Issues:** https://github.com/XiusTV/Elvui-VibeUI/issues
- **Latest Release:** https://github.com/XiusTV/Elvui-VibeUI/releases/latest

---

**Note:** This is a customized version of ElvUI for WotLK 3.3.5a, specifically tested and developed for Ascension.gg Warcraft Reborn. All changes are documented above.


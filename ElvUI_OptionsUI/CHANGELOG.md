# ElvUI_OptionsUI Changelog

All notable changes to ElvUI_OptionsUI will be documented in this file.

## [1.0.0] - 2024-11-02

### Initial Release
Configuration interface for ElvUI - Complete options panel system

### Added
- **Core Configuration System**
  - AceConfig-3.0 framework integration
  - AceGUI-3.0 widget system
  - Load on demand functionality
  - Memory efficient loading

- **Profile Management**
  - Create new profiles
  - Copy existing profiles
  - Delete profiles
  - Reset to defaults
  - Import/Export system
  - Profile sharing via text strings

- **Module Configuration Panels**
  - **General Settings**
    - UI scale
    - UI theme
    - Font settings
    - Media selection
    - Auto-repair
    - Auto-sell junk
    - Vendor grays
    
  - **Action Bars**
    - Bar 1-10 configuration
    - Pet bar options
    - Stance bar settings
    - Totem bar customization
    - Micro bar positioning
    - Keybind mode
    - Visibility conditions
    
  - **Auras**
    - Buff display settings
    - Debuff configuration
    - Consolidated buffs
    - Filter management
    - Size and spacing
    
  - **Bags**
    - Bag layout options
    - Item sorting
    - Bank settings
    - Vendor grays
    - Bag bar configuration
    
  - **Chat**
    - Frame positioning
    - Channel colors
    - Font settings
    - URL detection
    - Emoji support
    - Combat log options
    
  - **DataBars**
    - Experience bar settings
    - Reputation bar options
    - Pet experience configuration
    - Mouseover text
    - Colors and textures
    
  - **DataTexts**
    - Panel configuration
    - Text selection
    - Click actions
    - Tooltip settings
    - Auto-hide options
    
  - **Maps**
    - Minimap customization
    - World map settings
    - Coordinates display
    - Mapster integration
    - Combat fade
    - Icon settings
    
  - **Nameplates**
    - Nameplate styling
    - Style filters
    - Threat coloring
    - Aura tracking
    - Font configuration
    - Texture selection
    
  - **Skins**
    - Blizzard frame skins
    - Addon skins
    - ACE3 skins
    - WeakAuras integration
    - Details integration
    
  - **Tooltip**
    - Tooltip styling
    - Information display
    - Item level
    - Spell IDs
    - Health bars
    - Cursor anchor
    
  - **Unit Frames**
    - Player frame settings
    - Target frame configuration
    - Party frame options
    - Raid frame settings
    - Arena frame customization
    - Boss frame options
    - All frame types configurable

- **Filter Management**
  - Buff indicator filters
  - Aura filters
  - Nameplate filters
  - Custom filter creation
  - Import/Export filters

- **Advanced Options**
  - Developer mode
  - Debug tools
  - Cache clearing
  - Reset functions
  - Module toggles

### Libraries
- AceConfig-3.0 (Configuration framework)
- AceConfigDialog-3.0 (Dialog system)
- AceConfigRegistry-3.0 (Settings registry)
- AceGUI-3.0 (Widget library)
- AceDBOptions-3.0 (Database options)
- LibSharedMedia-3.0 (Media library)

### Features
- Load on demand (saves memory until needed)
- Intuitive tree-based navigation
- Real-time preview of changes
- Comprehensive tooltips
- Search functionality
- Quick access to common settings

### Commands
- `/ec` - Open ElvUI configuration
- `/elvui` - Open ElvUI configuration
- `/elvui install` - Run installation wizard
- `/elvui reset` - Reset all settings
- `/elvui toggle` - Toggle ElvUI on/off

### Notes
- Requires ElvUI main addon
- Compatible with WotLK 3.3.5
- Interface version: 30300
- Automatically loaded when accessing settings

---

## Future Plans
- Additional configuration options
- Enhanced filter management
- Quick setup profiles
- More customization presets
- Improved import/export system


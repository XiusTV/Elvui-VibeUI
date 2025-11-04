# ElvUI

A comprehensive user interface replacement addon for World of Warcraft 3.3.5 (WotLK).

## Version

- **Version:** 1.2.0
- **Interface:** 30300 (WotLK)
- **Authors:** Elv, Bunny, Xius

## Description

ElvUI is a complete user interface replacement for World of Warcraft, featuring:

- **Action Bars:** Fully customizable action bars with advanced features
- **Unit Frames:** Highly configurable player, target, party, and raid frames
- **Nameplates:** Enhanced nameplate system with styling and filtering
- **Bags:** Unified bag interface with sorting and searching
- **Chat:** Enhanced chat frames with URL detection and emoji support
- **Minimap & Worldmap:** Customizable map frames with zoom and styling options
- **Data Texts:** Informative text displays for various game statistics
- **Tooltips:** Enhanced tooltips with additional information
- **Skins:** Consistent UI skinning for Blizzard frames
- **Auras:** Buff/debuff tracking and display

## Installation

1. Extract the `ElvUI` and `ElvUI_OptionsUI` folders to your `Interface\AddOns` directory
2. Launch World of Warcraft
3. Run the ElvUI installation wizard on first load
4. Configure ElvUI through the options panel

## Configuration

Access ElvUI configuration:
- Type `/ec` or `/elvui` in-game
- Click the ElvUI button in the minimap menu

## Dependencies

- **Required:** None (standalone addon)
- **Optional:** 
  - SharedMedia (for additional fonts and textures)
  - oUF plugins (for extended unit frame functionality)

## Components

### ElvUI (Main Addon)
Core functionality and framework for the complete UI replacement.

### ElvUI_OptionsUI (Configuration)
Options interface for customizing all ElvUI features. Loads on demand when accessing settings.

## Module Structure

- **ActionBars** - Action bar management and customization
- **Auras** - Buff and debuff display
- **Bags** - Inventory management
- **Blizzard** - Blizzard UI enhancements
- **Chat** - Chat frame modifications
- **DataBars** - Experience and reputation bars
- **DataTexts** - Information display panels
- **Maps** - Minimap and world map customization
- **Misc** - Miscellaneous improvements
- **Nameplates** - Nameplate styling and filters
- **Skins** - UI element skinning
- **Tooltip** - Tooltip enhancements
- **UnitFrames** - Player, target, party, raid frames

## Libraries

ElvUI includes several embedded libraries:
- Ace3 (AceAddon, AceConfig, AceDB, etc.)
- oUF (Unit Frame framework)
- LibSharedMedia
- LibActionButton
- LibAuraInfo
- And more...

## Credits

- **Elv** - Lead Developer
- **Bunny** - Co-Developer
- **Xius** - Developer
- oUF Framework Authors
- Ace3 Library Authors
- Community Contributors

## License

ElvUI is free software. Please respect the authors' work.

## Support

For issues, questions, or suggestions, please refer to the ElvUI community forums and Discord.

## Changelog

### 1.2.0 (Latest)
- Reintegrated Party frames module
- Reintegrated Raid frames module
- Reintegrated Raid-40 frames module
- Reintegrated Raid Pet frames module

### 1.1.0
- Removed Harlem Shake easter egg feature
- Removed Hello Kitty easter egg feature
- Code cleanup and optimization

### 1.0.0 (Initial Release)
- Complete UI replacement for WotLK 3.3.5
- All core modules implemented
- Full customization options
- VuhDo integration support


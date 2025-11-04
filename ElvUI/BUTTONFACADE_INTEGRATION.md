# ButtonFacade Integration into ElvUI

## Overview
ButtonFacade has been successfully integrated into ElvUI as a built-in feature. Users can now customize the appearance of their action bars and aura buttons using various skins directly from the ElvUI options panel.

## What Was Added

### 1. Library Integration
- **LibButtonFacade** library copied to `ElvUI/Libraries/LibButtonFacade/`
- Library loaded via `ElvUI/Libraries/Load_Libraries.xml`
- Already configured in `ElvUI/Init.lua` to load as `E.Libs.LBF`

### 2. Button Skins
- All ButtonFacade skins copied to `ElvUI/Media/ButtonFacade/`
- Includes 30+ different button skin styles:
  - ElvUI (default clean style)
  - Dream Layout, Zoomed
  - Nefs, Aperture Science, Asteroid
  - DaedUI, Divinity, PixelSkin
  - Rectangle, Shadow, SnowFlax
  - STeam, Svelte (multiple variants)
  - ThinSquare, Vaka, Xyrr
  - Aquatic (I, II, III)
  - pHish (multiple variants)
- Skin definitions in `ElvUI/Modules/ButtonFacade/Skins.lua`

### 3. ButtonFacade Module
- New module created at `ElvUI/Modules/ButtonFacade/`
- Files:
  - `ButtonFacade.lua` - Main module logic
  - `Skins.lua` - Skin registrations
  - `Load_ButtonFacade.xml` - Module loader
- Loaded via `ElvUI/Modules/Load_Modules.xml`

### 4. Configuration Options
- Options panel added to ElvUI_OptionsUI
- Located in `ElvUI_OptionsUI/ElvUI_OptionsUI/ButtonFacade.lua`
- Accessible via ElvUI config menu
- Separate controls for:
  - Action Bars (enable/disable, skin selection, gloss, backdrop)
  - Auras (enable/disable, skin selection, gloss, backdrop)

### 5. Locale Support
- English locale strings added to `ElvUI/Locales/enUS.lua`
- Includes all necessary UI strings for the options panel

### 6. Profile Defaults
- Default settings added to `ElvUI/Settings/Profile.lua`
- Structure:
```lua
P.buttonFacade = {
    global = { SkinID = "ElvUI", Gloss = 0, Backdrop = false, Colors = {} },
    actionbars = { enabled = false, SkinID = "ElvUI", Gloss = 0, Backdrop = false, Colors = {} },
    auras = { enabled = false, SkinID = "ElvUI", Gloss = 0, Backdrop = false, Colors = {} },
}
```

### 7. ActionBars Integration
- Modified `ElvUI/Modules/ActionBars/ActionBars.lua`
- Buttons automatically registered with ButtonFacade when enabled
- Each bar gets its own LibButtonFacade group
- Old LBF references removed and replaced with new system

### 8. Auras Integration
- Modified `ElvUI/Modules/Auras/Auras.lua`
- Aura buttons registered with ButtonFacade when enabled
- Maintains proper button data structure (icon, highlight, etc.)
- Old LBF references updated to use new system

## How to Use

### For Players
1. Open ElvUI configuration (`/ec` or ESC → ElvUI)
2. Navigate to the "ButtonFacade" section
3. Choose "Action Bars" or "Auras" 
4. Enable the feature
5. Select your preferred skin from the dropdown
6. Adjust gloss (shine) intensity with the slider (0-100%)
7. Toggle backdrop on/off as desired
8. Changes apply immediately

### Resetting Skins
- Use the "Reset All Button Skins" button in each section to restore defaults
- Individual groups can be customized separately

## Technical Details

### LibButtonFacade API Usage
The integration uses standard LibButtonFacade API:
- `LBF:Group("ElvUI", groupName)` - Create/get button groups
- `group:AddButton(button, buttonData)` - Register buttons
- `group:Skin(skinID, gloss, backdrop, colors)` - Apply skins

### Button Groups
- ActionBars: `ElvUI_bar1` through `ElvUI_bar6`, plus `petbar`, `stancebar`, `microbar`
- Auras: `ElvUI_Auras`

### Skin Selection
Skins are loaded from the LibButtonFacade skin list via `LBF:ListSkins()`

## Files Modified

### ElvUI Core
- `ElvUI/Libraries/Load_Libraries.xml` - Added LibButtonFacade
- `ElvUI/Modules/Load_Modules.xml` - Added ButtonFacade module
- `ElvUI/Settings/Profile.lua` - Added default settings
- `ElvUI/Locales/enUS.lua` - Added locale strings

### ElvUI Modules
- `ElvUI/Modules/ActionBars/ActionBars.lua` - Integrated ButtonFacade
- `ElvUI/Modules/Auras/Auras.lua` - Integrated ButtonFacade

### ElvUI_OptionsUI
- `ElvUI_OptionsUI/ElvUI_OptionsUI/ElvUI_OptionsUI.toc` - Added ButtonFacade.lua
- `ElvUI_OptionsUI/ElvUI_OptionsUI/ButtonFacade.lua` - Options panel (new)

### New Files
- `ElvUI/Libraries/LibButtonFacade/` (directory)
  - `LibButtonFacade.lua`
  - `LibButtonFacade.xml`
- `ElvUI/Media/ButtonFacade/` (directory with all skin textures)
- `ElvUI/Modules/ButtonFacade/` (directory)
  - `ButtonFacade.lua`
  - `Skins.lua`
  - `Load_ButtonFacade.xml`

## Future Enhancements (Optional)
- Per-bar skin customization
- Color customization for individual skin layers
- Additional skin packs
- Pet bar and stance bar specific styling
- Separate buff and debuff skinning

## Notes
- ButtonFacade is disabled by default to preserve existing ElvUI look
- All skins maintain proper scaling with ElvUI's button sizes
- Compatible with all ElvUI action bar and aura settings
- No conflicts with other ElvUI skinning features


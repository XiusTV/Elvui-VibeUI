[![Game Version](https://img.shields.io/badge/wow-3.3.5-blue.svg)](https://github.com/ElvUI-WotLK)
[![Discord](https://discordapp.com/api/guilds/259362419372064778/widget.png?style=shield)](https://discord.gg/UXSc7nt)
[![GitHub Actions](https://github.com/ElvUI-WotLK/ElvUI/workflows/lint/badge.svg?branch=master&event=push)](https://github.com/ElvUI-WotLK/ElvUI/actions?query=workflow%3Alint+branch%3Amaster)

# ElvUI VibeUI - Wrath of the Lich King (3.3.5a)

This is a **VibeCoded** customized version of ElvUI for World of Warcraft - Wrath of the Lich King (3.3.5a)
<br />
ElvUI is a full UI replacement.
It completely replaces the default Blizzard UI at every level with a new and better interface.
As such, you'll only ever have to update ElvUI and not worry too much about its individual components.
This UI will arrange your interface to be more flexible and practical.

**Developed and tested on [Ascension.gg Warcraft Reborn](https://ascension.gg)**

World of Warcraft 3.3.5 (WotLK) Addons by XiusTV:

- [ElvUI VibeUI](https://github.com/XiusTV/Elvui-VibeUI)
- [PFQuest-WotLK](https://github.com/XiusTV/PFQuest-Wotlk)
- [pfQuest-BronzeBeard](https://github.com/XiusTV/pfQuest-BronzeBeard)
- [WarcraftEnhanced](https://github.com/XiusTV/WarcraftEnhanced)

Support: [Buy Me A Coffee](https://buymeacoffee.com/xius)

---

## 🔥 Custom Features:

**Built-in Integration:**
- **ElvUI_AddOnSkins** - Complete addon skinning system is integrated directly into this version
- **ElvUI_RaidMarkers** - Raid marker bar module is built-in and ready to use
- **Mapster with Magnify-WotLK** - Enhanced world map and minimap features fully integrated
- **ProfessionMenu** - Integrated profession menu removes the need for profession shortcuts taking up action bar slots

## Installation:

1. Download **[Latest Version](https://github.com/ElvUI-WotLK/ElvUI/releases/latest)**
2. Unpack the Zip file
3. Open the folder "ElvUI-(#.##)"
4. Copy (or drag and drop) **ElvUI** and **ElvUI_OptionsUI** into your Wow-Directory\Interface\AddOns
5. Restart WoW

## Additional Plugins:
[ElvUI_Enhanced](https://github.com/ElvUI-WotLK/ElvUI_Enhanced)
<br />
[ElvUI_AuraBarsMovers](https://github.com/ElvUI-WotLK/ElvUI_AuraBarsMovers)
<br />
[ElvUI_BagControl](https://github.com/ElvUI-WotLK/ElvUI_BagControl)
<br />
[ElvUI_CastBarOverlay](https://github.com/ElvUI-WotLK/ElvUI_CastBarOverlay)
<br />
[ElvUI_CustomTags](https://github.com/ElvUI-WotLK/ElvUI_CustomTags)
<br />
[ElvUI_CustomTweaks](https://github.com/ElvUI-WotLK/ElvUI_CustomTweaks)
<br />
[ElvUI_DTBars2](https://github.com/ElvUI-WotLK/ElvUI_DTBars2)
<br />
[ElvUI_DataTextColors](https://github.com/ElvUI-WotLK/ElvUI_DataTextColors)
<br />
[ElvUI_EnhancedFriendsList](https://github.com/ElvUI-WotLK/ElvUI_EnhancedFriendsList)
<br />
[ElvUI_ExtraActionBars](https://github.com/ElvUI-WotLK/ElvUI_ExtraActionBars)
<br />
[ElvUI_LocPlus](https://github.com/ElvUI-WotLK/ElvUI_LocPlus)
<br />
[ElvUI_MicrobarEnhancement](https://github.com/ElvUI-WotLK/ElvUI_MicrobarEnhancement)
<br />
[ElvUI_SwingBar](https://github.com/ElvUI-WotLK/ElvUI_SwingBar)
<br />
[ElvUI_VisualProcs](https://github.com/ElvUI-WotLK/ElvUI_VisualProcs)
<br />

-- Please Note: These plugins will not function without ElvUI installed.

## Commands:

    /ec or /elvui     Toggle the configuration GUI.
    /rl or /reloadui  Reload the whole UI.
    /moveui           Open the movable frames options.
    /bgstats          Toggles Battleground datatexts to display info when inside a battleground.
    /egrid            Toggles visibility of the grid for helping placement of thirdparty addons.
    /farmmode         Toggles the Minimap Farmmode.
    /in               The input of how many seconds you want a command to fire.
                          usage: /in <seconds> <command>
                          example: /in 1.5 /say hi
    /enable           Enable an Addon.
                          usage: /enable <addon>
                          example: /enable AtlasLoot
    /disable          Disable an Addon.
                          usage: /disable <addon>
                          example: /disable AtlasLoot

    ---------------------------------------------------------------------------------------------------------------
    -- Development ------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------
    /etrace           Toggles events window.
    /luaerror on      Enable luaerrors and disable all AddOns except ElvUI.
    /luaerror off     Disable luaerrors and re-enable all AddOns disabled within that session.
    /cpuimpact        Toggles calculations of CPU Impact. Type /cpuimpact to get results when you are ready.
    /cpuusage         Calculates and dumps CPU usage differences (module: all, showall: false, minCalls: 15, delay: 5).
    /frame            Command to grab frame information when mouseing over a frame or when inputting the name.
                          usage: /frame (when mousing over frame) or /frame <name>
                          example: /frame WorldFrame
    /framelist        Dumps frame level information with children and parents. Also places info into copy box.
    /framestack       Toggles dynamic mouseover frame displaying frame name and level information.
    /resetui          If no argument is provided it will reset all frames to their default positions.
                      If an argument is provided it will reset only that frame.
                          example: /resetui uf (resets all unitframes)


========================================
ElvUI Action Bar Fixes - November 2025
========================================

ISSUES FIXED:
-------------

1. AURA TRACKER SYNTAX ERROR (CRITICAL)
   File: AddOns/ElvUI/Modules/ActionBars/AuraTracker.lua
   Line: 63
   
   Problem: Used button:GetAttribute instead of button.GetAttribute
   This caused the error: "function arguments expected near 'and'"
   
   Fix: Changed method call syntax (:) to property access (.) for existence check
   
2. COUNT DISPLAY MISSING (ButtonFacade Issue)
   Files: 
   - AddOns/ElvUI/Modules/ActionBars/ActionBars.lua
   - AddOns/ElvUI/Modules/ButtonFacade/ButtonFacade.lua
   
   Problem: Many ButtonFacade skins set Count Width/Height to 0, hiding reagent/stack counts
   Example skins affected: Aquatic I/II/III, pHish, pHish2, SmartName, Random1/2/3
   
   Fixes Applied:
   a) ActionBars.lua line 799: Set hideElements.count = false in button config
   b) ActionBars.lua line 550: Explicitly call count:Show()  
   c) ButtonFacade.lua lines 176-195: Force restore count size after LBF skinning

WHAT NOW WORKS:
---------------
✓ Reagent counts (Soul Shards, arrows, bullets, etc.)
✓ Item stack counts (potions, food, bandages, etc.)
✓ Ability charges (multi-charge spell counts)
✓ AuraTracker module loads without errors

TESTING YOUR FIX:
-----------------

1. Reload UI with /reload or /reloadui

2. Test Count Display:
   - Put items with stack counts on your action bars (potions, food)
   - Put abilities that use reagents (warlocks/hunters)
   - Numbers should appear in bottom right of buttons

3. Test AuraTracker:
   - Enable in /elvui → ActionBars → AuraTracker
   - Target a mob or friendly player
   - Cast a DoT or buff on them
   - Duration should appear on that ability's button (if you have it on your bars)

4. Debug Commands (if issues persist):
   /debugab       - Shows status of ActionBars and AuraTracker
   /fixcount      - Forces count to show on all buttons
   /testautrack   - Manually tests AuraTracker functionality

BUTTON FACADE SKINS:
--------------------

The following skins had Count regions set to Width=0, Height=0 (now fixed):
- Aquatic I, Aquatic II, Aquatic III
- pHish, pHish2
- SmartName
- Random1, Random2, Random3

These skins now have their count regions restored to 36x10 pixels after skinning.

The ElvUI default skin already had correct Count settings and will work perfectly.

AURATRACKER SETTINGS:
---------------------

Default settings (Profile.lua line 4057-4064):
- enable: true  
- onlyPlayer: true (only shows your own auras)
- font: "PT Sans Narrow"
- fontSize: 18
- fontOutline: "OUTLINE"
- colorByTime: true (red <5s, yellow <10s, green >10s)

To customize: /elvui → ActionBars → AuraTracker

FILES MODIFIED:
---------------
1. AddOns/ElvUI/Modules/ActionBars/AuraTracker.lua (line 63)
2. AddOns/ElvUI/Modules/ActionBars/ActionBars.lua (lines 550, 799)
3. AddOns/ElvUI/Modules/ButtonFacade/ButtonFacade.lua (lines 176-195)
4. AddOns/ElvUI/Modules/ActionBars/DebugHelper.lua (NEW - debug commands)
5. AddOns/ElvUI/Modules/ActionBars/Load_ActionBars.xml (loads DebugHelper)

TROUBLESHOOTING:
----------------

If counts still don't show:
1. Try /fixcount command
2. Check which ButtonFacade skin you're using
3. Try switching to "ElvUI" skin temporarily
4. Run /debugab to see what's happening

If AuraTracker doesn't work:
1. Make sure it's enabled: /elvui → ActionBars → AuraTracker
2. Run /testautrack with a target selected
3. Check that you have the spell on your action bars
4. Verify the aura is yours (if onlyPlayer is enabled)

========================================
Need more help? Check the debug commands!
========================================


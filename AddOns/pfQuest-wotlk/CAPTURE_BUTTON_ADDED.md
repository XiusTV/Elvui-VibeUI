# Quest Capture Button Added to Tracker

## New Button
Added an 8th button to the tracker's top bar that provides quick access to the quest capture/learning system.

## Location
**Position**: Left side, after the 3 mode buttons
- Offset: 56px from left
- Between "Givers" button and title bar

## Visual Layout
```
┌─────────────────────────────────────────────────────────────┐
│ [Q] [D] [G] [C]   pfQuest Tracker   [🔍] [🧹] [⚙️] [✕]     │
└─────────────────────────────────────────────────────────────┘
```

Where:
- **[Q]** = Show Current Quests (cyan when active)
- **[D]** = Show Database Results
- **[G]** = Show Quest Givers
- **[C]** = Quest Capture System ⭐ **NEW**
- **[🔍]** = Open Database Browser
- **[🧹]** = Clean Database Results
- **[⚙️]** = Open Settings
- **[✕]** = Close Tracker

## Features

### Visual Indicator
The capture button **changes color** based on status:
- **🟢 Green** = Quest capture system is **ENABLED** (actively recording quest data)
- **🔴 Red** = Quest capture system is **DISABLED** (not recording)

### Function
**Click**: Opens the Quest Capture Monitor UI (pfQuestCaptureUI)
- Shows captured quests
- Displays capture statistics
- Allows export/inject/clear operations

### Tooltip
Hover over the button to see:
```
pfQuest Capture System

Status: ENABLED / DISABLED
Capturing quest data in background / Quest data not being captured

Click: Open capture monitor
Use /questcapture toggle to enable/disable
```

## How It Works

### Color Updates Automatically
The button color updates when:
1. **On tracker load** - Reads `pfQuest_CaptureConfig.enabled` and sets initial color
2. **When toggled via command** - `/questcapture toggle` updates button
3. **When toggled via UI** - Toggle button in capture UI updates button
4. **Dynamically** - Shows real-time status

### Integration
The button is fully integrated with the quest capture system:
- Calls `pfQuestCaptureUI:Show()` when clicked
- Automatically refreshes the UI with `UpdateUI()`
- Updates color via `pfQuestTracker.btncapture.UpdateColor()`

## Code Implementation

### Button Creation
```lua
pfQuestTracker.btncapture = CreateTopButton("Capture", "cluster_item", "TOPLEFT", 56,
  "Quest Capture System",
  function()
    if pfQuestCaptureUI then
      if pfQuestCaptureUI:IsShown() then
        pfQuestCaptureUI:Hide()
      else
        pfQuestCaptureUI:Show()
        pfQuestCaptureUI:UpdateUI()
      end
    end
  end,
  nil,  -- No default color
  function()  -- Custom tooltip
    -- Shows status and instructions
  end)
```

### Color Update Function
```lua
pfQuestTracker.btncapture.UpdateColor = function()
  if pfQuest_CaptureConfig.enabled then
    pfQuestTracker.btncapture.texture:SetVertexColor(0.3, 1, 0.3)  -- Green
  else
    pfQuestTracker.btncapture.texture:SetVertexColor(1, 0.3, 0.3)  -- Red
  end
end
```

### Automatic Updates
Called from:
1. **questcapture.lua** - When `/questcapture toggle` is used
2. **questcapture-ui.lua** - When toggle button in UI is clicked

## Usage

### Quick Status Check
Just **look at the button**:
- 🟢 Green = Capture is ON, quest data being recorded
- 🔴 Red = Capture is OFF, no data recording

### Open Capture Monitor
**Click the button** to:
- View captured quests
- See what's new (not in database)
- Export data for sharing
- Inject quests into live database
- Clear captured data

### Toggle Capture On/Off
From the tracker button:
1. Click button to open capture UI
2. Click "ON/OFF" toggle in UI
3. Button color updates automatically

Or use command: `/questcapture toggle`

## Benefits

### At-a-Glance Status
- No need to open UI or run commands
- Visual indicator shows if capture is active
- Green/red clearly indicates state

### Quick Access
- One click to open capture monitor
- No need to remember `/questcapture` command
- Integrated right into tracker interface

### User-Friendly
- New users can discover the feature
- Tooltip explains what it does
- Color coding is intuitive

## Icon Used
**`cluster_item.tga`** - A multi-colored item cluster icon
- Visually distinct from other buttons
- Represents "collecting/capturing" data
- Looks good in green and red

## Testing

After adding this button:
- [ ] Button appears on tracker top bar (left side, 4th button)
- [ ] Button shows green when capture is enabled
- [ ] Button shows red when capture is disabled
- [ ] Click opens pfQuestCaptureUI
- [ ] Tooltip shows correct status
- [ ] Color updates when toggling in UI
- [ ] Color updates when using `/questcapture toggle`

## Summary

**Before**: 7 buttons on tracker
**After**: 8 buttons on tracker

**New Button**: Quest Capture System
- Location: Left side, 4th button
- Function: Opens capture monitor
- Status: Green=ON, Red=OFF
- Integrated: Auto-updates when toggled
- Clean Look: Transparent background, icon only

This provides quick, visual access to the quest learning system right from the tracker!


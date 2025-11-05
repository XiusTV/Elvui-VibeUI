# Quest Capture Toggle Button - Fixed

## Problem
The ON/OFF toggle button in the Quest Capture UI had issues:
- Had a weird line/border around it
- Didn't look like the bottom buttons (Export, Inject, Clear, Refresh)
- Wasn't styled properly

## Solution
Restyled the toggle button to match the bottom buttons:

### Before
- Generic button with basic styling
- Inconsistent appearance
- Weird border/line

### After
- Uses `pfUI.api.SkinButton()` for rounded/circular look
- Matches Export/Inject/Clear/Refresh button style
- Changes appearance dynamically:
  - **Green "ON"** when capture is enabled
  - **Red "OFF"** when capture is disabled

## Implementation

### Button Appearance Function
```lua
pfQuestCaptureUI.toggleBtn.UpdateAppearance = function()
  if pfQuest_CaptureConfig.enabled then
    pfQuestCaptureUI.toggleBtn.text:SetText("ON")
    pfQuestCaptureUI.toggleBtn.text:SetTextColor(0.3, 1, 0.3)
    SkinButton(pfQuestCaptureUI.toggleBtn, 0.3, 1, 0.3)  -- Green
  else
    pfQuestCaptureUI.toggleBtn.text:SetText("OFF")
    pfQuestCaptureUI.toggleBtn.text:SetTextColor(1, 0.3, 0.3)
    SkinButton(pfQuestCaptureUI.toggleBtn, 1, 0.3, 0.3)  -- Red
  end
end
```

### Auto-Updates
The button updates its appearance:
1. **On click** - Immediately shows new state
2. **On UI refresh** - When UpdateUI() is called
3. **On initial load** - Sets correct state when UI is created

### Click Behavior
When you click the button:
1. Toggles `pfQuest_CaptureConfig.enabled`
2. Updates button appearance (ON→OFF or OFF→ON)
3. Changes color (green→red or red→green)
4. Updates tracker icon color (if tracker is open)
5. Shows chat message confirming change

### Tooltip
Hover over the button to see:
```
Toggle Quest Capture

Currently: ENABLED / DISABLED
Click to disable / Click to enable
```

## Visual Appearance

### When Enabled (ON)
- Text: "ON"
- Text Color: Bright green (0.3, 1, 0.3)
- Button Border: Green rounded border
- Looks like: 🟢 **ON**

### When Disabled (OFF)
- Text: "OFF"
- Text Color: Bright red (1, 0.3, 0.3)
- Button Border: Red rounded border
- Looks like: 🔴 **OFF**

### Button Style
- Width: 40 pixels
- Height: 20 pixels
- Font: Same as capture UI font
- Style: Matches Export/Inject/Clear/Refresh buttons
- Border: Rounded/circular like bottom buttons

## Comparison

| Element | Before | After |
|---------|--------|-------|
| Style | Generic | Rounded like bottom buttons |
| Border | Weird line | Clean circular border |
| Color | Static | Dynamic (green/red) |
| Appearance | Inconsistent | Matches UI theme |

## Files Modified
- ✅ `pfQuest-wotlk/questcapture-ui.lua`

## Result
The toggle button now:
- ✅ Looks professional and matches the UI theme
- ✅ Clearly shows ON (green) or OFF (red)
- ✅ Styled like Export/Inject/Clear/Refresh buttons
- ✅ No weird borders or lines
- ✅ Updates appearance dynamically

This gives users a clear, professional toggle button that matches the rest of the capture UI!


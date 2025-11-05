# AuraTracker Color Customization - November 5, 2025

## ✅ Added Full Color Customization!

### What's New:

You can now customize EVERYTHING about the countdown timer colors!

---

## 🎨 Settings Location:

```
/elvui → ActionBars → AuraTracker
```

### Available Options:

#### **1. Default Color** (> Warning Threshold)
- **Default:** White (RGB: 1, 1, 1)
- **When:** Time remaining > 10 seconds
- **Customizable:** Click to open color picker

#### **2. Warning Color** (< Warning Threshold)
- **Default:** Yellow (RGB: 1, 1, 0)
- **When:** Time remaining < 10 seconds but > 5 seconds
- **Customizable:** Click to open color picker

#### **3. Urgent Color** (< Urgent Threshold)
- **Default:** Red (RGB: 1, 0, 0)
- **When:** Time remaining < 5 seconds
- **Customizable:** Click to open color picker

#### **4. Warning Threshold** (Slider)
- **Default:** 10 seconds
- **Range:** 1-60 seconds
- **Effect:** When countdown drops below this, uses Warning Color

#### **5. Urgent Threshold** (Slider)
- **Default:** 5 seconds
- **Range:** 1-30 seconds
- **Effect:** When countdown drops below this, uses Urgent Color

---

## 🎯 How It Works:

### Example with Defaults:

**Mark of the Wild (30 min duration):**

```
1800s → "30m" in WHITE
...
600s → "10m" in WHITE
599s → "9m" in YELLOW  ← Warning threshold!
...
10s → "10s" in YELLOW
9s → "9s" in YELLOW
...
5s → "5s" in RED  ← Urgent threshold!
4s → "4s" in RED
3s → "3s" in RED
2s → "2s" in RED
1s → "1s" in RED
0s → Buff expires, text disappears
```

---

## 🎨 Customization Examples:

### Want Green → Yellow → Red?
```
1. Open /elvui → ActionBars → AuraTracker
2. Click "Default Color" → Pick green (0, 1, 0)
3. Click "Warning Color" → Pick yellow (1, 1, 0)
4. Click "Urgent Color" → Pick red (1, 0, 0)
5. Changes apply immediately!
```

### Want Longer Warning Period?
```
1. Set "Warning Threshold" to 30 seconds
2. Set "Urgent Threshold" to 10 seconds
3. Now:
   - White until 30s remaining
   - Yellow from 30s to 10s
   - Red below 10s
```

### Want Only 2 Colors (No Warning)?
```
1. Set "Warning Threshold" to 5 seconds
2. Set "Urgent Threshold" to 5 seconds
3. Now:
   - White until 5s
   - Red below 5s
   - No yellow (both thresholds are same)
```

### Want Purple for DoTs?
```
1. Click "Default Color"
2. Pick purple: R=0.8, G=0.2, B=1
3. Now all your DoT timers are purple!
```

---

## 📊 Technical Details:

### Settings Structure:
```lua
E.db.actionbar.auraTracker = {
    colorByTime = true,
    colorDefault = {r = 1, g = 1, b = 1},  -- White
    colorWarning = {r = 1, g = 1, b = 0},  -- Yellow
    colorUrgent = {r = 1, g = 0, b = 0},   -- Red
    warningThreshold = 10,  -- Seconds
    urgentThreshold = 5,    -- Seconds
}
```

### Color Picker Format:
- **r, g, b** values range from **0 to 1**
- Example colors:
  - White: (1, 1, 1)
  - Red: (1, 0, 0)
  - Green: (0, 1, 0)
  - Blue: (0, 0, 1)
  - Yellow: (1, 1, 0)
  - Cyan: (0, 1, 1)
  - Magenta: (1, 0, 1)
  - Orange: (1, 0.5, 0)
  - Purple: (0.8, 0.2, 1)

---

## 🔧 Commands:

### Apply Color Changes:
```bash
/refreshautrack
```

This refreshes all buttons to use your new color settings.

### Test Colors:
```bash
1. Change colors in /elvui settings
2. Target yourself
3. Look at buff buttons
4. Colors update in real-time!
```

---

## 💡 Tips:

### For PvE (Buff Tracking):
- **Default:** Soft blue (0.5, 0.8, 1)
- **Warning:** Orange (1, 0.6, 0)
- **Urgent:** Red (1, 0, 0)
- Makes buff timers stand out visually

### For PvP (DoT Tracking):
- **Default:** Purple (0.8, 0.2, 1)
- **Warning:** Yellow (1, 1, 0)
- **Urgent:** Red (1, 0, 0)
- **Higher thresholds:** Warning=15s, Urgent=8s
- Gives more time to refresh DoTs

### For Minimalist:
- **Default:** White (1, 1, 1)
- **Warning:** White (1, 1, 1)  ← Same as default!
- **Urgent:** Red (1, 0, 0)
- **Result:** All white until <5s, then red

### Disable Color Coding:
Uncheck "Color by Time Remaining" → All timers stay white

---

## 📁 Files Modified:

1. **AddOns/ElvUI/Settings/Profile.lua**
   - Added colorDefault, colorWarning, colorUrgent
   - Added warningThreshold, urgentThreshold

2. **AddOns/ElvUI/Modules/ActionBars/AuraTracker.lua**
   - Uses custom colors from settings
   - Uses custom thresholds from settings

3. **AddOns/ElvUI_OptionsUI/ActionBars.lua**
   - Added 3 color pickers
   - Added 2 threshold sliders
   - All under AuraTracker settings

---

## ✅ Changes Applied:

### 1. **Whole Seconds Only** ✅
- No more decimals
- Shows: 17s, 16s, 15s (not 17.2s)

### 2. **Default Colors: White/Yellow/Red** ✅
- White for normal
- Yellow for warning
- Red for urgent
- (No more green!)

### 3. **Fully Customizable** ✅
- Pick ANY color you want
- Adjust thresholds to your preference
- Changes apply immediately

---

## 🧪 How to Access:

```bash
1. /elvui

2. ActionBars → AuraTracker (scroll down)

3. You'll see:
   - Enable checkbox
   - Only Show Your Auras
   - Color by Time Remaining
   - Font settings
   - [Color Settings] section:
     - Default Color [color box]
     - Warning Color [color box]
     - Urgent Color [color box]
     - Warning Threshold [1-60 slider]
     - Urgent Threshold [1-30 slider]
```

Click any color box to open the color picker!

---

## 🎯 Current Defaults:

- **Default:** White (1, 1, 1) for time > 10s
- **Warning:** Yellow (1, 1, 0) for 5s < time < 10s
- **Urgent:** Red (1, 0, 0) for time < 5s
- **Font Size:** 12
- **Position:** Bottom of button
- **Format:** Whole seconds (17m, 59s, 2h)

---

## 🚀 Test Your Custom Colors:

```bash
1. /elvui → ActionBars → AuraTracker

2. Click "Default Color" → Pick your favorite color

3. Target yourself with Mark of the Wild

4. Look at CV button → Should be your custom color!

5. Cast a short buff and watch it change colors as it expires
```

---

**Now you have full control over timer appearance!** 🎨

Want to make your own color scheme? Just:
1. Open `/elvui`
2. Go to ActionBars → AuraTracker
3. Click the color boxes
4. Pick your colors!

Changes apply instantly! 🎉


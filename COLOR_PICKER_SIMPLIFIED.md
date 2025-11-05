# AuraTracker Simplified Color Picker - November 5, 2025

## ✅ Simpler, Cleaner Color Selection!

Instead of complex RGB color pickers, you now have:
- **10 preset color swatches** (dropdown)
- **Brightness slider** (lighter/darker)
- Much easier to use!

---

## 🎨 New Interface:

### Location:
```
/elvui → ActionBars → AuraTracker → Color Settings
```

### For Each Color (Default, Warning, Urgent):

#### **1. Color Preset Dropdown**
Choose from 10 beautiful preset colors:
- 🤍 **White** - Clean, neutral
- ⚫ **Gray** - Subtle, understated
- 🔴 **Red** - Danger, urgent
- 🟠 **Orange** - Alert, attention
- 🟡 **Yellow** - Warning, caution
- 🟢 **Green** - Safe, good
- 🔵 **Cyan** - Cool, calm
- 🔵 **Blue** - Information, peaceful
- 🟣 **Purple** - Magic, special
- 🩷 **Pink** - Unique, soft

#### **2. Brightness Slider**
- **Range:** 0.3 (very dark) to 1.5 (very bright)
- **Default:** 1.0 (normal)
- **Examples:**
  - 0.5 = Darker shade
  - 1.0 = Normal brightness
  - 1.3 = Brighter/glowing

---

## 📊 How It Works:

### Example: Purple DoT Timers

```
1. Open /elvui → ActionBars → AuraTracker
2. Find "Default Color (> 10s)" section
3. Color Preset: Select "Purple"
4. Brightness: Set to 1.2 (slightly brighter)
5. Done! Timers are now bright purple!
```

### Example: Darker Red for Urgent

```
1. Find "Urgent Color (< 5s)" section
2. Color Preset: Select "Red"
3. Brightness: Set to 0.7 (darker red)
4. Now urgent timers are dark red instead of bright red!
```

### Example: Bright Cyan for Buffs

```
1. Default Color: "Cyan"
2. Brightness: 1.3 (brighter)
3. Warning Color: "Orange"
4. Brightness: 1.0 (normal)
5. Urgent Color: "Red"
6. Brightness: 1.2 (bright red)
```

---

## 🎯 Current Defaults:

### **Default Color (> 10s)**
- Preset: White
- Brightness: 1.0
- Result: Pure white

### **Warning Color (< 10s)**
- Preset: Yellow
- Brightness: 1.0
- Result: Bright yellow

### **Urgent Color (< 5s)**
- Preset: Red
- Brightness: 1.0
- Result: Bright red

---

## 💡 Popular Color Schemes:

### Classic WoW Style:
```
Default: White (1.0)
Warning: Yellow (1.0)
Urgent: Red (1.0)
```

### PvP DoT Tracking:
```
Default: Purple (1.2) - bright purple for your DoTs
Warning: Orange (1.0) - refresh soon!
Urgent: Red (1.3) - refresh NOW!
```

### Minimalist:
```
Default: Gray (0.8) - subtle
Warning: White (1.0) - notice it
Urgent: Red (1.0) - emergency
```

### Pastel Colors:
```
Default: Cyan (0.7) - soft cyan
Warning: Yellow (0.8) - soft yellow
Urgent: Pink (0.9) - soft pink
```

### Dark Theme:
```
Default: Blue (0.6) - dark blue
Warning: Orange (0.7) - dark orange
Urgent: Red (0.8) - dark red
```

---

## 🔧 Technical Details:

### Preset Color Values:
```lua
white  = {r=1.00, g=1.00, b=1.00}
gray   = {r=0.67, g=0.67, b=0.67}
red    = {r=1.00, g=0.00, b=0.00}
orange = {r=1.00, g=0.65, b=0.00}
yellow = {r=1.00, g=1.00, b=0.00}
green  = {r=0.00, g=1.00, b=0.00}
cyan   = {r=0.00, g=1.00, b=1.00}
blue   = {r=0.00, g=0.53, b=1.00}
purple = {r=0.80, g=0.00, b=1.00}
pink   = {r=1.00, g=0.40, b=1.00}
```

### Brightness Calculation:
```lua
Final Color = Base Color × Brightness
Example: Red (1, 0, 0) × 0.7 brightness = Dark Red (0.7, 0, 0)
Example: Blue (0, 0.53, 1) × 1.3 = Bright Blue (0, 0.69, 1)
```

---

## ✨ Benefits:

### Simpler UI:
- ❌ No overwhelming RGB sliders
- ❌ No hex color codes
- ✅ Simple dropdown with named colors
- ✅ One slider to adjust brightness
- ✅ Preview colors right in the dropdown!

### Still Flexible:
- 10 base colors
- Brightness range gives 100+ variations
- **1000 possible color combinations!**

### User-Friendly:
- "I want purple timers" → Select purple, done!
- "Too bright" → Lower brightness slider
- "Want darker red" → Red preset, 0.7 brightness
- Changes apply immediately!

---

## 📁 Files Modified:

1. **AddOns/ElvUI/Settings/Profile.lua**
   - Added colorDefaultPreset, colorWarningPreset, colorUrgentPreset
   - Added brightness settings for each

2. **AddOns/ElvUI_OptionsUI/ActionBars.lua**
   - Replaced color pickers with preset dropdowns
   - Added brightness sliders
   - Organized into 3 inline groups

---

## 🧪 How to Test:

```bash
1. /reload

2. /elvui → ActionBars → AuraTracker

3. Scroll to "Color Settings"

4. You'll see 3 sections:
   - Default Color (> 10s)
     • Color Preset [dropdown]
     • Brightness [slider]
   
   - Warning Color (< 10s)
     • Color Preset [dropdown]
     • Brightness [slider]
   
   - Urgent Color (< 5s)
     • Color Preset [dropdown]
     • Brightness [slider]

5. Try changing "Default Color" to Purple

6. Adjust brightness to 1.2

7. Look at your Mark of the Wild button
   → Should be bright purple!
```

---

## 🎯 Quick Examples:

### Want Green Timers?
```
Default Color: Green
Brightness: 1.0
→ Normal green timers
```

### Want Dark Purple?
```
Default Color: Purple
Brightness: 0.6
→ Dark purple timers
```

### Want Glowing Orange?
```
Warning Color: Orange
Brightness: 1.4
→ Bright glowing orange
```

---

## ✅ Complete Feature List:

**Customization:**
- ✅ 10 preset colors per timer state
- ✅ Brightness adjustment (0.3-1.5)
- ✅ 3 independent color controls
- ✅ 2 threshold sliders

**Display:**
- ✅ Whole seconds only (no decimals)
- ✅ Format: 59s, 59m, 59h
- ✅ Position: Bottom of button
- ✅ Size: 12pt (adjustable)

**Functionality:**
- ✅ Real countdown timers
- ✅ Spell detection working
- ✅ Buff/debuff matching
- ✅ Tooltips work normally
- ✅ Changes apply immediately

---

**All done!** 🎉

Much cleaner interface:
- Pick a color from dropdown ✅
- Adjust brightness with slider ✅
- See results instantly ✅

No more complex RGB pickers! 🎨


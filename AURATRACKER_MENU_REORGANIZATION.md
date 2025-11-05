# AuraTracker Menu Reorganization - November 5, 2025

## ✅ AuraTracker Now Has Its Own Menu!

**Before:** `/elvui` → ActionBars → AuraTracker (buried in ActionBars)  
**After:** `/elvui` → **Aura Tracker** (standalone top-level menu!) 🎉

---

## 📁 Changes Made:

### 1. **Created New File:** `AddOns/ElvUI_OptionsUI/AuraTracker.lua`
- Standalone options configuration
- All AuraTracker settings in one place
- Cleaner organization

### 2. **Updated:** `AddOns/ElvUI_OptionsUI/ElvUI_OptionsUI.toc`
- Added `AuraTracker.lua` to load order
- Loads right after ActionBars.lua

### 3. **Updated:** `AddOns/ElvUI_OptionsUI/ActionBars.lua`
- Removed all AuraTracker options (370+ lines)
- Added redirect note pointing to new location

---

## 🎯 New Menu Structure:

### `/elvui` → Aura Tracker

#### **General Settings**
- ✅ Enable/Disable toggle
- ✅ Only Show Your Auras
- ✅ Color by Time Remaining

#### **Font Settings**
- ✅ Font selection (LSM)
- ✅ Font Size (8-32)
- ✅ Font Outline (None/Outline/Thick)

#### **Default Color (> 10s)**
- 🎨 Color Preset dropdown (10 colors)
- 🔆 Brightness slider (0.3-1.5)

#### **Warning Color (< 10s)**
- 🎨 Color Preset dropdown
- 🔆 Brightness slider

#### **Urgent Color (< 5s)**
- 🎨 Color Preset dropdown
- 🔆 Brightness slider

#### **Color Thresholds**
- ⏱️ Warning Threshold (1-60s)
- ⏱️ Urgent Threshold (1-30s)

---

## 📊 Benefits:

### Easier to Find:
- **Before:** ActionBars → scroll down → find AuraTracker
- **After:** Main menu → Aura Tracker ✅

### Better Organization:
- **Before:** Mixed with action bar settings
- **After:** Standalone section ✅

### Clearer Purpose:
- **Before:** Looked like a minor action bar feature
- **After:** Dedicated buff/debuff tracking tool ✅

### Room to Grow:
- **Before:** Limited space in ActionBars
- **After:** Whole menu for future features ✅

---

## 🧪 How to Access:

### New Location:
```bash
1. /elvui

2. Click "Aura Tracker" in main menu
   (Between ActionBars and other modules)

3. See all settings!
```

### Old Location:
```bash
1. /elvui → ActionBars

2. Scroll to bottom

3. See redirect note:
   "Aura Tracker has been moved to its own menu"
```

---

## 🎨 What's Included in New Menu:

### Section 1: General Settings
```
┌─────────────────────────────────┐
│ ✓ Enable                        │
│ ✓ Only Show Your Auras          │
│ ✓ Color by Time Remaining       │
└─────────────────────────────────┘
```

### Section 2: Font Settings
```
┌─────────────────────────────────┐
│ Font: [PT Sans Narrow ▼]        │
│ Font Size: [====●====] 12       │
│ Font Outline: [Outline ▼]       │
└─────────────────────────────────┘
```

### Section 3-5: Color Settings
```
┌─────────────────────────────────┐
│ Default Color (> 10s)           │
│ • Color Preset: [White ▼]       │
│ • Brightness: [====●====] 1.0   │
├─────────────────────────────────┤
│ Warning Color (< 10s)           │
│ • Color Preset: [Yellow ▼]      │
│ • Brightness: [====●====] 1.0   │
├─────────────────────────────────┤
│ Urgent Color (< 5s)             │
│ • Color Preset: [Red ▼]         │
│ • Brightness: [====●====] 1.0   │
└─────────────────────────────────┘
```

### Section 6: Thresholds
```
┌─────────────────────────────────┐
│ Warning Threshold: [====●===] 10│
│ Urgent Threshold: [===●=====] 5 │
└─────────────────────────────────┘
```

---

## 📝 Files Modified:

1. **ElvUI_OptionsUI/AuraTracker.lua** (NEW FILE - 332 lines)
   - Complete standalone options
   - All color pickers
   - All settings

2. **ElvUI_OptionsUI/ActionBars.lua** (REDUCED by 370 lines!)
   - Removed auraTracker section
   - Added redirect note

3. **ElvUI_OptionsUI/ElvUI_OptionsUI.toc**
   - Added AuraTracker.lua to load list

---

## ✨ Features in New Menu:

### All Original Settings:
- ✅ Enable toggle
- ✅ Only Player filter
- ✅ Font customization
- ✅ Color by time toggle

### New Color System:
- ✅ 10 preset colors per state
- ✅ Brightness adjustment
- ✅ No overwhelming RGB pickers
- ✅ Clean dropdown interface

### Threshold Control:
- ✅ Adjustable warning time (1-60s)
- ✅ Adjustable urgent time (1-30s)
- ✅ Customize when colors change

---

## 🧪 Testing:

```bash
1. /reload

2. /elvui

3. Look for "Aura Tracker" in main menu
   (Should be near ActionBars)

4. Click it

5. See all settings in clean layout!
```

---

## 🎯 Menu Order:

The new menu appears at **order 65**, which places it:

```
Search (1)
General (2)
...
ActionBars (60)
→ Aura Tracker (65) ← NEW!
Bags (70)
...
```

This makes it easy to find right after ActionBars!

---

## 💡 Future Additions:

Now that AuraTracker has its own menu, future features can be added:

### Possible Future Features:
- Position customization (top/bottom/center of button)
- Show/hide on specific bars
- Blacklist certain spells
- Different formats (MM:SS vs. condensed)
- Icon indicators instead of text
- Sound alerts at thresholds

All can be added to the dedicated menu!

---

## ✅ Summary:

**Created:**
- ✅ New standalone AuraTracker menu
- ✅ Clean, organized interface
- ✅ All settings in one place
- ✅ Room for future features

**Removed:**
- ✅ From ActionBars submenu
- ✅ Added helpful redirect note
- ✅ Reduced ActionBars.lua by 370 lines

**Result:**
- ✅ Easier to find
- ✅ Better organized
- ✅ More professional
- ✅ Scalable for future

---

**Access it now at: `/elvui` → Aura Tracker** 🎉


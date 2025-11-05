# Tracker Top Bar Layout

## Visual Layout

```
┌─────────────────────────────────────────────────────────────────────┐
│ [Q] [D] [G] [C]      pfQuest Tracker          [🔍] [🧹] [⚙️] [✕]    │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  └─ Quest objectives show here when expanded                       │
│                                                                     │
│  └─ Quest objectives show here when expanded                       │
│                                                                     │
│  └─ Quest objectives show here when expanded                       │
│                                                                     │
│                        (scrollable area)                            │
│                                                                     │
│                                                                     │
│                                                                     │
│                                                                     │
│                                                                   ┌─┤
│                                                                   │░│
└───────────────────────────────────────────────────────────────────┴─┘
```

## Button Layout (Left to Right)

### Left Side - Mode Switching & Capture
Position: TOPLEFT, starting at X offset 5

| Button | Icon | Offset | Function |
|--------|------|--------|----------|
| [Q] Quests | `tracker_quests.tga` | 5px | Show Current Quests (default active) |
| [D] Database | `tracker_database.tga` | 22px | Show Database Results |
| [G] Givers | `tracker_giver.tga` | 39px | Show Quest Givers |
| [C] Capture | `cluster_item.tga` | 56px | Open Quest Capture Monitor (Green=ON, Red=OFF) |

### Right Side - Utilities
Position: TOPRIGHT, with negative X offsets

| Button | Icon | Offset | Function |
|--------|------|--------|----------|
| [🔍] Search | `tracker_search.tga` | -89px | Open Database Browser |
| [🧹] Clean | `tracker_clean.tga` | -72px | Clean Database Results |
| [⚙️] Settings | `tracker_settings.tga` | -25px | Open Settings |
| [✕] Close | `tracker_close.tga` | -5px | Close Tracker |

## Title Bar Area
The title bar is positioned between the left and right button groups:
- **Left boundary**: X offset 75 (after 4 left buttons)
- **Right boundary**: X offset -90 (before right buttons)
- **Height**: 25 pixels
- **Function**: Draggable area for moving tracker, right-click to lock/unlock

## Button Specifications

### Size
- Width: 16 pixels
- Height: 16 pixels
- Frame Level: Tracker base + 2

### Visual States
- **Active Mode Button**: Cyan tint (0.2, 1, 0.8)
- **Inactive Buttons**: White (1, 1, 1)
- **Capture Button (Enabled)**: Green tint (0.3, 1, 0.3)
- **Capture Button (Disabled)**: Red tint (1, 0.3, 0.3)
- **Close Button**: Red tint (1, 0.25, 0.25)
- **Settings Button**: Light gray (0.8, 0.8, 0.8)

### Button Spacing
- Left group: 17px between buttons (16px button + 1px gap)
- Right group: 17-20px between buttons

## Integration with Map System

When mode buttons are clicked:
1. `pfQuestTracker.mode` is updated to:
   - `"QUEST_TRACKING"`
   - `"DATABASE_TRACKING"`
   - `"GIVER_TRACKING"`

2. Active button gets cyan highlight
3. Other mode buttons return to white
4. `pfMap:UpdateNodes()` is called to refresh map display

## Icon Files Location
All icons are located in:
```
pfQuest-wotlk/img/tracker_*.tga
```

Verified existing icons:
- ✅ tracker_quests.tga
- ✅ tracker_database.tga
- ✅ tracker_giver.tga
- ✅ cluster_item.tga (used for capture button)
- ✅ tracker_search.tga
- ✅ tracker_clean.tga
- ✅ tracker_settings.tga
- ✅ tracker_close.tga


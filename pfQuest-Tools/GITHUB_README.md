# pfQuest Enhanced

> **Automated quest database builder for World of Warcraft 3.3.5 (WotLK)**  
> The quest addon that learns as you play - capture and share quest data automatically!

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![WoW Version](https://img.shields.io/badge/WoW-3.3.5%20WotLK-orange.svg)]()
[![Python](https://img.shields.io/badge/Python-3.7+-green.svg)](https://www.python.org)

---

## 🎮 What is pfQuest Enhanced?

**pfQuest Enhanced** is a comprehensive quest helper addon for WoW 3.3.5 with an **automated quest capture system** that allows players to contribute new quest data without manual database editing.

### Key Features

- 🗺️ **10,000+ Quests** - Vanilla, TBC, and WotLK quest database
- 🎯 **World Map Integration** - Quest givers, objectives, and turn-ins on your map
- 📍 **Quest Tracker** - Smart routing with hearthstone optimization
- ⭐ **Auto-Capture System** - Automatically records quest data as you play
- 💾 **Permanent Storage** - External merger tool makes captures part of the addon
- 🔄 **Per-Character History** - Proper quest filtering for each character
- 🚀 **Performance Optimized** - Minimal CPU usage, no lag
- 📤 **Easy Sharing** - Contribute captured quests to the community

---

## 🌟 What Makes This Different?

This enhanced version adds a **complete automated quest learning system**:

### The Two-Stage Capture System

**Stage 1: In-Game Capture**
```
Accept quest → System records everything → Shows on map immediately
```

**Stage 2: External Merger** 
```
Close game → Tool extracts data → Generates permanent database files → Restart → Available forever!
```

### What Gets Captured Automatically

✅ Quest giver NPC (name, ID, location with accurate zone)  
✅ Quest text, description, and objectives  
✅ Objective completion locations (tracked as you complete them)  
✅ Quest item drop sources  
✅ Turn-in NPC location  
✅ Quest rewards and choices  

**No manual database editing required!**

---

## 📥 Installation

### Quick Install (5 minutes)

1. **Download the latest release**
2. **Copy folders to your WoW directory:**
   ```
   Interface\AddOns\pfQuest-wotlk\
   Interface\pfQuest-Tools\
   ```

3. **Choose your merger tool version:**

   **Option A: Standalone .exe (Recommended - No Python!)**
   ```
   1. Go to: Interface\pfQuest-Tools\dist\
   2. Run: pfQuest Merger Tool.exe
   3. Configure paths in Settings
   4. Click "Start Monitoring"
   ```

   **Option B: Python Script (Advanced)**
   ```
   1. Install: python -m pip install psutil
   2. Go to: Interface\pfQuest-Tools\Merger via CMD\
   3. Edit pfquest_db_merger.py (set paths)
   4. Run: RUN_MERGER_HERE.bat
   ```

4. **Configure in-game:**
   ```
   /pfquest config
   Enable "Show Available Quests" and "Show Low Level Quests"
   ```

5. **Done!** Open your map and see quest icons.

---

## 🎯 Usage

### Daily Workflow

1. **Start the merger tool** (before playing)
   - .exe: Double-click `pfQuest Merger Tool.exe`
   - Script: Double-click `RUN_MERGER_HERE.bat`

2. **Play WoW normally**
   - Accept quests
   - Complete objectives (locations are auto-tracked)
   - Turn in quests

3. **Close the game**
   - Merger tool automatically extracts captured data
   - Generates permanent database files
   - Shows "✓ Merge complete!"

4. **Restart WoW**
   - Captured quests now show for all characters
   - Permanent part of the addon database

### In-Game Commands

```lua
/pfquest config          -- Open configuration
/questcapture            -- View capture monitor
/questcapture status     -- Check capture system
/questcapture inject     -- Make captures show immediately
/questcapture export     -- Export as Lua code
/pfquest history check   -- View character's quest history
/pfquest history reset   -- Reset character's quest history
```

---

## 🛠️ Features

### Core Quest Addon

- **Quest Database** - 10,000+ quests with locations, objectives, and rewards
- **World Map** - Quest givers, objectives, and turn-ins displayed
- **Minimap** - Quest icons with configurable size and transparency
- **Quest Tracker** - Movable, resizable, with progress tracking
- **Smart Routing** - Optimized quest routes with hearthstone integration
- **Advanced Filtering** - By level, faction, class, profession, events
- **Quest Browser** - Search and browse all quests by zone
- **Database Browser** - Items, NPCs, objects with spawn locations

### Automated Quest Capture

- **Auto-Detection** - Detects new quests not in database
- **NPC Tracking** - 4 fallback methods for reliable NPC capture
- **Zone Accuracy** - Correct zone IDs even with map open to different zones
- **Objective Tracking** - Records where you complete each objective
- **Item Drops** - Tracks quest item sources
- **Live Display** - Captured quests show on map immediately
- **Capture Monitor UI** - Real-time display of captured data

### External Merger Tool

**Standalone .exe Version:**
- ✅ No Python required
- ✅ Graphical interface
- ✅ Settings dialog with browse buttons
- ✅ Activity log with color coding
- ✅ Start/Stop with button click
- ✅ Windows startup integration
- ✅ Automatic dependency installer

**Python Script Version:**
- ✅ Lightweight (~50 KB)
- ✅ Command-line interface
- ✅ Easy to modify
- ✅ Fast startup

### Performance Optimizations

- Deferred quest processing (no stutter on accept/turn-in)
- Event-driven NPC caching (removed constant OnUpdate)
- Optimized routing calculations (reduced frequency)
- Smart routing only for complex routes (>3 nodes)
- Limited expensive checks (sampling instead of full scans)

---

## 🔧 Building the .exe

Want to build the standalone executable yourself?

```bash
cd Interface\pfQuest-Tools\Merger via EXE\
# Double-click BUILD_EXE.bat or run:
python build_exe.py
```

**Output:** `../dist/pfQuest Merger Tool.exe`

**Requirements:** Python 3.7+, PyInstaller, psutil (auto-installed by build script)

---

## 🤝 Contributing

### Share Your Captured Quests

Captured quest data is saved to:
```
pfQuest-wotlk\db\captured\quests.lua
```

To contribute:
1. Play and capture quests
2. Share your `captured\quests.lua` file
3. Others copy it to their addon folder
4. Community database grows!

### Submit Improvements

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

### Report Issues

Found a bug or have a suggestion?
- Open an issue on GitHub
- Include `/questcapture status` output
- Enable debug: `/run pfQuest_CaptureConfig.debug = true`
- Share relevant log messages

---

## 📖 Documentation

- **[Complete Guide](pfQuest-Tools/dist/PFQUEST_COMPLETE_GUIDE.md)** - Full features and troubleshooting
- **[Quick Setup](pfQuest-Tools/dist/PFQUEST_SETUP_QUICK.md)** - 5-minute setup guide
- **[Distribution Guide](pfQuest-Tools/DISTRIBUTION_README.txt)** - How to share
- **[Build Instructions](pfQuest-Tools/Merger%20via%20EXE/EXE_BUILD_INSTRUCTIONS.md)** - Building the .exe
- **[GPL Compliance](pfQuest-Tools/GPL_COMPLIANCE.txt)** - License information

---

## 📁 Repository Structure

```
pfQuest-Enhanced/
├── pfQuest-wotlk/              # Main addon
│   ├── questcapture.lua        # Automated capture system
│   ├── database.lua            # Database core
│   ├── quest.lua               # Quest logic
│   ├── map.lua                 # Map integration
│   ├── tracker.lua             # Quest tracker
│   ├── config.lua              # Configuration UI
│   ├── route.lua               # Smart routing
│   ├── db/                     # Quest database
│   │   └── captured/           # Captured quests
│   └── ...
│
├── pfQuest-bronzebeard/        # Server-specific overrides (optional)
│
└── pfQuest-Tools/              # Merger tool
    ├── dist/                   # .exe version (ready to use)
    │   └── pfQuest Merger Tool.exe
    ├── Merger via EXE/         # Build tools
    │   └── BUILD_EXE.bat
    └── Merger via CMD/         # Python version
        └── RUN_MERGER_HERE.bat
```

---

## 🎯 System Requirements

### For WoW Addon:
- World of Warcraft 3.3.5 (WotLK)

### For Merger Tool (.exe):
- Windows 7 or later
- **No Python required!**

### For Merger Tool (Python):
- Windows 7 or later
- Python 3.7+
- psutil package

---

## 🐛 Troubleshooting

### Quest Not Showing on Map?

1. Enable quest display: `/pfquest config` → "Show Available Quests"
2. Enable low-level quests: `/pfquest config` → "Show Low Level Quests"
3. Check completion status: `/pfquest history check`
4. Try: `/reload` or restart game

### NPC Detection Failed?

- Always target or mouseover the quest giver before accepting
- Enable debug: `/run pfQuest_CaptureConfig.debug = true`
- Check: `/questcapture status`

### Performance Issues?

- Disable smart routing: `/pfquest config` → Routes → Smart Routing OFF
- All optimizations are already applied in this version

### Merger Tool Issues?

**.exe version:**
- Make sure `pfquest_db_merger.py` is in the same folder
- Verify paths in Settings dialog

**Python version:**
- Install psutil: `python -m pip install psutil`
- Edit `pfquest_db_merger.py` to set correct paths

---

## 📜 License

This project is licensed under **GNU General Public License v3.0**

### Original Work
- **pfQuest** by [Shagu](https://github.com/shagu/pfQuest)
- Licensed under GPL v3.0

### Modifications
- **Automated Quest Capture System**
- **External Merger Tool** (GUI + CLI)
- **Performance Optimizations**
- **Enhanced Features**
- Also licensed under GPL v3.0

See [LICENSE.txt](pfQuest-wotlk/LICENSE.txt) and [MODIFICATIONS.txt](pfQuest-wotlk/MODIFICATIONS.txt) for details.

---

## 🙏 Credits

### Original pfQuest
- **Author:** [Shagu](https://github.com/shagu)
- **Repository:** https://github.com/shagu/pfQuest
- **License:** GNU GPL v3.0

### Enhancements
- Automated quest capture system
- External merger tool with process monitoring
- Accurate zone ID calculation
- Per-character quest history
- Live database injection
- Performance optimizations
- Enhanced UI/UX
- Comprehensive documentation

### Dependencies
- **psutil** - Process monitoring (BSD License)
- **PyInstaller** - Executable building (GPL v2.0)
- **tkinter** - GUI framework (PSF License)

---

## 🚀 Roadmap

### Completed
- ✅ Automated quest capture
- ✅ External merger tool (.exe + Python)
- ✅ Per-character history
- ✅ Performance optimizations
- ✅ Windows startup integration

### Planned
- 🔲 System tray integration
- 🔲 Auto-update checker
- 🔲 Custom icon for .exe
- 🔲 Multi-language support
- 🔲 Quest chain visualization
- 🔲 Community quest database server

---

## 💬 Community

Found this useful? Consider:
- ⭐ Starring this repository
- 🐛 Reporting bugs
- 💡 Suggesting features
- 📤 Sharing your captured quests
- 🤝 Contributing improvements

---

## 📊 Project Stats

- **10,000+** quests in database
- **14** major features
- **1,800+** lines of capture system code
- **~70%** CPU usage reduction from optimizations
- **100%** GPL v3.0 compliant

---

## 🔗 Links

- **Original pfQuest:** https://github.com/shagu/pfQuest
- **License:** https://www.gnu.org/licenses/gpl-3.0.html
- **WoW 3.3.5 Documentation:** https://wowwiki-archive.fandom.com/

---

**Made with ❤️ for the WoW 3.3.5 community**

*Help expand the quest database - every quest you capture helps everyone!* 🎮


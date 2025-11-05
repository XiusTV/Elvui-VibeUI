# pfQuest Merger Tool - .exe Version Summary

## What Was Created

### 1. **Enhanced GUI** (`pfquest_merger_gui.py`)
**New Features Added:**
- ✅ **Windows Startup Integration** - Checkbox in Settings to start with Windows
- ✅ **Registry Management** - Adds/removes from Windows startup registry
- ✅ **Complete Dependency Installer** - Installs psutil AND pyinstaller
- ✅ **Exe Detection** - Detects if running as .exe or script
- ✅ **Auto-path Detection** - Uses correct path for startup registry

**Windows Startup Functions:**
```python
is_in_startup()      # Check if in registry
add_to_startup()     # Add to HKEY_CURRENT_USER\...\Run
remove_from_startup() # Remove from registry
```

### 2. **Build System**

**Files Created:**
- `BUILD_EXE.bat` - One-click build launcher
- `build_exe.py` - Python build script
- `requirements_full.txt` - All dependencies
- `EXE_BUILD_INSTRUCTIONS.md` - Complete build guide

**Build Process:**
```
Double-click BUILD_EXE.bat
  ↓
Checks Python installed
  ↓
Installs PyInstaller & psutil
  ↓
Runs PyInstaller
  ↓
Creates single .exe file
  ↓
Copies required files to dist\
  ↓
Done!
```

**Output:**
```
dist\
├── pfQuest Merger Tool.exe     ← 15-20 MB standalone
├── pfquest_db_merger.py        ← Required
├── *.md files                  ← Documentation
└── *.txt files                 ← Guides
```

### 3. **User Documentation**
- `EXE_USER_README.txt` - For end users
- `EXE_BUILD_INSTRUCTIONS.md` - For building
- `EXE_SUMMARY.md` - This file

---

## How To Build The .exe

### Quick Method:
```
1. Double-click: BUILD_EXE.bat
2. Wait for build to complete
3. Find .exe in dist\ folder
```

### Manual Method:
```bash
# Install dependencies
python -m pip install psutil pyinstaller

# Build
pyinstaller --onefile --windowed --name "pfQuest Merger Tool" pfquest_merger_gui.py

# Copy required files to dist\
copy pfquest_db_merger.py dist\
```

---

## What Users Get

### Minimal Package:
```
pfQuest-Merger-Tool\
├── pfQuest Merger Tool.exe
├── pfquest_db_merger.py
└── EXE_USER_README.txt
```

**Size:** ~15-20 MB (includes Python runtime)

**Requirements:** Just Windows 7+ (no Python needed!)

---

## Features in .exe Version

### From Settings Dialog:

**Path Configuration:**
- Game Path (browse button)
- Addon Path (browse button)
- Game Executable (text entry)
- Check Interval (spinner)
- Cooldown (spinner)

**Startup Options:**
- ☐ Auto-start monitoring on launch
- ☐ **Start with Windows** ⭐ NEW!

### From Tools Menu:

**Install Dependencies:**
Now installs BOTH:
1. psutil (for process monitoring)
2. pyinstaller (for building .exe)

Shows progress in log:
```
Installing psutil (1/2)...
✓ psutil installed successfully
Installing pyinstaller (2/2)...
✓ pyinstaller installed successfully
✓ All 2 dependencies installed successfully!
```

---

## Windows Startup Integration

### How It Works:

**When User Enables "Start with Windows":**
1. Tool adds registry entry:
   ```
   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run
   "pfQuest Merger" = "C:\Path\To\pfQuest Merger Tool.exe"
   ```
2. Windows auto-starts tool on login
3. (Optional) Tool auto-starts monitoring

**When User Disables:**
1. Tool removes registry entry
2. No longer starts with Windows

**Checkbox State:**
- Checked = In Windows startup
- Unchecked = Not in startup
- Auto-detects current state on Settings open

---

## Technical Details

### Exe vs Script Detection:
```python
if getattr(sys, 'frozen', False):
    # Running as .exe
    exe_path = sys.executable
else:
    # Running as .py script
    exe_path = os.path.abspath(__file__)
```

### PyInstaller Options Used:
```bash
--onefile          # Single .exe (not folder)
--windowed         # No console window
--name "pfQuest Merger Tool"  # Output name
--hidden-import=psutil         # Include psutil
--hidden-import=tkinter        # Include tkinter
```

### File Dependencies:
**Required in same folder:**
- `pfquest_db_merger.py` - The actual merger script

**Optional:**
- Documentation files
- Config file (auto-created)

---

## Comparison: Script vs .exe

| Feature | Python Script | .exe |
|---------|--------------|------|
| **Python Required** | ✅ Yes | ❌ No |
| **File Size** | ~50 KB | ~15-20 MB |
| **Portability** | Need Python | Fully portable |
| **Startup Speed** | Fast | Slightly slower |
| **User-Friendly** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Distribution** | Complex | Simple |
| **Windows Startup** | ✅ Yes | ✅ Yes |
| **All Features** | ✅ Yes | ✅ Yes |

---

## Distribution Strategy

### For General Users:
**Give them:**
```
pfQuest-Merger-Tool.zip
├── pfQuest Merger Tool.exe
├── pfquest_db_merger.py
└── EXE_USER_README.txt
```

**Instructions:**
1. Extract zip
2. Double-click .exe
3. Configure paths
4. Click Start Monitoring

### For Advanced Users:
**Give them:**
```
pfQuest-Merger-Tool-Complete.zip
├── pfQuest Merger Tool.exe
├── pfquest_db_merger.py
├── EXE_USER_README.txt
├── PFQUEST_COMPLETE_GUIDE.md
├── PFQUEST_SETUP_QUICK.md
└── GUI_README.txt
```

### For Developers:
**Give them:**
```
pfQuest-Merger-Source.zip
├── pfquest_merger_gui.py
├── pfquest_db_merger.py
├── build_exe.py
├── BUILD_EXE.bat
├── requirements_full.txt
├── EXE_BUILD_INSTRUCTIONS.md
└── All documentation files
```

---

## Testing Checklist

Before distributing the .exe:

**Build Tests:**
- [ ] Builds without errors
- [ ] .exe is created in dist\
- [ ] File size reasonable (~15-20 MB)
- [ ] Required files copied to dist\

**Functionality Tests:**
- [ ] .exe launches without errors
- [ ] GUI displays correctly
- [ ] Settings dialog opens
- [ ] Path browsing works
- [ ] Settings save/load
- [ ] Start/Stop monitoring works
- [ ] Game detection works
- [ ] Merge completes successfully
- [ ] Activity log updates
- [ ] All menus accessible

**Windows Startup Tests:**
- [ ] "Start with Windows" checkbox works
- [ ] Registry entry created correctly
- [ ] Tool starts on Windows login
- [ ] Tool can be removed from startup
- [ ] Works on clean Windows install

**Cross-PC Tests:**
- [ ] Works on PC without Python
- [ ] Works with different paths
- [ ] Works with different game .exe names
- [ ] Antivirus doesn't block

---

## Common Issues & Solutions

### Issue: Antivirus flags .exe
**Cause:** PyInstaller exes are sometimes flagged as false positives

**Solutions:**
1. Add exception in antivirus
2. Digitally sign the .exe (requires certificate)
3. Submit to antivirus vendor as false positive
4. Use alternative packager (Nuitka, cx_Freeze)

### Issue: .exe won't start
**Causes:**
- Missing Visual C++ Redistributable
- Corrupted build
- Antivirus blocking

**Solutions:**
- Install VC++ Redist: https://aka.ms/vs/17/release/vc_redist.x64.exe
- Rebuild with `--debug` flag
- Check antivirus logs

### Issue: "pfquest_db_merger.py not found"
**Cause:** User moved .exe without required files

**Solution:**
- Keep .exe and .py file together
- Add warning in README

### Issue: Windows startup not working
**Causes:**
- User ran from network drive
- Path contains special characters
- Registry permissions issue

**Solutions:**
- Run from local drive
- Use quotes around path in registry
- Run as administrator (once) to set registry

---

## Future Enhancements

### Potential Additions:
1. **System Tray Icon** - Minimize to tray
2. **Custom Icon** - Add pfQuest icon to .exe
3. **Auto-Updates** - Check for new versions
4. **Portable Mode** - Store config in .exe directory
5. **Multi-Language** - Support other languages
6. **Themes** - Dark mode, custom colors
7. **Notifications** - Windows toast notifications
8. **Installer** - Proper Windows installer (.msi)

### Code for System Tray (example):
```python
import pystray
from PIL import Image

# Create tray icon
icon = pystray.Icon("pfQuest Merger")
icon.icon = Image.open("icon.ico")
icon.menu = pystray.Menu(
    pystray.MenuItem("Show", show_window),
    pystray.MenuItem("Exit", exit_app)
)
icon.run()
```

---

## File Structure After Build

### Development:
```
pfQuest-Tools\
├── pfquest_merger_gui.py       ← Source
├── pfquest_db_merger.py        ← Merger script
├── build_exe.py                ← Build script
├── BUILD_EXE.bat               ← Build launcher
├── requirements_full.txt       ← Dependencies
├── build\                      ← Temp (PyInstaller)
├── dist\                       ← Output
│   ├── pfQuest Merger Tool.exe ← THE EXE
│   └── pfquest_db_merger.py    ← Copied
└── pfQuest Merger Tool.spec    ← PyInstaller spec
```

### Distribution:
```
pfQuest-Merger-Tool\
├── pfQuest Merger Tool.exe
├── pfquest_db_merger.py
└── EXE_USER_README.txt
```

---

## Build Process Details

### What PyInstaller Does:

1. **Analyzes** `pfquest_merger_gui.py`
2. **Finds** all imports (tkinter, psutil, etc.)
3. **Bundles** Python runtime
4. **Packages** all dependencies
5. **Creates** single .exe file
6. **Adds** manifest for Windows compatibility

### What Gets Included:

```
pfQuest Merger Tool.exe contains:
├── Python 3.x runtime
├── tkinter (GUI library)
├── psutil (process monitoring)
├── json (config handling)
├── threading (background monitoring)
├── All standard library modules
└── Your code (pfquest_merger_gui.py)
```

### What's External:
- `pfquest_db_merger.py` - Must be in same folder
- `merger_config.json` - Auto-created on first run

---

## Summary

### What You Have Now:

✅ **GUI Application** with Windows startup support
✅ **Build System** to create standalone .exe
✅ **Complete Documentation** for building and using
✅ **User Guides** for end users
✅ **Dependency Installer** for all requirements

### To Build:
```
Double-click: BUILD_EXE.bat
```

### To Distribute:
```
Give users: dist\pfQuest Merger Tool.exe + pfquest_db_merger.py
```

### To Use:
```
1. Configure paths in Settings
2. Enable "Start with Windows" (optional)
3. Click Start Monitoring
4. Play WoW!
```

---

**The pfQuest Merger Tool is now a professional, standalone Windows application!** 🎉


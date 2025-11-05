# pfQuest Merger - .exe Version Setup

## Using the .exe (Already Built)

**Location:** `../dist/pfQuest Merger Tool.exe`

### Quick Start:
1. Go to `../dist/` folder
2. Double-click `pfQuest Merger Tool.exe`
3. Click **Settings** button
4. Configure paths:
   - **Game Path**: Where Ascension.exe is (e.g., `D:\Games\Ascension\Live`)
   - **Addon Path**: Where pfQuest-wotlk is (e.g., `D:\Games\...\AddOns\pfQuest-wotlk`)
   - **Game Executable**: Usually `Ascension.exe`
5. (Optional) Check "Start with Windows"
6. Click **Save**
7. Click **▶ Start Monitoring**
8. Play WoW!

### When You Close the Game:
The tool automatically:
- Detects game closed
- Waits 10 seconds
- Extracts quest data
- Creates permanent database files
- Shows "✓ Merge complete!"

---

## Building the .exe

### Quick Build:
```
Double-click: BUILD_EXE.bat
```

### Requirements:
- Python 3.7+
- PyInstaller (auto-installed)
- psutil (auto-installed)

### Output:
```
../dist/pfQuest Merger Tool.exe
```

### When to Rebuild:
- After modifying `pfquest_merger_gui.py`
- After updating merger logic
- To distribute latest version

---

## Files in This Folder:

- `BUILD_EXE.bat` - Build launcher
- `build_exe.py` - Build script
- `pfquest_merger_gui.py` - Source code
- `requirements_full.txt` - Build dependencies
- `EXE_BUILD_INSTRUCTIONS.md` - Complete build guide
- `EXE_SUMMARY.md` - Technical details
- `EXE_USER_README.txt` - End user instructions

---

## Full Documentation:

See `../dist/PFQUEST_COMPLETE_GUIDE.md` for complete features and troubleshooting.


# Building pfQuest Merger Tool Executable

## Quick Build (Recommended)

### One-Click Build:
```
Double-click: BUILD_EXE.bat
```

This will:
1. Check if Python is installed
2. Install PyInstaller if needed
3. Install psutil if needed
4. Build the .exe file
5. Copy required files to `dist\` folder

**Output:**
```
dist\
├── pfQuest Merger Tool.exe     ← The executable!
├── pfquest_db_merger.py        ← Required
├── requirements.txt
├── PFQUEST_COMPLETE_GUIDE.md
├── PFQUEST_SETUP_QUICK.md
└── GUI_README.txt
```

---

## Manual Build

### 1. Install Dependencies
```bash
python -m pip install psutil pyinstaller
```

### 2. Build Executable
```bash
pyinstaller --onefile --windowed --name "pfQuest Merger Tool" pfquest_merger_gui.py
```

### 3. Copy Required Files
Copy these files to the `dist\` folder:
- `pfquest_db_merger.py` (required - the merger script)
- Documentation files (optional)

---

## What Gets Created

### Single File:
```
pfQuest Merger Tool.exe
```

**Size:** ~15-20 MB (includes Python runtime + all dependencies)

**Portable:** Can be moved anywhere, no installation needed

**No Python Required:** Users don't need Python installed to run it

---

## Distribution

### Minimal Package (For Users):
```
pfQuest-Merger-Tool/
├── pfQuest Merger Tool.exe     ← Main application
├── pfquest_db_merger.py        ← Required (merger script)
└── README.txt                  ← Quick instructions
```

### Complete Package:
```
pfQuest-Merger-Tool/
├── pfQuest Merger Tool.exe
├── pfquest_db_merger.py
├── PFQUEST_COMPLETE_GUIDE.md
├── PFQUEST_SETUP_QUICK.md
├── GUI_README.txt
└── README.txt
```

---

## Usage After Building

### For You (Developer):
1. Find `.exe` in `dist\` folder
2. Test it by double-clicking
3. If it works, distribute the `dist\` folder

### For Users:
1. Download/copy the `dist\` folder
2. Rename to `pfQuest-Merger-Tool`
3. Double-click `pfQuest Merger Tool.exe`
4. Configure paths in Settings
5. Click Start Monitoring

---

## Features Preserved in .exe

✅ Full GUI functionality
✅ Settings dialog
✅ Path configuration
✅ Start/Stop monitoring
✅ Activity log
✅ Windows startup integration
✅ Dependency installer
✅ All tools and help menus

---

## Requirements for Building

**On Your PC (to build):**
- Python 3.7+
- PyInstaller
- psutil

**On User's PC (to run .exe):**
- **Nothing!** Just Windows
- No Python needed
- No dependencies needed

---

## Troubleshooting Build Issues

### "PyInstaller not found"
```bash
python -m pip install pyinstaller
```

### "psutil not found"
```bash
python -m pip install psutil
```

### Build fails with import errors
Add hidden imports:
```bash
pyinstaller --hidden-import=psutil --hidden-import=tkinter ...
```

### .exe is too large
This is normal! Includes Python runtime (~15-20 MB).
Can't be reduced much without losing portability.

### Antivirus flags .exe
PyInstaller exes are sometimes flagged as false positives.
Solution: Add exception or digitally sign the exe.

---

## Adding an Icon (Optional)

### 1. Create/Find Icon File
- Format: `.ico`
- Size: 256x256 recommended
- Name: `pfquest_icon.ico`

### 2. Update Build Command
```bash
pyinstaller --onefile --windowed --icon=pfquest_icon.ico --name "pfQuest Merger Tool" pfquest_merger_gui.py
```

Or update `build_exe.py`:
```python
"--icon=pfquest_icon.ico",  # Instead of "--icon=NONE"
```

---

## Advanced Options

### Console Version (for debugging):
```bash
pyinstaller --onefile --name "pfQuest Merger Tool" pfquest_merger_gui.py
```
(Remove `--windowed` to see console output)

### Include Additional Files:
```bash
pyinstaller --add-data "config.json;." --add-data "docs;docs" ...
```

### Multiple Files (not single .exe):
```bash
pyinstaller --name "pfQuest Merger Tool" pfquest_merger_gui.py
```
(Remove `--onefile` - creates folder with dependencies)

---

## Testing the .exe

### Before Distribution:
1. ✅ Run on your PC
2. ✅ Test all features:
   - Start/Stop monitoring
   - Settings dialog
   - Path configuration
   - Dependency installer
   - Windows startup option
3. ✅ Test on another PC (without Python)
4. ✅ Test with antivirus enabled

### Checklist:
- [ ] .exe runs without errors
- [ ] GUI displays correctly
- [ ] Settings save/load
- [ ] Monitoring works
- [ ] Merger script is found
- [ ] All tools work
- [ ] Help menus accessible

---

## File Structure for Distribution

### Recommended:
```
pfQuest-Enhanced/
├── pfQuest-Merger-Tool/
│   ├── pfQuest Merger Tool.exe  ← GUI
│   ├── pfquest_db_merger.py     ← Required
│   └── README.txt               ← Instructions
│
└── pfQuest-wotlk/                ← The addon
    └── ... (addon files)
```

Users get:
1. The .exe tool (in its own folder)
2. The addon (separate folder)

Clear separation, easy to understand.

---

## FAQ

**Q: Do users need Python?**
A: No! The .exe includes Python runtime.

**Q: Can I move the .exe?**
A: Yes, but keep `pfquest_db_merger.py` in same folder.

**Q: Why is it 15+ MB?**
A: Includes Python + tkinter + psutil. Necessary for portability.

**Q: Is it safe?**
A: Yes, but antiviruses may flag PyInstaller exes as suspicious (false positive).

**Q: Can I rename it?**
A: Yes, but keep the .py file with it.

**Q: Does it need admin rights?**
A: No, runs as normal user.

---

## Next Steps After Building

1. Test the .exe thoroughly
2. Create a release package:
   ```
   pfQuest-Enhanced-v1.0.zip
   ├── pfQuest-Merger-Tool/
   │   ├── pfQuest Merger Tool.exe
   │   ├── pfquest_db_merger.py
   │   └── README.txt
   └── pfQuest-wotlk/
       └── (addon files)
   ```

3. Write user instructions
4. Distribute!

---

**Happy building!** 🎉


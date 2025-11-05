================================================================================
                    pfQuest Merger - EXE Version
================================================================================

THIS FOLDER: Build tools for creating the standalone .exe

The actual .exe is already built and located in: ..\dist\

================================================================================

TO BUILD THE .EXE:
==================

QUICK BUILD:
------------
Double-click: BUILD_EXE.bat

This will:
1. Check if dependencies are installed
2. Install missing dependencies (pyinstaller, psutil)
3. Build the .exe
4. Copy files to ..\dist\

OUTPUT:
-------
..\dist\pfQuest Merger Tool.exe

TIME:
-----
~1-2 minutes for first build
~30 seconds for rebuilds

REQUIREMENTS:
-------------
• Python 3.7+
• PyInstaller (auto-installed by BUILD_EXE.bat)
• psutil (auto-installed by BUILD_EXE.bat)

Or install manually:
python -m pip install -r requirements_full.txt

================================================================================

FILES IN THIS FOLDER:
=====================

BUILD TOOLS:
------------
BUILD_EXE.bat               - Build launcher (DOUBLE-CLICK THIS)
build_exe.py                - Build script
requirements_full.txt       - Build dependencies (psutil + pyinstaller)

SOURCE CODE:
------------
pfquest_merger_gui.py       - GUI application source

DOCUMENTATION:
--------------
EXE_BUILD_INSTRUCTIONS.md   - Complete build guide
EXE_SUMMARY.md              - Technical details
EXE_USER_README.txt         - End user guide (for dist\ folder)
README.txt                  - This file

================================================================================

AFTER BUILDING:
===============

The .exe will be in: ..\dist\pfQuest Merger Tool.exe

To use it yourself:
→ Go to ..\dist\
→ Double-click: pfQuest Merger Tool.exe

To share with others:
→ Zip the ..\dist\ folder
→ Send it to them
→ They just run the .exe (no Python needed!)

================================================================================

FOR END USERS:
==============

If you received this folder as an end user, you DON'T need this!

Just use: ..\dist\pfQuest Merger Tool.exe
(Already built and ready to use)

See: ..\dist\EXE_USER_README.txt for instructions

================================================================================

REBUILD WHEN:
=============

• You modify pfquest_merger_gui.py
• You modify pfquest_db_merger.py
• You want latest version
• .exe has bugs (rebuild with fixes)

Just run: BUILD_EXE.bat

================================================================================

TROUBLESHOOTING:
================

"Python not found"
→ Install from: https://python.org/downloads

"pyinstaller not found"
→ Run: python -m pip install pyinstaller

"Build failed"
→ Check: build_exe.py output for errors
→ See: EXE_BUILD_INSTRUCTIONS.md

"Dependencies won't install"
→ Try: python -m pip install --user pyinstaller psutil

================================================================================

Questions? See: EXE_BUILD_INSTRUCTIONS.md


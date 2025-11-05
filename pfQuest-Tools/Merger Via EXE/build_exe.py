#!/usr/bin/env python3
"""
Build script for pfQuest Merger GUI
Creates a standalone .exe file
"""

import os
import sys
import subprocess
import shutil

def check_and_install_dependencies():
    """Check for dependencies and install only if missing"""
    dependencies = {
        "pyinstaller": "PyInstaller",
        "psutil": "psutil"
    }
    
    missing = []
    installed = []
    
    print("Checking dependencies...")
    print("-" * 60)
    
    for package_name, import_name in dependencies.items():
        try:
            __import__(import_name.lower())
            print(f"✓ {package_name} found")
            installed.append(package_name)
        except ImportError:
            print(f"✗ {package_name} not installed")
            missing.append(package_name)
    
    print()
    
    if missing:
        print(f"Installing {len(missing)} missing package(s)...")
        print("-" * 60)
        
        for package in missing:
            print(f"Installing {package}...")
            result = subprocess.run(
                [sys.executable, "-m", "pip", "install", package],
                capture_output=True,
                text=True
            )
            
            if result.returncode == 0:
                print(f"✓ {package} installed successfully")
            else:
                print(f"✗ {package} installation failed")
                print(f"Error: {result.stderr}")
                return False
        
        print()
    else:
        print("✓ All dependencies already installed")
        print()
    
    return True

def main():
    print("=" * 60)
    print("pfQuest Merger Tool - Build Script")
    print("=" * 60)
    print()
    
    # Check and install dependencies
    if not check_and_install_dependencies():
        print()
        print("=" * 60)
        print("✗ Dependency installation failed!")
        print("=" * 60)
        print()
        input("Press Enter to exit...")
        return
    
    print()
    print("Building executable...")
    print("-" * 60)
    
    # Build command - use Python module syntax to avoid PATH issues
    cmd = [
        sys.executable,                 # Python executable
        "-m", "PyInstaller",            # Run PyInstaller as module
        "--onefile",                    # Single executable
        "--windowed",                   # No console window
        "--name=pfQuest Merger Tool",   # Output name
        "--hidden-import=psutil",       # Include psutil
        "--hidden-import=tkinter",      # Include tkinter
        "--hidden-import=json",         # Include json
        "--hidden-import=threading",    # Include threading
        "pfquest_merger_gui.py"         # Source file
    ]
    
    # Add config file if it exists
    if os.path.exists("merger_config.json"):
        cmd.insert(-1, "--add-data=merger_config.json;.")
    
    # Run PyInstaller
    print(f"Running: {' '.join(cmd)}")
    print()
    result = subprocess.run(cmd)
    
    if result.returncode == 0:
        print()
        print("=" * 60)
        print("✓ Build successful!")
        print("=" * 60)
        print()
        print("Executable location:")
        print("  dist\\pfQuest Merger Tool.exe")
        print()
        print("You can now:")
        print("  1. Run the .exe directly")
        print("  2. Create a shortcut to it")
        print("  3. Move it anywhere you want")
        print()
        
        # Copy required files to dist
        print("Copying required files to dist folder...")
        dist_path = os.path.join("dist")
        
        files_to_copy = [
            "pfquest_db_merger.py",
            "requirements.txt",
            "PFQUEST_COMPLETE_GUIDE.md",
            "PFQUEST_SETUP_QUICK.md",
            "GUI_README.txt",
        ]
        
        for file in files_to_copy:
            if os.path.exists(file):
                shutil.copy(file, dist_path)
                print(f"  ✓ Copied {file}")
        
        print()
        print("The dist folder now contains everything you need!")
        print()
        
    else:
        print()
        print("=" * 60)
        print("✗ Build failed!")
        print("=" * 60)
        print()
        print("Check the error messages above.")
        print()
    
    input("Press Enter to exit...")

if __name__ == "__main__":
    main()


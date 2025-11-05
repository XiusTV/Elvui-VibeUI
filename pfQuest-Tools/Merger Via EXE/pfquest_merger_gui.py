#!/usr/bin/env python3
"""
pfQuest Database Merger - GUI Controller
Graphical interface to start/stop the merger and configure paths
"""

import os
import sys
import json
import threading
import tkinter as tk
from tkinter import ttk, filedialog, messagebox, scrolledtext
from datetime import datetime
from pathlib import Path

# Import the merger module
try:
    import psutil
except ImportError:
    psutil = None

class MergerConfig:
    """Configuration manager for merger settings"""
    
    def __init__(self, config_file="merger_config.json"):
        self.config_file = config_file
        self.config = self.load_config()
    
    def load_config(self):
        """Load configuration from file"""
        if os.path.exists(self.config_file):
            try:
                with open(self.config_file, 'r') as f:
                    return json.load(f)
            except Exception as e:
                print(f"Error loading config: {e}")
        
        # Default configuration
        return {
            "game_exe": "Ascension.exe",
            "game_path": r"D:\Games\Ascension\Live",
            "addon_path": r"D:\Games\Ascension\Live\Interface\AddOns\pfQuest-wotlk",
            "check_interval": 5,
            "cooldown_after_close": 10,
            "auto_start": False,
            "minimize_to_tray": False,
        }
    
    def save_config(self):
        """Save configuration to file"""
        try:
            with open(self.config_file, 'w') as f:
                json.dump(self.config, f, indent=2)
            return True
        except Exception as e:
            print(f"Error saving config: {e}")
            return False
    
    def get(self, key, default=None):
        return self.config.get(key, default)
    
    def set(self, key, value):
        self.config[key] = value

class MergerGUI:
    """Main GUI application"""
    
    def __init__(self, root):
        self.root = root
        self.root.title("pfQuest Database Merger")
        self.root.geometry("800x600")
        self.root.minsize(600, 400)
        
        # Configuration
        self.config = MergerConfig()
        
        # State
        self.is_running = False
        self.merger_thread = None
        self.game_was_running = False
        self.last_merge_time = 0
        
        # Get executable path for startup
        if getattr(sys, 'frozen', False):
            # Running as compiled exe
            self.exe_path = sys.executable
        else:
            # Running as script
            self.exe_path = os.path.abspath(__file__)
        
        # Setup GUI
        self.setup_menu()
        self.setup_gui()
        
        # Check for psutil
        if psutil is None:
            self.log_error("psutil not installed! Click 'Install Dependencies' in the Tools menu.")
        
        # Auto-start if configured
        if self.config.get("auto_start", False):
            self.root.after(1000, self.start_monitoring)
    
    def setup_menu(self):
        """Setup menu bar"""
        menubar = tk.Menu(self.root)
        self.root.config(menu=menubar)
        
        # File menu
        file_menu = tk.Menu(menubar, tearoff=0)
        menubar.add_cascade(label="File", menu=file_menu)
        file_menu.add_command(label="Settings", command=self.show_settings)
        file_menu.add_separator()
        file_menu.add_command(label="Exit", command=self.on_closing)
        
        # Tools menu
        tools_menu = tk.Menu(menubar, tearoff=0)
        menubar.add_cascade(label="Tools", menu=tools_menu)
        tools_menu.add_command(label="Install Dependencies", command=self.install_dependencies)
        tools_menu.add_command(label="Test Paths", command=self.test_paths)
        tools_menu.add_command(label="Open Addon Folder", command=self.open_addon_folder)
        tools_menu.add_command(label="Clear Log", command=self.clear_log)
        
        # Help menu
        help_menu = tk.Menu(menubar, tearoff=0)
        menubar.add_cascade(label="Help", menu=help_menu)
        help_menu.add_command(label="Quick Start", command=self.show_quick_start)
        help_menu.add_command(label="About", command=self.show_about)
    
    def setup_gui(self):
        """Setup main GUI elements"""
        
        # Main container
        main_frame = ttk.Frame(self.root, padding="10")
        main_frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        self.root.columnconfigure(0, weight=1)
        self.root.rowconfigure(0, weight=1)
        main_frame.columnconfigure(0, weight=1)
        main_frame.rowconfigure(1, weight=1)
        
        # ===== Top Section: Controls =====
        control_frame = ttk.LabelFrame(main_frame, text="Controls", padding="10")
        control_frame.grid(row=0, column=0, sticky=(tk.W, tk.E), pady=(0, 10))
        control_frame.columnconfigure(1, weight=1)
        
        # Status indicator
        ttk.Label(control_frame, text="Status:").grid(row=0, column=0, sticky=tk.W, padx=(0, 5))
        
        self.status_label = ttk.Label(control_frame, text="Stopped", foreground="red", font=("Arial", 10, "bold"))
        self.status_label.grid(row=0, column=1, sticky=tk.W)
        
        # Start/Stop button
        self.start_stop_btn = ttk.Button(control_frame, text="▶ Start Monitoring", command=self.toggle_monitoring, width=20)
        self.start_stop_btn.grid(row=0, column=2, padx=5)
        
        # Settings button
        ttk.Button(control_frame, text="⚙ Settings", command=self.show_settings, width=12).grid(row=0, column=3, padx=5)
        
        # Game status
        ttk.Label(control_frame, text="Game:").grid(row=1, column=0, sticky=tk.W, padx=(0, 5), pady=(5, 0))
        
        self.game_status_label = ttk.Label(control_frame, text="Not Running", foreground="gray")
        self.game_status_label.grid(row=1, column=1, sticky=tk.W, pady=(5, 0))
        
        # Progress bar
        self.progress = ttk.Progressbar(control_frame, mode='indeterminate', length=200)
        self.progress.grid(row=1, column=2, columnspan=2, sticky=(tk.W, tk.E), padx=5, pady=(5, 0))
        
        # ===== Middle Section: Configuration Display =====
        config_frame = ttk.LabelFrame(main_frame, text="Current Configuration", padding="10")
        config_frame.grid(row=1, column=0, sticky=(tk.W, tk.E), pady=(0, 10))
        config_frame.columnconfigure(1, weight=1)
        
        # Game Path
        ttk.Label(config_frame, text="Game Path:").grid(row=0, column=0, sticky=tk.W, padx=(0, 5))
        self.game_path_display = ttk.Label(config_frame, text=self.config.get("game_path"), foreground="blue")
        self.game_path_display.grid(row=0, column=1, sticky=tk.W)
        
        # Addon Path
        ttk.Label(config_frame, text="Addon Path:").grid(row=1, column=0, sticky=tk.W, padx=(0, 5), pady=(5, 0))
        self.addon_path_display = ttk.Label(config_frame, text=self.config.get("addon_path"), foreground="blue")
        self.addon_path_display.grid(row=1, column=1, sticky=tk.W, pady=(5, 0))
        
        # Game EXE
        ttk.Label(config_frame, text="Game Executable:").grid(row=2, column=0, sticky=tk.W, padx=(0, 5), pady=(5, 0))
        self.game_exe_display = ttk.Label(config_frame, text=self.config.get("game_exe"), foreground="blue")
        self.game_exe_display.grid(row=2, column=1, sticky=tk.W, pady=(5, 0))
        
        # ===== Bottom Section: Log =====
        log_frame = ttk.LabelFrame(main_frame, text="Activity Log", padding="10")
        log_frame.grid(row=2, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        log_frame.columnconfigure(0, weight=1)
        log_frame.rowconfigure(0, weight=1)
        
        # Log text area
        self.log_text = scrolledtext.ScrolledText(log_frame, wrap=tk.WORD, height=15, font=("Consolas", 9))
        self.log_text.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        # Log initial message
        self.log("pfQuest Database Merger initialized")
        self.log(f"Monitoring for: {self.config.get('game_exe')}")
        self.log(f"Game path: {self.config.get('game_path')}")
        self.log(f"Addon path: {self.config.get('addon_path')}")
        self.log("Click 'Start Monitoring' to begin")
        self.log("")
        
        # Configure window close handler
        self.root.protocol("WM_DELETE_WINDOW", self.on_closing)
    
    def log(self, message, level="info"):
        """Add message to log"""
        timestamp = datetime.now().strftime("%H:%M:%S")
        
        # Color coding
        colors = {
            "info": "black",
            "success": "green",
            "warning": "orange",
            "error": "red",
        }
        color = colors.get(level, "black")
        
        # Add to log
        self.log_text.insert(tk.END, f"[{timestamp}] {message}\n")
        
        # Color the line
        line_start = f"{self.log_text.index(tk.END)}-1 lines"
        self.log_text.tag_add(level, line_start, tk.END)
        self.log_text.tag_config(level, foreground=color)
        
        # Auto-scroll to bottom
        self.log_text.see(tk.END)
        
        # Update GUI
        self.root.update_idletasks()
    
    def log_success(self, message):
        self.log(message, "success")
    
    def log_warning(self, message):
        self.log(message, "warning")
    
    def log_error(self, message):
        self.log(message, "error")
    
    def clear_log(self):
        """Clear the log"""
        self.log_text.delete(1.0, tk.END)
    
    def toggle_monitoring(self):
        """Start or stop monitoring"""
        if self.is_running:
            self.stop_monitoring()
        else:
            self.start_monitoring()
    
    def start_monitoring(self):
        """Start the monitoring thread"""
        if psutil is None:
            messagebox.showerror("Error", "psutil not installed!\n\nClick Tools → Install Dependencies")
            return
        
        if not self.validate_paths():
            return
        
        self.is_running = True
        self.start_stop_btn.config(text="■ Stop Monitoring")
        self.status_label.config(text="Running", foreground="green")
        self.progress.start(10)
        
        self.log_success("Monitoring started")
        
        # Start monitoring thread
        self.merger_thread = threading.Thread(target=self.monitor_loop, daemon=True)
        self.merger_thread.start()
    
    def stop_monitoring(self):
        """Stop the monitoring thread"""
        self.is_running = False
        self.start_stop_btn.config(text="▶ Start Monitoring")
        self.status_label.config(text="Stopped", foreground="red")
        self.progress.stop()
        
        self.log_warning("Monitoring stopped")
    
    def monitor_loop(self):
        """Main monitoring loop (runs in separate thread)"""
        check_interval = self.config.get("check_interval", 5)
        game_exe = self.config.get("game_exe")
        
        while self.is_running:
            try:
                # Check if game is running
                is_running = self.is_game_running(game_exe)
                
                # Update game status (must run in main thread)
                self.root.after(0, self.update_game_status, is_running)
                
                # Detect game state changes
                if is_running and not self.game_was_running:
                    self.root.after(0, self.log_success, f"✓ {game_exe} started")
                    self.game_was_running = True
                
                elif not is_running and self.game_was_running:
                    self.root.after(0, self.log_success, f"✓ {game_exe} closed")
                    self.game_was_running = False
                    
                    # Trigger merge after cooldown
                    self.root.after(0, self.start_merge)
                
                # Wait before next check
                for _ in range(check_interval):
                    if not self.is_running:
                        break
                    threading.Event().wait(1)
                
            except Exception as e:
                self.root.after(0, self.log_error, f"Error in monitor loop: {e}")
                threading.Event().wait(check_interval)
    
    def is_game_running(self, game_exe):
        """Check if game process is running"""
        if psutil is None:
            return False
        
        for proc in psutil.process_iter(['name']):
            try:
                if proc.info['name'] == game_exe:
                    return True
            except (psutil.NoSuchProcess, psutil.AccessDenied):
                pass
        return False
    
    def update_game_status(self, is_running):
        """Update game status label"""
        if is_running:
            self.game_status_label.config(text="Running", foreground="green")
        else:
            self.game_status_label.config(text="Not Running", foreground="gray")
    
    def start_merge(self):
        """Start the merge process"""
        cooldown = self.config.get("cooldown_after_close", 10)
        
        self.log(f"Waiting {cooldown} seconds for files to save...")
        
        # Start cooldown in separate thread
        threading.Thread(target=self.merge_after_cooldown, args=(cooldown,), daemon=True).start()
    
    def merge_after_cooldown(self, cooldown):
        """Wait for cooldown, then merge"""
        import time
        time.sleep(cooldown)
        
        # Import merger functions
        try:
            # Add current directory to path
            sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
            
            # Import the merger module dynamically
            from pfquest_db_merger import find_saved_variables, merge_into_pfdb
            
            self.root.after(0, self.log, "Finding SavedVariables...")
            
            saved_vars = find_saved_variables()
            
            if saved_vars:
                self.root.after(0, self.log_success, f"Found SavedVariables: {os.path.basename(saved_vars)}")
                
                # Perform merge
                success = merge_into_pfdb(saved_vars)
                
                if success:
                    self.root.after(0, self.log_success, "✓ Merge complete!")
                else:
                    self.root.after(0, self.log_warning, "No changes to merge")
            else:
                self.root.after(0, self.log_error, "Could not find SavedVariables file")
        
        except Exception as e:
            self.root.after(0, self.log_error, f"Merge failed: {e}")
    
    def validate_paths(self):
        """Validate configured paths"""
        game_path = self.config.get("game_path")
        addon_path = self.config.get("addon_path")
        
        if not os.path.exists(game_path):
            messagebox.showerror("Invalid Path", f"Game path does not exist:\n{game_path}\n\nPlease configure in Settings.")
            return False
        
        if not os.path.exists(addon_path):
            messagebox.showerror("Invalid Path", f"Addon path does not exist:\n{addon_path}\n\nPlease configure in Settings.")
            return False
        
        return True
    
    def show_settings(self):
        """Show settings dialog"""
        SettingsDialog(self.root, self.config, self.on_settings_saved, self.exe_path)
    
    def on_settings_saved(self):
        """Called when settings are saved"""
        # Update display
        self.game_path_display.config(text=self.config.get("game_path"))
        self.addon_path_display.config(text=self.config.get("addon_path"))
        self.game_exe_display.config(text=self.config.get("game_exe"))
        
        self.log("Settings updated")
        
        # Save to file
        if self.config.save_config():
            self.log_success("Configuration saved")
        
        # Update merger script config file
        self.update_merger_config()
    
    def update_merger_config(self):
        """Update the merger script's configuration"""
        try:
            # Update the pfquest_db_merger.py file's configuration
            script_path = os.path.join(os.path.dirname(__file__), "pfquest_db_merger.py")
            
            if os.path.exists(script_path):
                with open(script_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                
                # Update paths in the script
                import re
                
                content = re.sub(
                    r'GAME_PATH = r"[^"]*"',
                    f'GAME_PATH = r"{self.config.get("game_path")}"',
                    content
                )
                
                content = re.sub(
                    r'ADDON_PATH = r"[^"]*"',
                    f'ADDON_PATH = r"{self.config.get("addon_path")}"',
                    content
                )
                
                content = re.sub(
                    r'GAME_EXE = "[^"]*"',
                    f'GAME_EXE = "{self.config.get("game_exe")}"',
                    content
                )
                
                with open(script_path, 'w', encoding='utf-8') as f:
                    f.write(content)
                
                self.log("Updated merger script configuration")
        
        except Exception as e:
            self.log_warning(f"Could not update merger script: {e}")
    
    def test_paths(self):
        """Test if paths are valid"""
        game_path = self.config.get("game_path")
        addon_path = self.config.get("addon_path")
        game_exe = self.config.get("game_exe")
        
        errors = []
        
        if not os.path.exists(game_path):
            errors.append(f"Game path not found: {game_path}")
        
        if not os.path.exists(addon_path):
            errors.append(f"Addon path not found: {addon_path}")
        
        if not os.path.exists(os.path.join(addon_path, "pfQuest-wotlk.toc")):
            errors.append("pfQuest-wotlk.toc not found in addon path")
        
        if errors:
            messagebox.showerror("Path Test Failed", "\n\n".join(errors))
            self.log_error("Path test failed")
        else:
            messagebox.showinfo("Path Test", "All paths are valid!")
            self.log_success("Path test successful")
    
    def open_addon_folder(self):
        """Open addon folder in file explorer"""
        addon_path = self.config.get("addon_path")
        
        if os.path.exists(addon_path):
            import subprocess
            subprocess.Popen(f'explorer "{addon_path}"')
        else:
            messagebox.showerror("Error", f"Addon path does not exist:\n{addon_path}")
    
    def install_dependencies(self):
        """Check and install missing Python dependencies"""
        self.log("Checking dependencies...")
        
        def install():
            import subprocess
            
            # List of all dependencies with their import names
            dependencies = {
                "psutil": "psutil",
                "pyinstaller": "PyInstaller",
            }
            
            # Check which are missing
            missing = []
            installed = []
            
            for package, import_name in dependencies.items():
                try:
                    __import__(import_name.lower())
                    self.root.after(0, self.log_success, f"✓ {package} already installed")
                    installed.append(package)
                except ImportError:
                    self.root.after(0, self.log_warning, f"✗ {package} not found")
                    missing.append(package)
            
            if not missing:
                self.root.after(0, self.log_success, "✓ All dependencies already installed!")
                self.root.after(0, messagebox.showinfo, "All Set", "All dependencies are already installed.\n\nNo action needed!")
                return
            
            # Install missing packages
            self.root.after(0, self.log, f"Installing {len(missing)} missing package(s)...")
            
            total = len(missing)
            success_count = 0
            
            for i, package in enumerate(missing, 1):
                self.root.after(0, self.log, f"Installing {package} ({i}/{total})...")
                
                try:
                    result = subprocess.run(
                        [sys.executable, "-m", "pip", "install", package],
                        capture_output=True,
                        text=True
                    )
                    
                    if result.returncode == 0:
                        self.root.after(0, self.log_success, f"✓ {package} installed successfully")
                        success_count += 1
                    else:
                        self.root.after(0, self.log_error, f"✗ {package} failed: {result.stderr}")
                
                except Exception as e:
                    self.root.after(0, self.log_error, f"✗ {package} error: {e}")
            
            # Summary
            if success_count == total:
                self.root.after(0, self.log_success, f"✓ All {total} missing dependencies installed successfully!")
                self.root.after(0, messagebox.showinfo, "Success", f"All missing dependencies installed!\n\n{success_count}/{total} packages successful.\n\nTotal installed: {len(installed) + success_count}/{len(dependencies)}")
            else:
                self.root.after(0, self.log_warning, f"Installed {success_count}/{total} missing dependencies")
                self.root.after(0, messagebox.showwarning, "Partial Success", f"Installed {success_count}/{total} missing dependencies.\n\nCheck log for details.")
        
        threading.Thread(target=install, daemon=True).start()
    
    def show_quick_start(self):
        """Show quick start guide"""
        guide = """
QUICK START GUIDE

1. CONFIGURE PATHS
   - Click Settings
   - Set Game Path (where Ascension.exe is)
   - Set Addon Path (pfQuest-wotlk folder)
   - Click Save

2. START MONITORING
   - Click "Start Monitoring"
   - Leave this window open

3. PLAY THE GAME
   - Accept and complete quests
   - System captures data automatically

4. CLOSE THE GAME
   - Merger detects game closed
   - Waits 10 seconds
   - Extracts and merges quest data
   - Shows "Merge complete!" message

5. RESTART THE GAME
   - Captured quests now permanent
   - Shows for all characters
   - Survives /reload

COMMANDS IN-GAME:
/questcapture - View captures
/pfquest config - Settings
        """
        
        messagebox.showinfo("Quick Start Guide", guide)
    
    def show_about(self):
        """Show about dialog"""
        about = """
pfQuest Database Merger GUI
Version 1.0

Graphical interface for the pfQuest automated
quest capture and database merger system.

Features:
• Start/stop monitoring
• Configurable paths
• Activity logging
• Automatic merging

Based on pfQuest by Shagu
Enhanced with automated quest capture

License: GNU GPL v3.0
        """
        
        messagebox.showinfo("About", about)
    
    def on_closing(self):
        """Handle window close"""
        if self.is_running:
            if messagebox.askyesno("Confirm Exit", "Monitoring is active. Stop and exit?"):
                self.stop_monitoring()
                self.root.destroy()
        else:
            self.root.destroy()

class SettingsDialog:
    """Settings dialog window"""
    
    def __init__(self, parent, config, callback, exe_path):
        self.config = config
        self.callback = callback
        self.exe_path = exe_path
        
        self.dialog = tk.Toplevel(parent)
        self.dialog.title("Settings")
        self.dialog.geometry("600x400")
        self.dialog.transient(parent)
        self.dialog.grab_set()
        
        self.setup_gui()
        
        # Center on parent
        self.dialog.update_idletasks()
        x = parent.winfo_x() + (parent.winfo_width() - self.dialog.winfo_width()) // 2
        y = parent.winfo_y() + (parent.winfo_height() - self.dialog.winfo_height()) // 2
        self.dialog.geometry(f"+{x}+{y}")
    
    def setup_gui(self):
        """Setup settings GUI"""
        main_frame = ttk.Frame(self.dialog, padding="20")
        main_frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        self.dialog.columnconfigure(0, weight=1)
        self.dialog.rowconfigure(0, weight=1)
        main_frame.columnconfigure(1, weight=1)
        
        row = 0
        
        # Game Path
        ttk.Label(main_frame, text="Game Path:").grid(row=row, column=0, sticky=tk.W, pady=5)
        
        game_path_frame = ttk.Frame(main_frame)
        game_path_frame.grid(row=row, column=1, sticky=(tk.W, tk.E), pady=5)
        game_path_frame.columnconfigure(0, weight=1)
        
        self.game_path_var = tk.StringVar(value=self.config.get("game_path"))
        ttk.Entry(game_path_frame, textvariable=self.game_path_var).grid(row=0, column=0, sticky=(tk.W, tk.E), padx=(0, 5))
        ttk.Button(game_path_frame, text="Browse", command=self.browse_game_path, width=10).grid(row=0, column=1)
        
        row += 1
        
        # Addon Path
        ttk.Label(main_frame, text="Addon Path:").grid(row=row, column=0, sticky=tk.W, pady=5)
        
        addon_path_frame = ttk.Frame(main_frame)
        addon_path_frame.grid(row=row, column=1, sticky=(tk.W, tk.E), pady=5)
        addon_path_frame.columnconfigure(0, weight=1)
        
        self.addon_path_var = tk.StringVar(value=self.config.get("addon_path"))
        ttk.Entry(addon_path_frame, textvariable=self.addon_path_var).grid(row=0, column=0, sticky=(tk.W, tk.E), padx=(0, 5))
        ttk.Button(addon_path_frame, text="Browse", command=self.browse_addon_path, width=10).grid(row=0, column=1)
        
        row += 1
        
        # Game Executable
        ttk.Label(main_frame, text="Game Executable:").grid(row=row, column=0, sticky=tk.W, pady=5)
        self.game_exe_var = tk.StringVar(value=self.config.get("game_exe"))
        ttk.Entry(main_frame, textvariable=self.game_exe_var).grid(row=row, column=1, sticky=(tk.W, tk.E), pady=5)
        
        row += 1
        
        # Check Interval
        ttk.Label(main_frame, text="Check Interval (seconds):").grid(row=row, column=0, sticky=tk.W, pady=5)
        self.check_interval_var = tk.IntVar(value=self.config.get("check_interval", 5))
        ttk.Spinbox(main_frame, from_=1, to=60, textvariable=self.check_interval_var, width=10).grid(row=row, column=1, sticky=tk.W, pady=5)
        
        row += 1
        
        # Cooldown
        ttk.Label(main_frame, text="Cooldown After Close (seconds):").grid(row=row, column=0, sticky=tk.W, pady=5)
        self.cooldown_var = tk.IntVar(value=self.config.get("cooldown_after_close", 10))
        ttk.Spinbox(main_frame, from_=0, to=60, textvariable=self.cooldown_var, width=10).grid(row=row, column=1, sticky=tk.W, pady=5)
        
        row += 1
        
        # Auto-start monitoring
        self.auto_start_var = tk.BooleanVar(value=self.config.get("auto_start", False))
        ttk.Checkbutton(main_frame, text="Auto-start monitoring on launch", variable=self.auto_start_var).grid(row=row, column=0, columnspan=2, sticky=tk.W, pady=5)
        
        row += 1
        
        # Start with Windows
        self.start_with_windows_var = tk.BooleanVar(value=self.is_in_startup())
        ttk.Checkbutton(main_frame, text="Start with Windows (run on system startup)", variable=self.start_with_windows_var).grid(row=row, column=0, columnspan=2, sticky=tk.W, pady=5)
        
        row += 1
        
        # Buttons
        button_frame = ttk.Frame(main_frame)
        button_frame.grid(row=row, column=0, columnspan=2, sticky=(tk.W, tk.E), pady=20)
        
        ttk.Button(button_frame, text="Save", command=self.save, width=15).pack(side=tk.RIGHT, padx=5)
        ttk.Button(button_frame, text="Cancel", command=self.dialog.destroy, width=15).pack(side=tk.RIGHT)
    
    def browse_game_path(self):
        """Browse for game path"""
        path = filedialog.askdirectory(title="Select Game Directory", initialdir=self.game_path_var.get())
        if path:
            self.game_path_var.set(path)
    
    def browse_addon_path(self):
        """Browse for addon path"""
        path = filedialog.askdirectory(title="Select pfQuest Addon Directory", initialdir=self.addon_path_var.get())
        if path:
            self.addon_path_var.set(path)
    
    def save(self):
        """Save settings"""
        self.config.set("game_path", self.game_path_var.get())
        self.config.set("addon_path", self.addon_path_var.get())
        self.config.set("game_exe", self.game_exe_var.get())
        self.config.set("check_interval", self.check_interval_var.get())
        self.config.set("cooldown_after_close", self.cooldown_var.get())
        self.config.set("auto_start", self.auto_start_var.get())
        
        # Handle Windows startup
        if self.start_with_windows_var.get():
            self.add_to_startup()
        else:
            self.remove_from_startup()
        
        self.callback()
        self.dialog.destroy()
    
    def is_in_startup(self):
        """Check if app is in Windows startup"""
        try:
            import winreg
            key = winreg.OpenKey(winreg.HKEY_CURRENT_USER, r"Software\Microsoft\Windows\CurrentVersion\Run", 0, winreg.KEY_READ)
            try:
                winreg.QueryValueEx(key, "pfQuest Merger")
                winreg.CloseKey(key)
                return True
            except WindowsError:
                winreg.CloseKey(key)
                return False
        except:
            return False
    
    def add_to_startup(self):
        """Add app to Windows startup"""
        try:
            import winreg
            key = winreg.OpenKey(winreg.HKEY_CURRENT_USER, r"Software\Microsoft\Windows\CurrentVersion\Run", 0, winreg.KEY_SET_VALUE)
            
            # Use the exe_path passed to dialog
            winreg.SetValueEx(key, "pfQuest Merger", 0, winreg.REG_SZ, f'"{self.exe_path}"')
            winreg.CloseKey(key)
            messagebox.showinfo("Success", "pfQuest Merger will now start with Windows")
        except Exception as e:
            messagebox.showerror("Error", f"Could not add to startup:\n{e}")
    
    def remove_from_startup(self):
        """Remove app from Windows startup"""
        try:
            import winreg
            key = winreg.OpenKey(winreg.HKEY_CURRENT_USER, r"Software\Microsoft\Windows\CurrentVersion\Run", 0, winreg.KEY_SET_VALUE)
            try:
                winreg.DeleteValue(key, "pfQuest Merger")
                winreg.CloseKey(key)
                messagebox.showinfo("Success", "pfQuest Merger removed from Windows startup")
            except WindowsError:
                # Key doesn't exist, that's fine
                winreg.CloseKey(key)
        except Exception as e:
            messagebox.showerror("Error", f"Could not remove from startup:\n{e}")

def main():
    """Main entry point"""
    root = tk.Tk()
    app = MergerGUI(root)
    root.mainloop()

if __name__ == "__main__":
    main()


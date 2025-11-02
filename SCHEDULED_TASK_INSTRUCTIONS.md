# Daily Sync Scheduled Task Setup Instructions

## Overview
This repository now includes a daily sync feature that automatically copies changes from your Ascension AddOns directory to this GitHub repository and commits them.

## Setup Instructions

### Option 1: Setup via GUI (Recommended)

1. **Open PowerShell as Administrator**
   - Press `Windows Key + X`
   - Select "Windows PowerShell (Admin)" or "Terminal (Admin)"
   - Click "Yes" on the UAC prompt

2. **Navigate to the repository**
   ```powershell
   cd E:\Github\Elvui-VibeUI
   ```

3. **Run the setup script**
   ```powershell
   PowerShell -ExecutionPolicy Bypass -File .\setup_daily_sync.ps1
   ```

4. **Follow the on-screen instructions**
   - The task will be created to run daily at 2:00 AM
   - Changes will be auto-committed with message "Auto-sync from Ascension AddOns"

### Option 2: Manual Task Creation

1. **Open Task Scheduler**
   - Press `Windows Key + R`
   - Type `taskschd.msc` and press Enter

2. **Create Basic Task**
   - Click "Create Basic Task" in the right panel
   - Name: `ElvUI-VibeUI-DailySync`
   - Description: `Sync Ascension AddOns to GitHub repository daily`
   - Trigger: Daily
   - Time: 2:00 AM
   - Action: Start a program
   - Program: `PowerShell.exe`
   - Arguments: `-NoProfile -ExecutionPolicy Bypass -File "E:\Github\Elvui-VibeUI\sync_from_ascension.ps1" -AutoCommit`
   - Start in: `E:\Github\Elvui-VibeUI`

3. **Configure Additional Settings**
   - Right-click the task → Properties
   - General tab: Check "Run whether user is logged on or not"
   - General tab: Check "Run with highest privileges"
   - Settings tab: Check "Allow task to be run on demand"
   - Settings tab: Check "Run task as soon as possible after a scheduled start is missed"
   - Conditions tab: Uncheck "Start the task only if the computer is on AC power"
   - Conditions tab: Check "Wake the computer to run this task"

## Managing the Task

### View Task Status
```powershell
Get-ScheduledTask -TaskName "ElvUI-VibeUI-DailySync" | Select-Object TaskName, State, @{Name='NextRunTime';Expression={(Get-ScheduledTaskInfo $_.TaskName).NextRunTime}}
```

### Run Task Manually
```powershell
Start-ScheduledTask -TaskName "ElvUI-VibeUI-DailySync"
```

### Disable Task
```powershell
Disable-ScheduledTask -TaskName "ElvUI-VibeUI-DailySync"
```

### Enable Task
```powershell
Enable-ScheduledTask -TaskName "ElvUI-VibeUI-DailySync"
```

### Remove Task
```powershell
Unregister-ScheduledTask -TaskName "ElvUI-VibeUI-DailySync" -Confirm:$false
```

### View Task History
1. Open Task Scheduler (taskschd.msc)
2. Find "ElvUI-VibeUI-DailySync" in the Task Scheduler Library
3. Click on the task
4. View "History" tab at the bottom

## Manual Sync Script Usage

### Without Auto-Commit (Review Changes First)
```powershell
cd E:\Github\Elvui-VibeUI
.\sync_from_ascension.ps1
```

### With Auto-Commit (Immediate Commit)
```powershell
cd E:\Github\Elvui-VibeUI
.\sync_from_ascension.ps1 -AutoCommit
```

### With Custom Commit Message
```powershell
cd E:\Github\Elvui-VibeUI
.\sync_from_ascension.ps1 -AutoCommit -CommitMessage "Custom sync message"
```

## Notes

- The scheduled task requires Git to be installed and in your PATH
- The task will only sync if there are actual file changes
- If AutoCommit is enabled, all changes will be committed automatically
- Make sure your GitHub credentials are configured (or use SSH keys)
- The task runs at 2:00 AM daily by default (adjustable in setup script)

## Troubleshooting

### Task Not Running
- Check Task Scheduler for error messages
- Verify Git is accessible from command line
- Check that file paths are correct
- Verify GitHub authentication is configured

### Permission Errors
- Ensure task is set to "Run with highest privileges"
- Verify Git config has correct user.name and user.email
- Check Windows Firewall settings

### No Changes Being Detected
- Verify Ascension AddOns directory paths are correct
- Check file modification times match your expectations
- Run the sync script manually to see detailed output


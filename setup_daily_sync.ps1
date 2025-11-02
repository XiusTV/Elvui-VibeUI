# Setup Daily Sync Task
# This script creates a Windows scheduled task to sync Ascension AddOns daily

Write-Host "Creating daily sync scheduled task..." -ForegroundColor Cyan
Write-Host ""

# Check if running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "ERROR: This script must be run as Administrator!" -ForegroundColor Red
    Write-Host "Right-click PowerShell and select 'Run as Administrator'" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

# Define task details
$taskName = "ElvUI-VibeUI-DailySync"
$taskDescription = "Sync Ascension AddOns to GitHub repository daily"
$scriptPath = "E:\Github\Elvui-VibeUI\sync_from_ascension.ps1"
$workingDir = "E:\Github\Elvui-VibeUI"

# Check if task already exists and remove it
$existingTask = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
if ($existingTask) {
    Write-Host "Removing existing task..." -ForegroundColor Yellow
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
}

# Check if script exists
if (-not (Test-Path $scriptPath)) {
    Write-Host "ERROR: Script not found: $scriptPath" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Create scheduled task action
$action = New-ScheduledTaskAction `
    -Execute "PowerShell.exe" `
    -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`" -AutoCommit" `
    -WorkingDirectory $workingDir

# Create scheduled task trigger (daily at 2:00 AM)
$trigger = New-ScheduledTaskTrigger -Daily -At 2:00AM

# Create scheduled task principal (run as current user)
$principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -RunLevel Highest

# Create settings
$settings = New-ScheduledTaskSettingsSet `
    -AllowStartIfOnBatteries `
    -DontStopIfGoingOnBatteries `
    -StartWhenAvailable `
    -RunOnlyIfNetworkAvailable

# Register the task
try {
    Register-ScheduledTask `
        -TaskName $taskName `
        -Action $action `
        -Trigger $trigger `
        -Principal $principal `
        -Settings $settings `
        -Description $taskDescription `
        -Force
    
    Write-Host ""
    Write-Host "Scheduled task created successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Task Name: $taskName" -ForegroundColor Cyan
    Write-Host "Schedule: Daily at 2:00 AM" -ForegroundColor Cyan
    Write-Host "Script: $scriptPath" -ForegroundColor Cyan
    Write-Host "Auto-commit: Enabled" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "To manage this task:" -ForegroundColor Yellow
    Write-Host "  - Open Task Scheduler (taskschd.msc)" -ForegroundColor White
    Write-Host "  - Find 'ElvUI-VibeUI-DailySync' under Task Scheduler Library" -ForegroundColor White
    Write-Host "  - Or run: Get-ScheduledTask -TaskName '$taskName'" -ForegroundColor White
} catch {
    Write-Host ""
    Write-Host "ERROR: Failed to create scheduled task" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}

Write-Host ""
Read-Host "Press Enter to exit"


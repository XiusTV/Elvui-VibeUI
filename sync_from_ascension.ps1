# Sync Ascension AddOns to GitHub Repository
# This script copies changes from Ascension to the GitHub repository

Write-Host "Syncing Ascension AddOns to GitHub repository..." -ForegroundColor Cyan
Write-Host ""

# Define paths
$ascensionElvUI = "E:\Games\Ascension\Live\Interface\AddOns\ElvUI"
$ascensionElvUI_OptionsUI = "E:\Games\Ascension\Live\Interface\AddOns\ElvUI_OptionsUI"
$githubElvUI = "E:\Github\Elvui-VibeUI\ElvUI"
$githubElvUI_OptionsUI = "E:\Github\Elvui-VibeUI\ElvUI_OptionsUI"

# Check if paths exist
if (-not (Test-Path $ascensionElvUI)) {
    Write-Host "ERROR: Ascension ElvUI path not found: $ascensionElvUI" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $ascensionElvUI_OptionsUI)) {
    Write-Host "ERROR: Ascension ElvUI_OptionsUI path not found: $ascensionElvUI_OptionsUI" -ForegroundColor Red
    exit 1
}

# Change to GitHub repository directory
Set-Location "E:\Github\Elvui-VibeUI"

# Add Git to PATH
$env:Path += ";C:\Program Files\Git\bin"

# Sync ElvUI
Write-Host "Syncing ElvUI..." -ForegroundColor Yellow
robocopy "$ascensionElvUI" "$githubElvUI" /MIR /XD .git /NP /NDL /NFL /R:3 /W:5
$elvuiResult = $LASTEXITCODE

# Sync ElvUI_OptionsUI
Write-Host ""
Write-Host "Syncing ElvUI_OptionsUI..." -ForegroundColor Yellow
robocopy "$ascensionElvUI_OptionsUI" "$githubElvUI_OptionsUI" /MIR /XD .git /NP /NDL /NFL /R:3 /W:5
$optionsResult = $LASTEXITCODE

# Check if any files changed
Write-Host ""
Write-Host "Checking for changes..." -ForegroundColor Yellow
$changes = git status --short

if ($changes) {
    Write-Host ""
    Write-Host "Changes detected:" -ForegroundColor Green
    Write-Host $changes
    
    Write-Host ""
    Write-Host "Files changed. Please review and commit manually:" -ForegroundColor Cyan
    Write-Host "  git add -A" -ForegroundColor White
    Write-Host "  git commit -m 'Your commit message'" -ForegroundColor White
    Write-Host "  git push origin main" -ForegroundColor White
} else {
    Write-Host ""
    Write-Host "No changes detected. Repository is up to date." -ForegroundColor Green
}

Write-Host ""
Write-Host "Sync complete!" -ForegroundColor Green


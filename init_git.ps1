# ElvUI Git Repository Initialization Script
# Run this script to create a git repository for ElvUI

Write-Host "Initializing Git Repository for ElvUI..." -ForegroundColor Cyan
Write-Host ""

# Check if git is available
try {
    $gitVersion = git --version 2>&1
    Write-Host "Git found: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Git is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Git from https://git-scm.com/download/win" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

# Initialize repository
Write-Host "Initializing git repository..." -ForegroundColor Yellow
git init

# Configure git (update with your info)
Write-Host "Configuring git repository..." -ForegroundColor Yellow
git config user.name "Your Name"
git config user.email "your.email@example.com"

# Add all files
Write-Host "Adding files to repository..." -ForegroundColor Yellow
git add .

# Create initial commit
Write-Host "Creating initial commit..." -ForegroundColor Yellow
git commit -m "Initial commit: ElvUI v1.0.0 for WotLK 3.3.5

- Complete UI replacement addon
- All core modules included
- Action Bars, Unit Frames, Nameplates, Bags, Chat, Maps
- Data Texts and Data Bars
- Comprehensive skinning system
- Full customization options
- oUF framework integration
- Ace3 libraries embedded"

Write-Host ""
Write-Host "Git repository initialized successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Update git config with your name and email:"
Write-Host "   git config user.name 'Your Name'"
Write-Host "   git config user.email 'your.email@example.com'"
Write-Host ""
Write-Host "2. (Optional) Create a GitHub/GitLab repository and add remote:"
Write-Host "   git remote add origin https://github.com/yourusername/ElvUI.git"
Write-Host "   git branch -M main"
Write-Host "   git push -u origin main"
Write-Host ""

Read-Host "Press Enter to exit"


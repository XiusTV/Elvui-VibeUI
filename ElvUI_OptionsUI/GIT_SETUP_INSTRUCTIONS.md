# Git Setup Instructions for ElvUI

This document explains how to set up Git repositories for ElvUI and ElvUI_OptionsUI.

## Prerequisites

1. **Install Git**
   - Download from: https://git-scm.com/download/win
   - During installation, choose "Git from the command line and also from 3rd-party software"
   - Use default settings for other options

2. **Verify Git Installation**
   ```powershell
   git --version
   ```
   Should display: `git version X.X.X`

## Quick Setup (Automated)

### For ElvUI:
1. Navigate to the ElvUI folder:
   ```powershell
   cd "E:\Games\Ascension\Live\Interface\AddOns\ElvUI"
   ```

2. Run the initialization script:
   ```powershell
   .\init_git.ps1
   ```

3. Update your Git identity:
   ```bash
   git config user.name "Your Name"
   git config user.email "your.email@example.com"
   ```

### For ElvUI_OptionsUI:
1. Navigate to the ElvUI_OptionsUI folder:
   ```powershell
   cd "E:\Games\Ascension\Live\Interface\AddOns\ElvUI_OptionsUI"
   ```

2. Run the initialization script:
   ```powershell
   .\init_git.ps1
   ```

3. Update your Git identity:
   ```bash
   git config user.name "Your Name"
   git config user.email "your.email@example.com"
   ```

## Manual Setup

If you prefer to set up Git manually:

### 1. Initialize Repository
```bash
cd "E:\Games\Ascension\Live\Interface\AddOns\ElvUI"
git init
```

### 2. Configure Git
```bash
git config user.name "Your Name"
git config user.email "your.email@example.com"
```

### 3. Add Files
```bash
git add .
```

### 4. Create Initial Commit
```bash
git commit -m "Initial commit: ElvUI v1.0.0 for WotLK 3.3.5"
```

Repeat the same steps for ElvUI_OptionsUI.

## Connecting to GitHub/GitLab

### Create Remote Repository

1. **On GitHub:**
   - Go to https://github.com/new
   - Create a new repository named `ElvUI`
   - Do NOT initialize with README (we already have files)

2. **On GitLab:**
   - Go to https://gitlab.com/projects/new
   - Create a new repository named `ElvUI`
   - Choose "Blank project"

### Link Local Repository to Remote

```bash
# Add remote
git remote add origin https://github.com/yourusername/ElvUI.git

# Rename branch to main (if needed)
git branch -M main

# Push to remote
git push -u origin main
```

## Files Created

### ElvUI:
- `.gitignore` - Specifies which files Git should ignore
- `.gitattributes` - Git file handling configuration
- `README.md` - Project documentation
- `CHANGELOG.md` - Version history and changes
- `init_git.ps1` - Automated Git initialization script
- `GIT_SETUP_INSTRUCTIONS.md` - This file

### ElvUI_OptionsUI:
- `.gitignore` - Specifies which files Git should ignore
- `.gitattributes` - Git file handling configuration
- `README.md` - Project documentation
- `CHANGELOG.md` - Version history and changes
- `init_git.ps1` - Automated Git initialization script

## Initial Commit Details

### ElvUI Commit Message:
```
Initial commit: ElvUI v1.0.0 for WotLK 3.3.5

- Complete UI replacement addon
- All core modules included
- Action Bars, Unit Frames, Nameplates, Bags, Chat, Maps
- Data Texts and Data Bars
- Comprehensive skinning system
- Full customization options
- oUF framework integration
- Ace3 libraries embedded
```

### ElvUI_OptionsUI Commit Message:
```
Initial commit: ElvUI_OptionsUI v1.0.0 for WotLK 3.3.5

- Configuration interface for ElvUI
- Comprehensive options panels for all modules
- Profile management system
- Import/Export functionality
- Load on demand for memory efficiency
```

## Common Git Commands

### Check Status
```bash
git status
```

### View Commit History
```bash
git log
git log --oneline
```

### Create New Commit
```bash
git add .
git commit -m "Your commit message"
```

### Push Changes
```bash
git push
```

### Pull Changes
```bash
git pull
```

### Create Branch
```bash
git checkout -b feature-name
```

### Switch Branch
```bash
git checkout branch-name
```

## Best Practices

1. **Commit Often** - Make small, focused commits
2. **Write Good Messages** - Describe what changed and why
3. **Use Branches** - Create feature branches for new work
4. **Keep .gitignore Updated** - Don't commit temporary or binary files
5. **Tag Releases** - Use semantic versioning (v1.0.0, v1.1.0, etc.)

### Example Tagging:
```bash
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

## Troubleshooting

### Git Not Recognized
- Ensure Git is installed
- Restart PowerShell/Terminal after installation
- Check PATH environment variable

### Permission Denied
- Ensure you have write permissions to the folder
- Run PowerShell as Administrator if needed

### Execution Policy Error
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Next Steps

1. **Initialize both repositories** (ElvUI and ElvUI_OptionsUI)
2. **Create GitHub/GitLab accounts** if you don't have them
3. **Create remote repositories** on GitHub/GitLab
4. **Push your local repositories** to the remote
5. **Start tracking changes** with regular commits

## Support

For Git help:
- Official Git Documentation: https://git-scm.com/doc
- GitHub Guides: https://guides.github.com/
- GitLab Docs: https://docs.gitlab.com/

For ElvUI questions:
- Check README.md in each addon folder
- Review CHANGELOG.md for version history


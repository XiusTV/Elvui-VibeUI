# Auto-Push Setup for ElvUI

## ✅ What's Configured

Your ElvUI addon now has the complete git repository moved from `E:\Github\`!

### Status:
- ✅ Git repository moved from E:\Github\Elvui-VibeUI
- ✅ Connected to https://github.com/XiusTV/Elvui-VibeUI.git
- ✅ `.gitignore` created (excludes user profiles and temp files)
- ✅ Post-commit hook installed for auto-push
- ⚠️ **Folder structure issue needs fixing** (see below)

## 🚨 IMPORTANT: Folder Structure Issue

Your GitHub repo expects files in a subfolder, but your active addon has them in root:

**Git expects:**
```
AddOns/ElvUI/
  ElvUI/                    <-- subfolder
    Core/
    Modules/
    ElvUI.toc
    etc...
```

**Your current structure:**
```
AddOns/ElvUI/
  Core/                     <-- files in root
  Modules/
  ElvUI.toc
  etc...
```

This is why `git status` shows everything as "deleted". You need to either:
- Restructure your addon to match GitHub
- OR update your GitHub repo structure

## 📝 Initial Commit

After connecting to GitHub:

```bash
cd "E:\Games\Ascension\Live\Interface\AddOns\ElvUI"
git add .
git commit -m "Initial commit: ElvUI custom configuration"
git push -u origin main
```

## 🎯 Daily Workflow (After Setup)

1. **Make your changes** in Cursor
2. **Stage changes:**
   ```bash
   cd "E:\Games\Ascension\Live\Interface\AddOns\ElvUI"
   git add .
   ```
3. **Commit (auto-pushes!):**
   ```bash
   git commit -m "Updated ElvUI settings"
   ```

The post-commit hook automatically pushes to GitHub! 🎉

## 📊 What's Included in Version Control

The `.gitignore` is configured to exclude:
- User profile data
- Temporary files (*.bak, *.old, *.tmp)
- IDE-specific files

All ElvUI core files and your customizations will be tracked.

## 🔍 Useful Commands

**Check status:**
```bash
git status
```

**View recent commits:**
```bash
git log --oneline -10
```

**Pull latest changes:**
```bash
git pull origin main
```


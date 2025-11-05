@echo off
echo ========================================
echo Clean pfQuest Injected Data
echo ========================================
echo.
echo This will remove pfQuest_InjectedData from your SavedVariables
echo to fix quest objectives not showing.
echo.
echo MAKE SURE WOW IS CLOSED!
echo.
pause

cd "E:\Games\Ascension\Live"

echo.
echo Backing up SavedVariables...
copy "WTF\Account\XIUS\SavedVariables\pfQuest-wotlk.lua" "WTF\Account\XIUS\SavedVariables\pfQuest-wotlk.lua.backup"

echo.
echo Cleaning pfQuest_InjectedData...
echo.

powershell -Command "$file = 'E:\Games\Ascension\Live\WTF\Account\XIUS\SavedVariables\pfQuest-wotlk.lua'; $content = Get-Content $file -Raw; $pattern = 'pfQuest_InjectedData\s*=\s*\{.*?\n\}'; $newContent = $content -replace $pattern, 'pfQuest_InjectedData = { [\"quests\"] = { [\"loc\"] = {}, [\"data\"] = {} }, [\"units\"] = { [\"loc\"] = {}, [\"data\"] = {} } }'; Set-Content $file $newContent"

echo.
echo Done! pfQuest_InjectedData has been cleared.
echo Backup saved to: pfQuest-wotlk.lua.backup
echo.
echo Now reload WoW with /reload
echo.
pause


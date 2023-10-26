@echo off
icacls * /reset /t /c /q 
cls



:Start
:: Entrypoint; ask user for platform
set /p user_input=Do you play rocket league on A.Steam or B.Epic Games (Enter A or B): 
if /i %user_input%==A goto Steam
if /i %user_input%==B (goto Epic) else (goto Invalid)



:Steam
:: Default steam setup starts
copy "files\bmrl.vbs" "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\bmrl.vbs" 
cls
:: Check for success
if exist "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\bmrl.vbs" (goto SteamDefault) else (goto Custom)




:SteamDefault
echo @echo off > files\bmrl.bat
echo start "" "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\rocketleague.exe" >> files\bmrl.bat
echo start "" "C:\Program Files\BakkesMod\BakkesMod.exe" >> files\bmrl.bat
echo :check_process_running >> files\bmrl.bat
echo timeout /t 10 /nobreak >nul 2>&1 >> files\bmrl.bat
echo tasklist /NH /FI "IMAGENAME eq rocketleague.exe" 2>nul | find /I /N "rocketleague.exe">nul >> files\bmrl.bat
echo if not "%ERRORLEVEL%"=="1" goto check_process_running >> files\bmrl.bat
echo timeout /t 10 /nobreak >nul 2>&1 >> files\bmrl.bat
echo taskkill /im "BakkesMod.exe" /f >> files\bmrl.bat
echo pause >> files\bmrl.bat
:: default bmrl.bat is created
copy "files\bmrl.bat" "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\bmrl.bat" 
cls
:: Steam launch options default setup script

:: Termination script
set /p user_input=press enter to exit, or press a to rerun setup.bat:
if /i %user_input%==a (goto Start) else (goto Exit)



:Custom
setlocal
echo Please select the location of your Rocket League folder. &>nul timeout /t 1
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please select the location of your Rocket League folder.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "RLfolder=%%I"
setlocal enabledelayedexpansion
:: rocketleague folder is selected and stored into %RLfolder%
echo @echo off > files\bmrl.bat
echo start "" "%RLfolder%\Binaries\Win64\rocketleague.exe" >> files\bmrl.bat
echo start "" "C:\Program Files\BakkesMod\BakkesMod.exe" >> files\bmrl.bat
echo :check_process_running >> files\bmrl.bat
echo timeout /t 10 /nobreak >nul 2>&1 >> files\bmrl.bat
echo tasklist /NH /FI "IMAGENAME eq rocketleague.exe" 2>nul | find /I /N "rocketleague.exe">nul >> files\bmrl.bat
echo if not "%ERRORLEVEL%"=="1" goto check_process_running >> files\bmrl.bat
echo timeout /t 10 /nobreak >nul 2>&1 >> files\bmrl.bat
echo taskkill /im "BakkesMod.exe" /f >> files\bmrl.bat
echo pause >> files\bmrl.bat
:: custom bmrl.bat is created
copy "files\bmrl.vbs" "%RLfolder%\Binaries\Win64\bmrl.vbs"
cls
copy "files\bmrl.bat" "%RLfolder%\Binaries\Win64\bmrl.bat"
cls
echo install complete!
:: Steam launch options script

:: Termination script
set /p user_input=press enter to exit, or press a to rerun setup.bat:
if /i %user_input%==a (goto Start) else (goto Exit)



:Epic
:: Epic Games setup starts
copy "files\bmrl.vbs" "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\bmrl.vbs"
cls
:: Check for success
if exist "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\bmrl.vbs" (goto EpicDefault) else (goto Custom)


:EpicDefault
:: bmrl.bat is created
echo @echo off > files\bmrl.bat
echo start "" "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\rocketleague.exe" >> files\bmrl.bat
echo start "" "C:\Program Files\BakkesMod\BakkesMod.exe" >> files\bmrl.bat
echo :check_process_running >> files\bmrl.bat
echo timeout /t 10 /nobreak >nul 2>&1 >> files\bmrl.bat
echo tasklist /NH /FI "IMAGENAME eq rocketleague.exe" 2>nul | find /I /N "rocketleague.exe">nul >> files\bmrl.bat
echo if not "%ERRORLEVEL%"=="1" goto check_process_running >> files\bmrl.bat
echo timeout /t 10 /nobreak >nul 2>&1 >> files\bmrl.bat
echo taskkill /im "BakkesMod.exe" /f >> files\bmrl.bat
echo pause >> files\bmrl.bat
:: bmrl.bat is copied to rocketleague folder 
copy "files\bmrl.bat" "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\bmrl.bat" 
cls
echo install complete!
:: Epic Games launch options default setup script

:: Termination script
set /p user_input=press enter to exit, or press a to rerun setup.bat:
if /i %user_input%==a (goto Start) else (goto Exit)


:Invalid
echo Error: %user_input% is an invalid, please try again!
pause
(goto Start)


:Exit
:: End of script
```

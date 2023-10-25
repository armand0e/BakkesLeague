@echo off
icacls * /reset /t /c /q 
cls



:Start
:: Entrypoint; ask user for platform
set /p user_input=Do you play rocket league on A.Steam or B.Epic Games (Enter A or B): 
if %user_input%==A goto Steam
if %user_input%==B (goto Epic) else (goto Invalid)



:Steam
:: Default steam setup starts
copy "files\bmrl.vbs" "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\bmrl.vbs"
:: Check for success
if exist "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\bmrl.vbs" (goto SteamDefault) else (goto SteamCustom)
pause



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
:: bmrl.bat is created
copy "files\bmrl.bat" "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\bmrl.bat"
pause
:: Steam launch options default setup script
goto Start



:SteamCustom
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
:: bmrl.bat is created
copy "files\bmrl.vbs" "%RLfolder%\Binaries\Win64\bmrl.vbs"
copy "files\bmrl.bat" "%RLfolder%\Binaries\Win64\bmrl.bat"
:: Files are copied to the rocketleague\Binaries\Win64 folder
endlocal
pause
:: Steam launch options script
goto Start



:Epic
:: Epic Games setup starts
setlocal
echo Please select the location of your Rocket League folder. &>nul timeout /t 1

set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please select the location of your Rocket League folder.',0,0).self.path""

for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "RLfolder=%%I"

setlocal enabledelayedexpansion
echo You selected: "%RLfolder%"
:: rocketleague folder is selected and stored into %RLfolder%
copy "files\bmrl.vbs" "%RLfolder%\Binaries\Win64\bmrl.vbs"
copy "files\epic\bmrl.bat" "%RLfolder%\Binaries\Win64\bmrl.bat"
:: Files are copied to the rocketleague\Binaries\Win64 folder
pause
:: Epic Games launch options script

goto Start

:Invalid
echo %user_input% is an invalid input, please try again!
pause
(goto Start)

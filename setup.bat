@echo off
icacls * /reset /t /c /q 
cls

:Start
:: Entrypoint; ask user for platform
set /p user_input=Do you play rocket league on A.Steam or B.Epic Games (Enter A or B): 
if %user_input%==A goto Steam
if %user_input%==B (goto Epic) else (goto Invalid)

:Steam
:: Steam setup starts
setlocal
echo. Please select the location of your Rocket League folder. &>nul timeout /t 1

set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please select the location of your Rocket League folder.',0,0).self.path""

for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "RLfolder=%%I"

setlocal enabledelayedexpansion
echo. You selected: "%RLfolder%"
:: rocketleague folder is selected and stored into %RLfolder%
copy "files\bmrl.vbs" "%RLfolder%\Binaries\Win64\bmrl.vbs"
copy "files\steam\bmrl.bat" "%RLfolder%\Binaries\Win64\bmrl.bat"
:: Files are copied to the rocketleague\Binaries\Win64 folder
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

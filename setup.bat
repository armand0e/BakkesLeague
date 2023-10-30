@echo off
icacls * /reset /t /c /q 
cls
set Error=0

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: START OF SCRIPT :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Start
:: ask user if they play on steam or epic

set /p user_input=Do you play rocket league on A.Steam or B.Epic Games (Enter A or B): 
if /i %user_input%==A goto Steam
if /i %user_input%==B (goto Epic) else (goto Invalid)

:: %RLfolder% and %bakkesfolder% are used to create a custom made bakkesleague.bat
:: more info in :::: RL FOLDER FUNCTIONS :::: and :::: BAKKESMOD FOLDER FUNCTIONS ::::

:batchwrite
echo @echo off > files\bakkesleague.bat
echo start "" "%RLfolder%\Binaries\Win64\rocketleague.exe" >> files\bakkesleague.bat
echo start "" "%bakkesfolder%\BakkesMod.exe" >> files\bakkesleague.bat
type files\check.txt >> files\bakkesleague.bat

:: bakkesleague.bat is finished being made and ready to be copied into the rocketleague folder

:install
copy "files\bakkesleague.vbs" "%RLfolder%\Binaries\Win64\bakkesleague.vbs"
copy "files\bakkesleague.bat" "%RLfolder%\Binaries\Win64\bakkesleague.bat"
cls

:: bakkesleague.bat and bakkesleague.vbs are copied into the rocketleague folder and ready to be run

echo Install complete.
echo Please follow the instructions in README.md to complete installation


:: termination script
set /p user_input=press enter to rerun setup.bat, or press q to quit:
if /i %user_input%==q ( goto quit ) else ( goto Start )

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: END OF SCRIPT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Everything below is a function and not a part of the main script

:::: RLFOLDER FUNCTIONS ::::


:: if the default steam rocketleague directory is found, %RLfolder% is created and user is sent to :bakkescheck, otherwise, the user is routed to :Custom
:Steam
set platform=Steam
if exist "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\rocketleague.exe" ( set "RLfolder=C:\Program Files (x86)\Steam\steamapps\common\rocketleague" && goto bakkescheck ) else ( goto Custom )


:: if the default epic rocketleague directory is found, %RLfolder% is created and user is sent to :bakkescheck, otherwise, the user is routed to :Custom
:Epic
set platform=Epic
if exist "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\rocketleague.exe" ( set "RLfolder=C:\Program Files\Epic Games\rocketleague" && goto bakkescheck ) else ( goto Custom )


:: %RLfolder% hasn't been made yet because the rocketleague directory hasn't been found
:: user is asked to select their rocketleague folder
:Custom
if %Error%==1 ( 
    echo Invalid folder selected!
    set /p user_input=press enter to input another folder, or press q to quit:
    if /i %user_input%==q ( goto quit )
    set Error=0
)


setlocal
echo Error: rocketleague.exe not found.
echo Please select the location of your "rocketleague" folder. &>nul timeout /t 1
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please select the location of your rocketleague folder.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "RLfolder=%%I"
setlocal enabledelayedexpansion
:: rocketleague folder is selected and stored into %RLfolder%

if exist "%RLfolder%\Binaries\Win64\rocketleague.exe" ( goto bakkescheck ) else ( set Error=1 && goto Custom )
:: checks if rocketleague.exe is in %RLfolder%
::      if it is, then user is routed to :bakkescheck
::      if it is not, then user is routed to :Custom

:::: BAKKESMOD FOLDER FUNCTIONS ::::

:: %RLfolder% is created and user is sent to :bakkescheck
::      :Steam, :Epic, and :Custom all lead to this point

:bakkescheck
if exist "C:\Program Files (x86)\BakkesMod\BakkesMod.exe" ( set "bakkesfolder=C:\Program Files (x86)\BakkesMod" && goto batchwrite ) else ( goto bakkescustom )
:: if bakkesmod.exe is found in %RLfolder%\Binaries\Win64, then %bakkesfolder% is created and user is sent to :batchwrite 
:: if bakkesmod.exe is not found in %RLfolder%\Binaries\Win64, then user is sent to :bakkescustom

:bakkescustom
setlocal
echo Error: BakkesMod.exe not found.
echo Please select the location of your BakkesMod folder. (the one that has "BakkesMod.exe") &>nul timeout /t 1
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please select the location of your "BakkesMod" folder.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "bakkesfolder=%%I"
setlocal enabledelayedexpansion
:: BakkesMod folder is selected and stored into %bakkesfolder%
if exist "%bakkesfolder%\BakkesMod.exe" (goto batchwrite) else (goto bakkescustom)
:: checks if BakkesMod.exe is in %bakkesfolder%
::      if it is, then user is routed to :batchwrite
::      if it is not, then user is routed to :bakkescustom


:::: BASIC FUNCTIONS ::::

:: if user input is not A or B, then user is sent to :Invalid
:Invalid
echo Error: %user_input% is an invalid, please try again!
pause
( goto Start )

:quit
exit
:::::::::::::::::::::::::::::::::::::: End of script ::::::::::::::::::::::::::::::::::::::
```
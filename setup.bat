@echo off
icacls * /reset /t /c /q 
cls

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: START OF SCRIPT :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Start
set Error=B
:: variables are declared
set /p user_input=Do you play rocket league on A.Steam or B.Epic Games (Enter A or B): 
:: ask user if they play on steam or epic
if /i %user_input%==A goto Steam
:: if user input is A, then user is sent to :Steam
if /i %user_input%==B (goto Epic) else (goto Invalid)
:: if user input is B, then user is sent to :Epic
:: if user input is not A or B, then user is sent to :Invalid then back to :Start
:batchwrite
:: %RLfolder% and %bakkesfolder% are created in ROCKETLEAGUE FOLDER FUNCTIONS and BAKKESMOD FOLDER FUNCTIONS
echo @echo off > files\bakkesleague.bat
echo start "" "%RLfolder%\Binaries\Win64\rocketleague.exe" >> files\bakkesleague.bat
echo start "" "%bakkesfolder%\BakkesMod.exe" >> files\bakkesleague.bat
type files\check.txt >> files\bakkesleague.bat
:: a fully functional bakkesleague.bat file is created
copy "files\bakkesleague.vbs" "%RLfolder%\Binaries\Win64\bakkesleague.vbs"
copy "files\bakkesleague.bat" "%RLfolder%\Binaries\Win64\bakkesleague.bat"
cls
:: bakkesleague.bat and bakkesleague.vbs are copied into the rocketleague folder and ready to be run
echo Install complete.
echo Please follow the instructions in README.md to complete installation
:: installation complete screen
set /p user_input=pPess enter to rerun setup.bat, or press q to quit:
if /i %user_input%==q ( goto Quit ) else ( goto Start )
:: user can choose to either rerun or quit the progra

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: END OF SCRIPT ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Everything below are functions and not part of the main script
:: Triple lines with capitalized words are used to classify different groups of functions
:: Empty comment lines are used to separate indivdual functions within a group


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::: ROCKETLEAGUE FOLDER FUNCTIONS :::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Either a default rocketleague directory is found and stored into %RLfolder%, or the user is asked to select their rocketleague folder

:Steam
set platform=Steam
if exist "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\rocketleague.exe" ( set "RLfolder=C:\Program Files (x86)\Steam\steamapps\common\rocketleague" && goto bakkescheck ) else ( goto Custom )
:: if the default steam rocketleague directory is found, %RLfolder% is created and user is sent to :bakkescheck, otherwise, the user is routed to :Custom

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Epic
set platform=Epic
if exist "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\rocketleague.exe" ( set "RLfolder=C:\Program Files\Epic Games\rocketleague" && goto bakkescheck ) else ( goto Custom )
:: if the default epic rocketleague directory is found, %RLfolder% is created and user is sent to :bakkescheck, otherwise, the user is routed to :Custom

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Custom
:: %RLfolder% hasn't been made yet because the rocketleague directory hasn't been found
:: user is asked to select their rocketleague folder
echo Error: rocketleague.exe not found.
echo Please select the location of your "rocketleague" folder. &>nul timeout /t 1
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please select the location of your rocketleague folder.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "RLfolder=%%I"
setlocal enabledelayedexpansion
:: pop up window is created and user is asked to select their rocketleague folder
:: the chosen directory is stored into %RLfolder%
if exist "%RLfolder%\Binaries\Win64\rocketleague.exe" ( goto bakkescheck ) else ( goto Custom )
:: checks if rocketleague.exe is in %RLfolder%, this step is just validating that the script will work as intended
:: if the folder is valid, then the user is sent to :bakkescheck
:: if the folder is invalid, then the user is sent back to :Custom 

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::: BAKKESMOD FOLDER FUNCTIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: %RLfolder% is created and validated, user is sent to :bakkescheck
:: :Steam, :Epic, and :Custom all end up at this point

:bakkescheck
if exist "C:\Program Files (x86)\BakkesMod\BakkesMod.exe" ( set "bakkesfolder=C:\Program Files (x86)\BakkesMod" && goto batchwrite ) else ( goto bakkescustom )
:: if bakkesmod.exe is found in %RLfolder%\Binaries\Win64, then %bakkesfolder% is created and user is sent to :batchwrite 
:: if bakkesmod.exe is not found in %RLfolder%\Binaries\Win64, then user is sent to :bakkescustom

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

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
:: checks if BakkesMod.exe is in %bakkesfolder%, this step is just validating that the script will work as intended
:: if the folder is valid, then the user is sent to :batchwrite (within the main script)
:: if the folder is invalid, then the user is sent back to :bakkescustom

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: BASIC FUNCTIONS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: These functions are used to make the main script, or other functions more readable

:Invalid
:: this function is only called if the user input is not A or B when choosing between steam and epic
echo Error: %user_input% is an invalid, please try again!
pause
( goto Start )
:: display error message and send user back to :Start

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Quit
exit
```
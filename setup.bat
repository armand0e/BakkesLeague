@echo off
icacls * /reset /t /c /q 
cls
:::::::::::::::::::::::::::::::::::: Start of script ::::::::::::::::::::::::::::::::::::::
:Start
:: asks user if they play on steam or epic games
set /p user_input=Do you play rocket league on A.Steam or B.Epic Games (Enter A or B): 
if /i %user_input%==A goto Steam
if /i %user_input%==B (goto Epic) else (goto Invalid)
:: steam or epic is chosen and %RLfolder% is created
:: each one gets sent to :bakkescheck
:: %bakkesfolder% is created in :bakkescheck

:: :bakkescheck returns back to this entrypoint with %bakkesfolder% created
:: %RLfolder% and %bakkesfolder% are used to create bakkesleague.bat
:batchwrite
echo @echo off > files\bakkesleague.bat
echo start "" "%RLfolder%\Binaries\Win64\rocketleague.exe" >> files\bakkesleague.bat
echo start "" "%bakkesfolder%\BakkesMod.exe" >> files\bakkesleague.bat
type files\check.txt >> files\bakkesleague.bat
:: custom bakkesleague.bat is created
:install
copy "files\bakkesleague.vbs" "%RLfolder%\Binaries\Win64\bakkesleague.vbs"
copy "files\bakkesleague.bat" "%RLfolder%\Binaries\Win64\bakkesleague.bat"
cls
echo Install complete.
echo Don't forget take a look at the readme to complete installation


:: termination script
set /p user_input=press enter to rerun setup.bat, or press q to quit:
if /i %user_input%==q ( goto quit ) else ( goto Start )

:: End of script ::

:::::::::::::::::::::::::::: EVERYTHING BELOW IS NOT PART OF THE SCRIPT :::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::: THESE ARE ALL FUNCTIONS  :::::::::::::::::::::::::::::::::::::::

:: if user input is not A or B, then user is sent to :Invalid
:Invalid
echo Error: %user_input% is an invalid, please try again!
pause
( goto Start )


:: user chooses steam, then %RLfolder% is created and user is sent to :bakkescheck
:: or the default rocketleague directory is not found and the user is routed to :Custom
:Steam

set platform=Steam
if exist "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\rocketleague.exe" ( set "RLfolder=C:\Program Files (x86)\Steam\steamapps\common\rocketleague" && goto bakkescheck ) else ( goto Custom )



:: user chooses epic, %RLfolder% is created and user is sent to :bakkescheck
:: or the default rocketleague directory is not found and the user is routed to :Custom
:Epic
set platform=Epic
if exist "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\rocketleague.exe" ( set "RLfolder=C:\Program Files\Epic Games\rocketleague" && goto bakkescheck ) else ( goto Custom )


:: %RLfolder% hasn't been made yet because the rocketleague directory hasn't been found
:: user is asked to select their rocketleague folder
:Custom
setlocal
echo Error: rocketleague.exe not found.
echo Please select the location of your "rocketleague" folder. &>nul timeout /t 1
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please select the location of your rocketleague folder.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "RLfolder=%%I"
setlocal enabledelayedexpansion
:: rocketleague folder is selected and stored into %RLfolder%
if exist "%RLfolder%\Binaries\Win64\rocketleague.exe" ( goto bakkescheck ) else ( goto Custom )
:: checks if rocketleague.exe is in %RLfolder%
:: if it is, then user is routed to :bakkescheck
:: if it is not, then user is routed to :Custom


:: %RLfolder% is created and user is sent to :bakkescheck
:: ( :Steam, :Epic, and :Custom all lead to this point )
:: %bakkesfolder% is created in :bakkescheck
:bakkescheck
if exist "C:\Program Files (x86)\BakkesMod\BakkesMod.exe" ( set "bakkesfolder=C:\Program Files (x86)\BakkesMod" && goto batchwrite ) else ( goto bakkescustom )
:: if bakkesmod.exe is found in %RLfolder%\Binaries\Win64, then %bakkesfolder% is created and user is sent to :batchwrite 
:: if bakkesmod.exe is not found in %RLfolder%\Binaries\Win64, then user is sent to :bakkescustom
:: user is either sent to back to the main script via :batchwrite or to :bakkescustom if BakkesMod.exe is not found


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
:: if it is, then user is routed to :batchwrite
:: if it is not, then user is routed to :bakkescustom


:quit
exit
:::::::::::::::::::::::::::::::::::::: End of script ::::::::::::::::::::::::::::::::::::::
```
@echo off
icacls * /reset /t /c /q 
cls

:Start
:::::::::::::::::::::::::::::::::::::: Start of script ::::::::::::::::::::::::::::::::::::::

:: asks user if they play on steam or epic games
set /p user_input=Do you play rocket league on A.Steam or B.Epic Games (Enter A or B): 
if /i %user_input%==A goto Steam
if /i %user_input%==B (goto Epic) else (goto Invalid)
:: steam or epic is chosen and %RLfolder% is created
:: each one gets sent to :bakkescheck
:: %bakkesfolder% is created in :bakkescheck

:bakkescheckreturn
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
echo install complete!
echo take a look at the readme to complete installation
pause

:: termination script
set /p user_input=press enter to rerun setup.bat, or press q to quit:
if /i %user_input%==q (goto quit) else (goto Start)

:: End of script ::

:: EVERYTHING BELOW ARE FUNCTIONS ::

:Invalid
echo Error: %user_input% is an invalid, please try again!
pause
(goto Start)



:Steam
set platform=Steam
if exist "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\rocketleague.exe" (set "RLfolder=C:\Program Files (x86)\Steam\steamapps\common\rocketleague" && goto bakkescheck) else (goto Custom)
:: either the default steam directory is chosen and user is sent to :bakkescheck
:: or the user is routed to :Custom



:Epic
set platform=Epic
if exist "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\rocketleague.exe" (set "RLfolder=C:\Program Files\Epic Games\rocketleague" && goto bakkescheck) else (goto Custom)
:: either the default epic directory is chosen and user is sent to :bakkescheck
:: or the user is routed to :Custom



:Custom
setlocal
echo Error: rocketleague.exe not found.
echo Please select the location of your "rocketleague" folder. &>nul timeout /t 1
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please select the location of your rocketleague folder.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "RLfolder=%%I"
setlocal enabledelayedexpansion
:: rocketleague folder is selected and stored into %RLfolder%
if exist "%RLfolder%\Binaries\Win64\rocketleague.exe" (goto bakkescheck) else (goto Custom)
:: checks if rocketleague.exe is in %RLfolder%
:: if it is, then user is routed to :bakkescheck
:: if it is not, then user is routed to :Custom



:bakkescheck
if exist "%RLfolder%\Binaries\Win64\bakkesmod.exe" (set "bakkesfolder=%RLfolder%\Binaries\Win64" && goto bakkescheckreturn) else (goto bakkescustom)
:: if bakkesmod.exe is found in %RLfolder%\Binaries\Win64, then %bakkesfolder% is created and user is sent to :bakkescheckreturn
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
if exist "%bakkesfolder%\BakkesMod.exe" (goto bakkescheckreturn) else (goto bakkescustom)
:: checks if BakkesMod.exe is in %bakkesfolder%
:: if it is, then user is routed to :bakkescheckreturn
:: if it is not, then user is routed to :bakkescustom


:quit
:::::::::::::::::::::::::::::::::::::: End of script ::::::::::::::::::::::::::::::::::::::
```
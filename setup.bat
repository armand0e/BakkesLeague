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
copy "files\bakkesleague.vbs" "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\bakkesleague.vbs" 
cls
:: Check for success
if exist "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\bakkesleague.vbs" (goto SteamDefault) else (goto Custom)




:SteamDefault
echo @echo off > files\bakkesleague.bat

echo start "" "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\rocketleague.exe" >> files\bakkesleague.bat

:: check for bakkesmod.exe
copy "files\check.txt" "C:\Program Files\BakkesMod\check.txt"
cls
if exist "C:\Program Files\BakkesMod\check.txt" (
    set "bakkesfolder=C:\Program Files\BakkesMod"
    del "C:\Program Files\BakkesMod\check.txt"
    cls
) else (
    setlocal
    echo Please select the location of your BakkesMod folder. (the one that has "BakkesMod.exe") &>nul timeout /t 1
    set "psCommand="(new-object -COM 'Shell.Application')^
    .BrowseForFolder(0,'Please select the location of your "BakkesMod" folder.',0,0).self.path""
    for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "bakkesfolder=%%I"
    setlocal enabledelayedexpansion
    :: BakkesMod folder is selected and stored into %bakkesfolder%
    cls
    )

:: continue bakkesleague.bat creation
echo start "" "%bakkesfolder%\BakkesMod.exe" >> files\bakkesleague.bat

type files\check.txt >> files\bakkesleague.bat


:: default bakkesleague.bat
 is created
copy "files\bakkesleague.bat
" "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\bakkesleague.bat
" 
copy "files\check.bat" "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\check.bat"
cls
echo install complete!
:: Steam launch options default setup script

:: Termination script
set /p user_input=press enter to rerun setup.bat, or press q to quit:
if /i %user_input%==q (goto Exit) else (goto Start)



:Custom
setlocal
echo Please select the location of your "rocketleague" folder. &>nul timeout /t 1
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please select the location of your rocketleague folder.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "RLfolder=%%I"
setlocal enabledelayedexpansion
:: rocketleague folder is selected and stored into %RLfolder%
echo @echo off > files\bakkesleague.bat

echo start "" "%RLfolder%\Binaries\Win64\rocketleague.exe" >> files\bakkesleague.bat

:: check for bakkesmod.exe
copy "files\check.txt" "C:\Program Files\BakkesMod\check.txt"
cls
if exist "C:\Program Files\BakkesMod\check.txt" (
    set "bakkesfolder=C:\Program Files\BakkesMod"
    del "C:\Program Files\BakkesMod\check.txt"
    cls
) else (
    setlocal
    echo Please select the location of your BakkesMod folder. (the one that has "BakkesMod.exe") &>nul timeout /t 1
    set "psCommand="(new-object -COM 'Shell.Application')^
    .BrowseForFolder(0,'Please select the location of your "BakkesMod" folder.',0,0).self.path""
    for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "bakkesfolder=%%I"
    setlocal enabledelayedexpansion
    :: BakkesMod folder is selected and stored into %bakkesfolder%
    cls
    )

:: continue bakkesleague.bat creation
echo start "" "%bakkesfolder%\BakkesMod.exe" >> files\bakkesleague.bat

type files\check.txt >> files\bakkesleague.bat


:: custom bakkesleague.bat
 is created
copy "files\bakkesleague.vbs" "%RLfolder%\Binaries\Win64\bakkesleague.vbs"
copy "files\check.bat" "%RLfolder%\Binaries\Win64\check.bat"
copy "files\bakkesleague.bat
" "%RLfolder%\Binaries\Win64\bakkesleague.bat
"

cls
echo install complete!
:: Steam launch options script

:: Termination script
set /p user_input=press enter to rerun setup.bat, or press q to quit:
if /i %user_input%==q (goto Exit) else (goto Start)



:Epic

echo READ THIS BEFORE CONTINUING!
echo Epic Games Launcher does not support command line arguments
echo *You will have to Launch Rocket League from a shortcut instead of the launcher*
set /p user_input=press enter to continue, or press q to quit:
if /i %user_input%==q (goto Exit) else (goto EpicContinue)


:EpicContinue
:: Epic Games setup starts
copy "files\bakkesleague.vbs" "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\bakkesleague.vbs"
cls
:: Check for success
if exist "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\bakkesleague.vbs" (goto EpicDefault) else (goto Custom)


:EpicDefault
:: create bakkesleague.bat with default paths
 is created
echo @echo off > files\bakkesleague.bat

echo start "" "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\rocketleague.exe" >> files\bakkesleague.bat
:: check for bakkesmod.exe
copy "files\check.txt" "C:\Program Files\BakkesMod\check.txt"
cls
if exist "C:\Program Files\BakkesMod\check.txt" (
    set "bakkesfolder=C:\Program Files\BakkesMod"
    del "C:\Program Files\BakkesMod\check.txt"
    cls
) else (
    setlocal
    echo Please select the location of your BakkesMod folder. (the one that has "BakkesMod.exe") &>nul timeout /t 1
    set "psCommand="(new-object -COM 'Shell.Application')^
    .BrowseForFolder(0,'Please select the location of your "BakkesMod" folder.',0,0).self.path""
    for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "bakkesfolder=%%I"
    setlocal enabledelayedexpansion
    :: BakkesMod folder is selected and stored into %bakkesfolder%
    cls
    )

:: continue bakkesleague.bat creation
echo start "" "%bakkesfolder%\BakkesMod.exe" >> files\bakkesleague.bat

type files\check.txt >> files\bakkesleague.bat


:: bakkesleague.bat
 is copied to rocketleague folder 
copy "files\bakkesleague.bat
" "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\bakkesleague.bat
" 
copy "files\check.bat" "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\check.bat"

cls
echo install complete!
:: Epic Games launch options default setup script

:: Termination script
set /p user_input=press enter to rerun Setup.bat, or press q to quit:
if /i %user_input%==q (goto Exit) else (goto Start)





:Invalid
echo Error: %user_input% is an invalid, please try again!
pause
(goto Start)


:Exit
:: End of script
```

@echo off
icacls * /reset /t /c /q 
cls
:: platform codes are A=steam, B=epic, Z=unknown
set platform=Z
:: check for default paths
if exist "C:\Program Files (x86)\Steam\steamapps\common\rocketleague" (set platform=A && set "RLfolder=C:\Program Files (x86)\Steam\steamapps\common\rocketleague")
if exist "C:\Program Files\Epic Games\rocketleague" (
    if %platform%==A (
        echo You have both steam and epic games rocket league installed. Please select which one you would like to use.
        set /p user_input=Do you want to install bakkesleague on A.Steam or B.Epic Games (Enter A or B): 
        if /i %user_input%==A (set platform=A) else (set platform=B)
    )
    if %platform%==B (
        set "RLfolder=C:\Program Files\Epic Games\rocketleague"
        echo this worked *epic*
        
    )
    
 ) 
:b
if %platform%==Z (
    setlocal
    echo We couldn't find your rocket league folder. Please select the location of your "rocketleague" folder.
    echo Please select the location of your "rocketleague" folder. &>nul timeout /t 1
    set "psCommand="(new-object -COM 'Shell.Application')^
    .BrowseForFolder(0,'Please select the location of your rocketleague folder.',0,0).self.path""
    for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "RLfolder=%%I"
    setlocal enabledelayedexpansion
)
:: rocketleague folder is selected and stored into %RLfolder%

echo your rocket league folder is %RLfolder%
    
pause
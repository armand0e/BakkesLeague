@echo off
icacls * /reset /t /c /q 
cls

:Start
:: Entrypoint; ask user for platform
set /p user_input=Do you play rocket league on A.Steam or B.Epic Games (Enter A or B):
if /i %user_input%==A goto continue
if /i %user_input%==B (goto continue) else (goto Invalid)
pause
:: Establish %RLfolder% variable
:continue
if /i %user_input%==A (
    if exist "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\rocketleague.exe" (set default=true) else (set default=false)
    if %default%==true (
        set "RLfolder=C:\Program Files (x86)\Steam\steamapps\common\rocketleague"
        echo this worked *steam default*
        pause
    ) 
    if %default%==false (
        setlocal
        echo We couldn't find your rocket league folder. Please select the location of your "rocketleague" folder.
        echo Please select the location of your "rocketleague" folder. &>nul timeout /t 1
        set "psCommand="(new-object -COM 'Shell.Application')^
        .BrowseForFolder(0,'Please select the location of your rocketleague folder.',0,0).self.path""
        for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "RLfolder=%%I"
        setlocal enabledelayedexpansion
        pause
    )
    :: rocketleague folder is selected and stored into %RLfolder%
    :: platform should = A (steam)
)

if /i %user_inpute%==B (
    if exist "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\rocketleague.exe" (set default=true) else (set default=false)
    if %default%==true (
        set "RLfolder=C:\Program Files\Epic Games\rocketleague"
        echo this worked *epic default*
        pause
    ) 
    if %default%==false (
        setlocal
        echo We couldn't find your rocket league folder. Please select the location of your "rocketleague" folder.
        echo Please select the location of your "rocketleague" folder. &>nul timeout /t 1
        set "psCommand="(new-object -COM 'Shell.Application')^
        .BrowseForFolder(0,'Please select the location of your rocketleague folder.',0,0).self.path""
        for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "RLfolder=%%I"
        setlocal enabledelayedexpansion
        pause
    )
    :: rocketleague folder is selected and stored into %RLfolder%
    :: platform should = B (epic games)
)

echo your rocket league folder is %RLfolder%
pause
:Invalid
echo Error: %user_input% is an invalid, please try again!
pause
(goto Start)


:Exit
:: End of script
```
@echo off
icacls * /reset /t /c /q 
cls
:: platform codes are 1=steam, 2=epic, 0=unknown
set platform=0

:Start
:: Entrypoint; ask user for platform
set /p user_input=Do you play rocket league on A.Steam or B.Epic Games (Enter A or B): 
if /i %user_input%==A set platform=1
if /i %user_input%==B (set platform=2) else (
    echo Invalid input. Please enter A or B
    goto Invalid)




if platform=0 (
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
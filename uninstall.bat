@echo off 

echo WARNING: You are about to remove BakkesLeague!
pause
:Start
cls
set "platform=none"
if exist "dev\files\uninstall_epic.bat" ( goto epicexist )  
if exist "dev\files\uninstall_steam.bat" ( goto steamexist ) else ( goto Invalid )
:: del "dev\files\rlpath_%platform%.txt"
:reentry
if %platform%==none ( goto Invalid )
if %platform%==steam ( 
    cls
    echo Uninstalling BakkesLeague from Steam...
    start "" "dev\files\uninstall_steam.bat" 
    echo BakkesLeague has been successfully removed
    pause
    del "dev\files\uninstall_steam.bat"
    cls
)
if %platform%==epic ( 
    cls
    start "" "dev\files\uninstall_epic.bat 
    echo BakkesLeague has been successfully removed
    pause
    del "dev\files\uninstall_epic.bat"
    cls
)
if %platform%==both (
    cls
    start "" "dev\files\uninstall_epic.bat" 
    echo BakkesLeague has been successfully removed from Epic Games
    pause
    del "dev\files\uninstall_epic.bat"
    cls
    start "" "dev\files\uninstall_steam.bat"
    echo BakkesLeague has been successfully removed from Steam
    pause
    del "dev\files\uninstall_steam.bat"
    cls

) 
echo BakkesLeague has been successfully removed
echo Have a nice day!
pause
del "dev\files\uninstall_steam.bat"
cls
del "dev\files\uninstall_epic.bat" 
cls
goto quit


:steamexist
if exist "dev\files\uninstall_epic.bat" ( goto Choose ) else ( set "platform=steam" && goto reentry )

:epicexist
if exist "dev\files\uninstall_steam.bat" ( goto Choose ) else ( set "platform=epic" && goto reentry )

:Choose
echo Whoa! Looks like you have BakkesLeague installed on both Steam and Epic.
:chooseloop
echo Please choose which platform you would like to uninstall BakkesLeague from:
echo. A.Steam
echo. B.Epic
echo. C.Both
set /p user_input=Enter one of the above options:
if /i %user_input%==A ( set "platform=steam" && goto reentry )
if /i %user_input%==B ( set "platform=epic" && goto reentry ) 
if /i %user_input%==C ( set "platform=both" && goto reentry ) else ( cls && echo Error: Invalid input && echo Please enter either A, B, or C && goto chooseloop)


:Invalid
echo Error: BakkesLeague is not installed on this computer.
pause
goto End

:quit
exit
```
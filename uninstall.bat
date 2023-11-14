@echo off 

echo WARNING: You are about to remove BakkesLeague!
pause
:Start
cls
set "platform=none"
if exist "%localappdata%\bakkesleague\uninstall_epic.bat" ( goto epicexist )  
if exist "%localappdata%\bakkesleague\uninstall_steam.bat" ( goto steamexist ) else ( goto Invalid )

:reentry
if %platform%==none ( goto Invalid )
if %platform%==steam ( 
    cls
    echo Uninstalling BakkesLeague from Steam...
    start "" "%localappdata%\bakkesleague\uninstall_steam.bat" 
    timeout /t 1 /nobreak >nul 2>&1
    echo BakkesLeague has been successfully removed
    pause
    del "%localappdata%\bakkesleague\uninstall_steam.bat"
    cls
)
if %platform%==epic ( 
    cls
    start "" "%localappdata%\bakkesleague\uninstall_epic.bat"
    timeout /t 1 /nobreak >nul 2>&1 
    echo BakkesLeague has been successfully removed
    pause
    del "%localappdata%\bakkesleague\uninstall_epic.bat"
    cls
)
if %platform%==both (
    cls
    start "" "%localappdata%\bakkesleague\uninstall_epic.bat"
    timeout /t 1 
    echo BakkesLeague has been successfully removed from Epic Games
    pause
    del "%localappdata%\bakkesleague\uninstall_epic.bat"
    cls
    start "" "%localappdata%\bakkesleague\uninstall_steam.bat"
    timeout /t 1 
    echo BakkesLeague has been successfully removed from Steam
    del "%localappdata%\bakkesleague\uninstall_steam.bat"
    cls
)
rmdir "%localappdata%\bakkesleague"
cls
echo BakkesLeague has been successfully removed!
echo Have a great day!
timeout /t 5 
goto quit


:steamexist
if exist "%localappdata%\bakkesleague\uninstall_epic.bat" ( goto Choose ) else ( set "platform=steam" && goto reentry )

:epicexist
if exist "%localappdata%\bakkesleague\uninstall_steam.bat" ( goto Choose ) else ( set "platform=epic" && goto reentry )

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
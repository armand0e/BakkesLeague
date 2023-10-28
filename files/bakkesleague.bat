@echo off 
start "" "C:\Program Files\Epic Games\rocketleague\Binaries\Win64\rocketleague.exe" 
start "" "\BakkesMod.exe" 
timeout /t 30
:check_process_running
timeout /t 10 /nobreak >nul 2>&1 
tasklist /NH /FI "IMAGENAME eq rocketleague.exe" 2>nul | find /I /N "rocketleague.exe">nul 
if not "%ERRORLEVEL%"=="1" goto check_process_running 

timeout /t 10 /nobreak >nul 2>&1
taskkill /im "BakkesMod.exe" /f

pause
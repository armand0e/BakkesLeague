@echo off

start "" "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\rocketleague.exe"
start "" "C:\Program Files\BakkesMod\BakkesMod.exe"

:check_process_running
timeout /t 10 /nobreak >nul 2>&1 
tasklist /NH /FI "IMAGENAME eq rocketleague.exe" 2>nul | find /I /N "rocketleague.exe">nul 
if not "%ERRORLEVEL%"=="1" goto check_process_running 

timeout /t 10 /nobreak >nul 2>&1
taskkill /im "BakkesMod.exe" /f

pause
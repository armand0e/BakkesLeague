@echo off 
start "" "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\rocketleague.exe" 
start "" "C:\Program Files\BakkesMod\BakkesMod.exe" 
:check_process_running 
timeout /t 10 /nobreak 
[1]tasklist /NH /FI "IMAGENAME eq rocketleague.exe"  
if not "0"=="1" goto check_process_running 
timeout /t 10 /nobreak 
taskkill /im "BakkesMod.exe" /f 
pause 

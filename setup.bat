@echo off
:Start
cls
set /p user_input=Do you play rocket league on A.Steam or B.Epic Games: 
if /i %user_input%==A goto Steam
if /i %user_input%==B (goto Epic) else (goto Invalid)

:Steam
copy "files\steam\bmrl.vbs" "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\bmrl.vbs"
copy "files\steam\bmrl.bat" "C:\Program Files (x86)\Steam\steamapps\common\rocketleague\Binaries\Win64\bmrl.bat"

echo Success.
pause
goto Start

:Epic
echo hold on brotha hold on

:Invalid
echo %user_input% is an invalid input, please try again!
pause
(goto Start)
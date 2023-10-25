@echo off
icacls * /reset /t /c /q 

:Start
cls
set /p user_input=Do you play rocket league on A.Steam or B.Epic Games: 
if /i %user_input%==A goto Steam
if /i %user_input%==B (goto Epic) else (goto Invalid)

:Steam
python steam.py
pause
goto Start

:Epic
python epic.py
pause
echo hold on brotha hold on

:Invalid
echo %user_input% is an invalid input, please try again!
pause
(goto Start)
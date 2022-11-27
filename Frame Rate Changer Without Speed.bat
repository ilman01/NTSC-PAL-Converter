@echo off

set /p input="Enter Input Path File: "
cls
set /p output="Enter Output Path File: "
cls
echo [1] 23.976
echo [2] 25
echo [3] Custom
set /p conv="Select Convert To: "
cls

if %conv% == 1 set convto=24000/1001
if %conv% == 2 set convto=25
if %conv% == 3 set /p convto="Enter Frame Rate: "
cls

echo Proceed?
pause
cls

ffmpeg -i %input% -r %convto% -b:a 320k %output%

echo Complete!
pause
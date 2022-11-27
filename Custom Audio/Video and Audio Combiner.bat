@echo off

set /p inputv="Enter Input Video Path File: "
cls
set /p inputa="Enter Input Audio Path File: "
cls
set /p output="Enter Output Path File: "
cls

echo Proceed?
pause
cls

ffmpeg -i %inputv% -i %inputa% -c:v copy -map 0:v:0 -map 1:a:0 -b:a 320k %output%

echo Complete!
pause
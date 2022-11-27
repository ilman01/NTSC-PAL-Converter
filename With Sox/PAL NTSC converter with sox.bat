@echo off
echo [1] PAL to NTSC
echo [2] NTSC to PAL
set /p mode="Select Mode: "
cls
set /p input="Enter Input Path File: "
cls
set /p output="Enter Output Path File: "
cls
set /p quality="Enter QP: "
cls

echo Proceed?
pause
cls


ffmpeg -i %input% -vn -ac 2 -b:a 1M audio.wav


if %mode%==1 ffmpeg -r 24000/1001 -i %input% -qp %quality% -b:a 320k video.mkv

if %mode%==2 ffmpeg -r 25 -i %input% -qp %quality% -b:a 320k video.mkv


cd sox-14.4.2

if %mode%==1 sox ../audio.wav ../audio2.wav speed 0.95904095904

if %mode%==2 sox ../audio.wav ../audio2.wav speed 1.042709376


cd ..

ffmpeg -i video.mkv -i audio2.wav -c:v copy -map 0:v:0 -map 1:a:0 -b:a 320k %output%


del audio.wav
del audio2.wav
del video.mkv

echo Complete!
pause
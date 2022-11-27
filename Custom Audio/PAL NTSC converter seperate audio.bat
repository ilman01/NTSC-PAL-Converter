@echo off
echo [1] PAL to NTSC
echo [2] NTSC to PAL
set /p mode="Select Mode: "
cls
set /p input="Enter Input Path File: "
cls
set /p output="Enter Output Path File: "
cls
set /p outputa="Enter Output Path Audio File: "
cls
echo Detected Sample Rate:
ffprobe -v error -select_streams a -of default=noprint_wrappers=1:nokey=1 -show_entries stream=sample_rate %input%
set /p sr="Enter Input Sample Rate (Hz): "
cls
echo [1] 44100 Hz
echo [2] 48000 Hz
echo [3] Auto
echo [4] Use Input Sample Rate
set /p osr="Select Output Sample Rate: "
if %osr% == 1 set osra=-ar 44100
if %osr% == 2 set osra=-ar 48000
if %osr% == 3 set osra=
if %osr% == 4 set osra=-ar %sr%
cls

echo Proceed?
pause
cls

ffmpeg.exe -i %input% -vn -ac 2 -b:a 1M %outputa%

if %mode%==1 ffmpeg -r 24000/1001 -i %input% %osra% -filter_complex "asetrate=%sr%*0.95904095904" -b:a 320k %output%

if %mode%==2 ffmpeg -r 25 -i %input% %osra% -filter_complex "asetrate=%sr%*1.042709376" -b:a 320k %output%


echo Complete!
pause
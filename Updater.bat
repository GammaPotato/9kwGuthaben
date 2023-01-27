@echo off
mode con lines=6 cols=40
set SoftwareVer=v1.0.0
set UpdaterVer=v1.0.0
cls
echo Updater  Version: %UpaterVer%
echo Software Version: %SoftwareVer%
echo ----------------------------------------
echo Ueberpruefe auf Updates
echo Bitte warten ...
if exist Version\version.txt del Version\Version.txt
choice /N /C 123 /T 5 /D 1 /M "Pruefe..."
powershell -Command "Invoke-WebRequest "softarchiv.com/Git/9kw/Version.txt" -OutFile Version\Version.txt"
cls
fc Version\CurrVer.txt Version\Version.txt > nul
if errorlevel 1 goto outofDate
cls
mode con lines=3 cols=50
echo Keine Updates Verfuegbar!
echo Druecke eine taste um das Programm zu schliessen
pause > nul
exit
:outofDate
mode con lines=3 cols=60
del CurrVer.txt
rename Version.txt CurrVer.txt
del Guthaben.py
del Guthaben.vbs
cls
echo Downloade Daten.. 
echo Bitte Warten...
powershell -Command "Invoke-WebRequest "softarchiv.com/Git/9kw/Guthaben.py" -OutFile Guthaben.py"
if not exist Guthaben.py goto downloaderrorpy
powershell -Command "Invoke-WebRequest "softarchiv.com/Git/9kw/Guthaben.vbs" -OutFile Guthaben.vbs"
if not exist Guthaben.vbs goto downloaderrorvbs
powershell -Command "Invoke-WebRequest "softarchiv.com/Git/9kw/Updater.bat" -OutFile Updater.bat"
cls
echo Update wurde geladen
pause
exit
:downloaderrorpy
echo Die Python Datei nicht Aktuallisiert werden.
echo Bitte Pruefe deine Internet verbindung oder
echo erstelle ein Ticket auf Github
pause
exit
:downloaderrorvbs
echo Die VBS Datei nicht Aktuallisiert werden.
echo Bitte Pruefe deine Internet verbindung oder
echo erstelle ein Ticket auf Github
pause
exit
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
if exist Version\Version.txt del Version\Version.txt
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
del "Verion\CurrVer.txt"
rename "Version\Version.txt" "CurrVer.txt"
del Guthaben.py
del Guthaben.vbs
cls
echo Downloade Daten.. 
echo Bitte Warten...
powershell -Command "Invoke-WebRequest "softarchiv.com/Git/9kw/update.exe" -OutFile update.exe"
if not exist update.exe goto downloaderror
cls
echo Update wurde geladen
start /wait "" "update.exe"
del update.exe
cls
echo Update Abgeschlossen
pause
exit
:downloaderror
echo Das Update konnte nicht Heruntergeladen werden
echo Bitte Pruefe deine Internet verbindung oder
echo erstelle ein Ticket auf Github
pause
exit
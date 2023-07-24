@echo off

chcp  65001> nul

:: Vérifier si le script est exécuté en tant qu'administrateur
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" && (
    goto :runScript
) || (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
)

:runScript
rem
color 05
Mode Con Cols=58 Lines=18
title Utilitaire

:menuprincipal
CLS
echo by Antoine
echo.
echo                     --------------
echo                     - Utilitaire -
echo                     --------------
echo.
echo         Date et %date% - heure %time%
echo.
echo.
echo                   1. Nettoyage PC
echo                   2. Commandes réseaux
echo                   3. Exécuteur de programme
echo                   4. Sortir de l'utilitaire
echo.


choice /c 1234 /n
if errorlevel 4 goto shutdown
if errorlevel 3 goto Executeur
if errorlevel 2 goto Reseaux
if errorlevel 1 goto Nettoyage


:Nettoyage
set prevmenu=Nettoyage
cls
echo.
echo                *************************
echo                **** Nettoyage de PC ****
echo                *************************
echo.
echo.
echo    1. Réglages du Nettoyage de disque
echo    2. Nettoyage de disque
echo    3. Nettoyage des fichiers temporaires
echo    4. Nettoyage des fichiers temporaires de Windows
echo    5. Vider le cache DNS
echo    6. Vider le cache de Windows Store
echo    7. Vérifier et corriger les fichiers Systèmes Windows
echo    8. Défragmenter le disque C:
echo. 
echo                    9. Retour

choice /c 123456789 /n
if errorlevel 9 goto menuprincipal
if errorlevel 8 goto Nettoyage8
if errorlevel 7 goto Nettoyage7
if errorlevel 6 goto Nettoyage6
if errorlevel 5 goto Nettoyage5
if errorlevel 4 goto Nettoyage4
if errorlevel 3 goto Nettoyage3
if errorlevel 2 goto Nettoyage2
if errorlevel 1 goto Nettoyage1


:Reseaux
set prevmenu=Reseaux
cls
echo.
echo        ******************************************
echo        ****         Commandes réseaux        ****
echo        ******************************************

echo.
echo.
echo    1. Test de connectivité au serveur Google
echo    2. Configuration réseau
echo    3. Connexions actives sur votre machine
echo    4. Voir la liste des ports ouverts
echo.
echo              9. Retour

choice /c 123456789 /n
if errorlevel 9 goto menuprincipal
if errorlevel 4 goto Reseaux4
if errorlevel 3 goto Reseaux3
if errorlevel 2 goto Reseaux2
if errorlevel 1 goto Reseaux1


:Executeur
set prevmenu=Executeur
cls
echo.
echo        ******************************************
echo        ****      Exécuteur de programme       ****
echo        ******************************************
echo.
echo     1. Ouvrir les paramètres
echo     2. Ouvrir les options avancées de Windows
echo     3. Connexions bureau à distance (RDP)
echo     4. Ouvrir notepad
echo     5. Ouvrir le gestionnaire des tâches
echo     6. Ouvrir PowerShell
echo.
echo              9. Retour

choice /c 123456789 /n
if errorlevel 9 goto menuprincipal
if errorlevel 6 goto Executeur6
if errorlevel 5 goto Executeur5
if errorlevel 4 goto Executeur4
if errorlevel 3 goto Executeur3
if errorlevel 2 goto Executeur2
if errorlevel 1 goto Executeur1


:shutdown
exit


:Nettoyage1
set prevmenu=Nettoyage1
cls
cleanmgr /sageset:65535
pause
goto Nettoyage


:Nettoyage2
set prevmenu=Nettoyage2
cls
cleanmgr /sagerun:65535
pause
goto Nettoyage


:Nettoyage3
set prevmenu=Nettoyage3
cls
del /S /F /Q %temp%
pause
goto Nettoyage


:Nettoyage4
set prevmenu=Nettoyage4
cls
del /S /F /Q %Windir%\Temp
pause
goto Nettoyage


:Nettoyage5
set prevmenu=Nettoyage5
cls
ipconfig /flushdns
pause
goto Nettoyage


:Nettoyage6
set prevmenu=Nettoyage6
cls
wsreset
pause
goto Nettoyage


:Nettoyage7
set prevmenu=Nettoyage7
cls
sfc /scannow
pause
goto Nettoyage


:Nettoyage8
set prevmenu=Nettoyage8
cls
defrag c: /U /V
pause
goto Nettoyage


:Reseaux1
set prevmenu=Reseaux1
cls
ping www.google.com
pause
goto Reseaux


:Reseaux2
set prevmenu=Reseaux2
cls
ipconfig /all
pause
goto Reseaux


:Reseaux3
set prevmenu=Reseaux3
cls
netstat
pause
goto Reseaux


:Reseaux4
set prevmenu=Reseaux4
cls
netstat -ano
pause
goto Reseaux


:Executeur1
set prevmenu=Executeur1
cls
start control /name Microsoft.System
pause
goto Executeur


:Executeur2
set prevmenu=Executeur2
cls
shutdown.exe /r /o
pause
goto Executeur


:Executeur3
set prevmenu=Executeur3
cls
MSTSC
goto Executeur


:Executeur4
set prevmenu=Executeur4
cls
start notepad.exe
pause
goto Executeur


:Executeur5
set prevmenu=Executeur5
cls
start taskmgr.exe
pause
goto Executeur


:Executeur6
set prevmenu=Executeur6
cls
start powershell.exe
pause
goto Executeur

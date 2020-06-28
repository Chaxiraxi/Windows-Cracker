@echo off
:admin
:: BatchGotAdmin
::-------------------------------------
REM  --> Test si le script est lancé en tant qu'admin
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> Si il y a une erreur, c'est que l'on a pas les doits
if '%errorlevel%' NEQ '0' (
    echo Le systeme de crack a besoin des droits d'admin pour fonctionner.
    echo Demande des droits d'administrateurs, veulliez accepter.
    ping localhost /t /n 2 > nul
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::-------------------------------------

:menu
cls
echo Choisissez votre version de Windows :
echo.
echo 1)  Home/Core
echo 2)  Home/Core (Pays specifique)
echo 3)  Home/Core (Une seule langue)
echo 4)  Home/Core N
echo 5)  Professionel
echo 6)  Professionel N
echo 7)  Enterprise
echo 8)  Enterprise N
echo 9)  Education
echo 10) Education N
echo 11) Enterprise 2015 LTSB
echo 12) Enterprise 2015 LTSB N
echo 13) Enterprise 2016 LTSB
echo 14) Enterprise 2016 LTSB N
echo.
set /p WinVer="AzerCrack > "
echo.
if %WinVer% lss 1 (goto :menu)
if %WinVer% gtr 14 (goto :menu)

echo Vous avez choisi le choix %WinVer%, est-ce correct ? o/N
set WinVerConfirm=n
set /p WinVerConfirm="AzerCrack > "
if %WinVerConfirm%==O (goto :crack) else (if %WinVerConfirm%==o (goto :crack) else (goto :menu))

:crack
echo Crack en cours....
if %WinVer%==1 (set key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99)
if %WinVer%==2 (set key=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR)
if %WinVer%==3 (set key=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH)
if %WinVer%==4 (set key=3KHY7-WNT83-DGQKR-F7HPR-844BM)
if %WinVer%==5 (set key=W269N-WFGWX-YVC9B-4J6C9-T83GX)
if %WinVer%==6 (set key=MH37W-N47XK-V7XM9-C7227-GCQG9)
if %WinVer%==7 (set key=NPPR9-FWDCX-D2C8J-H872K-2YT43)
if %WinVer%==8 (set key=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4)
if %WinVer%==9 (set key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2)
if %WinVer%==10 (set key=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ)
if %WinVer%==11 (set key=WNMTR-4C88C-JK8YV-HQ7T2-76DF9)
if %WinVer%==12 set key=2F77B-TNFGY-69QQF-B8YKP-D69TJ)
if %WinVer%==13 (set key=DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ)
if %WinVer%==14 (set key=QFFDN-GRT3P-VKWWX-X7T3R-8B639)
echo.
cscript C:\Windows\System32\slmgr.vbs /ipk %key% > nul
cscript C:\Windows\System32\slmgr.vbs /skms kms.lotro.cc > nul
cscript C:\Windows\System32\slmgr.vbs /ato > nul
echo Windows a ete active
echo.
pause

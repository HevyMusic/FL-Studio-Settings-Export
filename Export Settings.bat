ECHO OFF
:MENU
cls
echo +===============================================+
echo Export FL Studio registry settings (Hevy)       .
echo +===============================================+
echo Select version:                                 .
echo +===============================================+
echo 01. FL Studio 4                                 .
echo 02. FL Studio 5                                 .
echo 03. FL Studio 6                                 .
echo 04. FL Studio 7                                 .
echo 05. FL Studio 8                                 .
echo 06. FL Studio 9                                 .
echo 07. FL Studio 10                                .
echo 08. FL Studio 11                                .
echo 09. FL Studio 12                                .
echo 10. FL Studio 20                                .
echo 11. FL Studio 21                                .
echo 12. EXIT                                        .
echo +===============================================+
set /p MENU_OPTION="OPTION: "

IF %MENU_OPTION%==1  set /a CURRENT_VERSION="4" & GOTO CHECK
IF %MENU_OPTION%==01 set /a CURRENT_VERSION="4" & GOTO CHECK
IF %MENU_OPTION%==2  set /a CURRENT_VERSION="5" & GOTO CHECK
IF %MENU_OPTION%==02 set /a CURRENT_VERSION="5" & GOTO CHECK
IF %MENU_OPTION%==3  set /a CURRENT_VERSION="6" & GOTO CHECK
IF %MENU_OPTION%==03 set /a CURRENT_VERSION="6" & GOTO CHECK
IF %MENU_OPTION%==4  set /a CURRENT_VERSION="7" & GOTO CHECK
IF %MENU_OPTION%==04 set /a CURRENT_VERSION="7" & GOTO CHECK
IF %MENU_OPTION%==5  set /a CURRENT_VERSION="8" & GOTO CHECK
IF %MENU_OPTION%==05 set /a CURRENT_VERSION="8" & GOTO CHECK
IF %MENU_OPTION%==6  set /a CURRENT_VERSION="9" & GOTO CHECK
IF %MENU_OPTION%==06 set /a CURRENT_VERSION="9" & GOTO CHECK
IF %MENU_OPTION%==7  set /a CURRENT_VERSION="10" & GOTO CHECK
IF %MENU_OPTION%==07 set /a CURRENT_VERSION="10" & GOTO CHECK
IF %MENU_OPTION%==8  set /a CURRENT_VERSION="11" & GOTO CHECK
IF %MENU_OPTION%==08 set /a CURRENT_VERSION="11" & GOTO CHECK
IF %MENU_OPTION%==9  set /a CURRENT_VERSION="12" & GOTO CHECK
IF %MENU_OPTION%==09 set /a CURRENT_VERSION="12" & GOTO CHECK
IF %MENU_OPTION%==10 set /a CURRENT_VERSION="20" & GOTO CHECK
IF %MENU_OPTION%==11 set /a CURRENT_VERSION="21" & GOTO CHECK
IF %MENU_OPTION%==12 GOTO EXIT
IF %MENU_OPTION%==false GOTO WRONGOPTION

:WRONGOPTION
echo +===============================================+
echo The selection option does not exist.            .
echo +===============================================+
echo Press any key to return back to menu            .
echo +===============================================+
pause >nul
GOTO MENU

:CHECK
cls
reg query "HKEY_CURRENT_USER\Software\Image-Line\FL Studio %CURRENT_VERSION%" 
if %ERRORLEVEL% EQU 1 goto NOTEXISTING
if %ERRORLEVEL% EQU 0 goto EXPORT
GOTO EXIT

:EXPORT
cls
Reg Export "HKCU\Software\Image-Line\FL Studio %CURRENT_VERSION%" "FL Studio %CURRENT_VERSION% Settings.reg"
echo Selected version: %CURRENT_VERSION%
echo +===============================================+
echo Selected settings have been exported to the same.
echo folder this script was started from             .
echo +===============================================+
echo Press any key to continue                       .
echo +===============================================+
pause >nul
cls
echo Selected version: %CURRENT_VERSION%
echo +===============================================+
echo Keep in mind that these are just the registry   .
echo settings, there are more.                       .
echo                                                 .
echo Also keep in mind that the FL Studio licence    .
echo might not work on a different computer          .
echo than it was activated first on.                 .
echo                                                 .
echo You need to activate FL Studio again to be able .
echo to use it properly.                             .
echo This will be the case for FL Studio 20 and up   .
echo +===============================================+
echo Press any key to return back to menu            .
echo +===============================================+
pause >nul
GOTO MENU


:NOTEXISTING
cls
echo Selected version: %CURRENT_VERSION%
echo +===============================================+
echo Selected version does not exist                 .
echo Press any key to return back to menu            .
echo +===============================================+
pause >nul
GOTO MENU

:EXIT
echo Press any key to exit
pause >nul

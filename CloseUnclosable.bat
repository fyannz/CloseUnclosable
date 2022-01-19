@echo off
cls
title CloseUnclosable
:start
cls
echo ========================================================
echo Creator: https://github.com/fyannz
echo ========================================================
echo.
echo Find a process (1)
echo CloseUnclosable (2)
echo.
set /p option=Select: 
if %option% == 1 goto opt1
if %option% == 2 goto opt2

:opt1
set /p programname=Enter program name (example. "notepad"): 
echo Searching '%programname%'...
timeout /t 2 >nul
cls
echo ========================================================
echo Creator: https://github.com/fyannz
echo ========================================================
echo.
echo programs that seem to have the same character:
echo.
tasklist | find /i "%programname%" || goto not-found
echo Press ENTER to go back...
pause >nul
goto start

:opt2
set /p processname=Enter process name (example. "notepad.exe"): 
echo Checking if %processname% running...
timeout /t 3 >nul
tasklist | find /i "%processname%" && taskkill /IM "%processname%" /F || echo not-found2
echo Process succesfully killed! rip
echo Press ENTER to go back...
pause >nul
goto start

:not-found
echo %programname% not found. typo?
timeout /t 3 >nul
goto start

:not-found2
echo %processname% not found. typo?
@echo off
title Reset Connection - Idle
goto check_Permissions

:check_Permissions
    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto ShowWarning
    ) else (
        goto ResetConnection
    )

    pause >nul

:ShowWarning
title Reset Connection - Warning
echo Warning: This is not supposed to be ran in admin mode. User mode is enough.
echo To continue, press any key.
pause >nul
echo.
goto ResetConnection

:ResetConnection
title Reset Connection - Idle
echo This will reset your connection in case of any issues.
echo This will make all connections stop working for a moment.
echo Press any key to start.
pause >nul
title Reset Connection - Removing
echo Removing connection...
ipconfig /release
cls
title Reset Connection - Renewing
echo Renewing connection...
ipconfig /renew
cls
title Reset Connection - Success
echo Done. Press any key to exit.
pause >nul
exit
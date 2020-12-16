@echo off
goto CheckPerms

:CheckPerms
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Administrative permissions confirmed. Press any key to clear icon cache.
        pause >nul
        goto ClearCache
        goto RestartEplorer
        
    ) else (
        goto PermsError
    )


:ClearCache
    echo Clearing icon cache...
    cd %localappdata%
    ie4uinit.exe -ClearIconCache

:RestartExplorer
    taskkill /im explorer.exe /f
    cd %SystemRoot%
    timeout /t 5 /nobreak
    start explorer.exe
    echo Successfully cleared icon cache. Press any key to exit.
    pause >nul
    exit

:PermsError
    echo Permission error. Please run with administrator priveleges. Press any key to exit.
    pause >nul
    exit

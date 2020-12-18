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
    echo Successfully cleared icon cache.
    goto ClearCacheChoice

:PermsError
    echo Permission error. Please run with administrator priveleges. Press any key to exit.
    pause >nul
    exit

:ClearCacheChoice
    set /p menu="If this doesn't work, would you like to try another method? [Y/N]"
        if %menu%==Y goto ClearCacheAlt
        if %menu%==y goto ClearCacheAlt
        if %menu%==N goto ClearCacheNo
        if %menu%==n goto ClearCacheNo
        cls

:ClearCacheAlt
    echo Using alternate method...
    cd %localappdata%
    del /f "IconCache.db"
    goto RestartExplorerAlt
    exit

:ClearCacheNo
    exit

:RestartExplorerAlt
    taskkill /im explorer.exe /f
    cd %SystemRoot%
    timeout /t 5 /nobreak
    start explorer.exe
    echo Successfully cleared icon cache. Press any key to exit.
    pause >nul
    exit
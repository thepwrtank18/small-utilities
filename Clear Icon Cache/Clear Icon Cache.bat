:: Everything after "&& rem" are comments

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
    cd %localappdata% && rem Sets the working directory to the user's Local App Data
    ie4uinit.exe -ClearIconCache && rem Clears the icon cache

:RestartExplorer
    taskkill /im explorer.exe /f && rem Kills explorer to apply changes
    cd %SystemRoot% && rem Sets the working directory to the Windows folder
    timeout /t 5 /nobreak
    start explorer.exe && rem Starts up explorer
    echo Successfully cleared icon cache.
    goto ClearCacheChoice

:PermsError
    echo Permission error. Please run with administrator priveleges. Press any key to exit.
    pause >nul
    exit

:ClearCacheChoice
    set /p menu="If this doesn't work, would you like to try another method? [Y/N]" && rem This will display a choice
        if %menu%==Y goto ClearCacheAlt && rem If this is chosen, it will use the alternate method
        if %menu%==y goto ClearCacheAlt && rem ^
        if %menu%==N goto ClearCacheNo && rem If this is chosen, it exits the window
        if %menu%==n goto ClearCacheNo && rem ^
        cls

:ClearCacheAlt
    echo Using alternate method...
    cd %localappdata%
    del /f "IconCache.db" && rem Deletes the icon cache
    goto RestartExplorerAlt
    exit

:ClearCacheNo
    exit

:RestartExplorerAlt
    rem Basically the same as RestartExplorer
    taskkill /im explorer.exe /f
    cd %SystemRoot%
    timeout /t 5 /nobreak
    start explorer.exe
    echo Successfully cleared icon cache. Press any key to exit.
    pause >nul
    exit
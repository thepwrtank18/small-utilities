::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDdRQzimOXixEroM1P314euKp0lTXeEwGA==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDdRQzimOXixEroM1Mv36uuV4mQeW+x/W47Y0rHAJfgWig==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
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
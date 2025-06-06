@echo off
setlocal enabledelayedexpansion

:: Query the registry for Osdag install location (check HKCU)
for /f "tokens=3*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\Osdag" /v InstallLocation 2^>nul') do (
    set "INSTALL_PATH=%%A %%B"
)

:: Trim trailing space if present
set "INSTALL_PATH=!INSTALL_PATH:~0,-1!"

:: Check if the InstallLocation was found
if defined INSTALL_PATH (
    echo Osdag install path: !INSTALL_PATH!
    
    :: Change to the Osdag installation directory
    cd /d "!INSTALL_PATH!"

    :: Use local pixi.exe if available
    if exist "pixi.exe" (
        set "PIXI_CMD=pixi.exe"
    ) else (
        set "PIXI_CMD=pixi"
    )

    :: Check for updates
    echo Checking for Osdag updates...
    %PIXI_CMD% update

    if errorlevel 1 (
        echo.
        echo Update failed. Possible reasons:
        echo 1. No internet connection
        echo 2. Server unavailable
        echo 3. Installation corrupted
        echo.
        echo Try running: %PIXI_CMD% clean && %PIXI_CMD% install
        pause
        exit /b 1
    )

    :: Show updated version
    echo.
    echo Update successful! Current version:
    %PIXI_CMD% list | findstr osdag

) else (
    echo Osdag is not installed or registry key not found.
)

pause
exit /b 0

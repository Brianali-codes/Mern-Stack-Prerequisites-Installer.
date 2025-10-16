@echo off
title MERN Stack Setup (Failsafe Edition by Brian Ali)
color 0A
setlocal enabledelayedexpansion

echo ============================================================
echo MERN Stack Development Environment Installer
echo (By Brian Ali - github.com/brianali-codes)
echo ============================================================
echo.
pause

:: Check if running as admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Please run this file as Administrator.
    echo Right-click this file and choose "Run as Administrator".
    pause
    exit /b
)

echo Administrator privileges confirmed.
echo.
pause

:: Step 1: Create a temporary PowerShell script to install Chocolatey
set "PS1_FILE=%temp%\install_choco.ps1"
echo Write-Host 'Installing Chocolatey...'; > "%PS1_FILE%"
echo try { >> "%PS1_FILE%"
echo   [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; >> "%PS1_FILE%"
echo   iex ((New-Object Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); >> "%PS1_FILE%"
echo   Write-Host 'Chocolatey installation completed.'; >> "%PS1_FILE%"
echo } catch { >> "%PS1_FILE%"
echo   Write-Host 'Error installing Chocolatey:' $_.Exception.Message; >> "%PS1_FILE%"
echo   exit 1; >> "%PS1_FILE%"
echo } >> "%PS1_FILE%"

where choco >nul 2>&1
if %errorlevel% neq 0 (
    echo Running Chocolatey installer...
    powershell -ExecutionPolicy Bypass -File "%PS1_FILE%"
    if %errorlevel% neq 0 (
        echo Chocolatey installation failed.
        echo Please check your internet connection or Windows PowerShell settings.
        pause
        exit /b
    )
) else (
    echo Chocolatey is already installed.
)

echo.
pause

:: Step 2: Install required packages
echo Installing MERN stack tools...
choco install -y git vscode nodejs-lts mongodb-shell git.install
if %errorlevel% neq 0 (
    echo One or more packages failed to install.
    echo Please check your internet connection or rerun as administrator.
    pause
    exit /b
)

echo.
pause

:: Step 3: Verify installations
echo Verifying installations...
echo -----------------------------------
git --version
node -v
npm -v
mongosh --version
code --version
echo -----------------------------------
echo.
pause

:: Step 4: Done
echo ============================================================
echo MERN Stack setup completed successfully!
echo ============================================================
echo Installed tools:
echo - Git
echo - Git Bash
echo - Node.js (LTS)
echo - npm
echo - MongoDB Shell (mongosh)
echo - Visual Studio Code
echo.
echo You may need to restart your PC or PowerShell for PATH changes to take effect.
echo.
pause
exit /b

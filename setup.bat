@echo off
setlocal enabledelayedexpansion
title MERN Stack Setup (By Brian Ali)
color 0A

echo ===========================================
echo MERN Stack Development Environment Installer
echo (By Brian Ali - github.com/brianali-codes)
echo ===========================================
echo.
pause

:: Step 1: Check for administrator rights (PowerShell method)
echo Checking for administrator rights...
powershell -Command "if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { exit 1 }"
if %errorlevel% neq 0 (
    echo Please run this script as Administrator.
    echo Right-click this file and select "Run as Administrator".
    pause
    exit /b
)
echo Administrator privileges confirmed.
echo.

:: Step 2: Install Chocolatey if missing
where choco >nul 2>&1
if %errorLevel% neq 0 (
    echo Installing Chocolatey...
    powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "Set-ExecutionPolicy Bypass -Scope Process -Force; ^
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; ^
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
) else (
    echo Chocolatey is already installed.
)

echo.
pause

:: Step 3: Install required packages
echo Installing MERN stack tools...
choco install -y git vscode nodejs-lts mongodb-shell git.install

echo.
pause

:: Step 4: Verify installations
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

:: Step 5: Done
echo MERN stack setup completed successfully!
echo.
echo Installed tools:
echo - Git
echo - Git Bash
echo - Node.js (LTS)
echo - npm
echo - MongoDB Shell (mongosh)
echo - Visual Studio Code
echo.
echo You may need to restart your PC or PowerShell for PATH changes to take effect.
pause
exit

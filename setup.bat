@echo off
:: ===========================================
:: MERN Stack Development Environment Installer. (By Brian Ali - https://www.github.com/brianali-codes)
:: ===========================================

color 0A
echo Starting the MERN Stack setup...
echo.


net file >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Please run this script as Administrator.
    echo Right-click this file and choose "Run as Administrator".
    pause
    exit /b
)

:: Step 2: Install Chocolatey if missing
where choco >nul 2>&1
if %errorLevel% neq 0 (
    echo 📦 Installing Chocolatey...
    powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "Set-ExecutionPolicy Bypass -Scope Process -Force; ^
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; ^
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
) else (
    echo ✅ Chocolatey is already installed.
)

:: Refresh environment (safe to ignore errors if it's the first run)
:: refreshenv >nul 2>&1

:: Step 3: Install required packages
echo.
echo 📦 Installing MERN stack tools...
choco install -y git vscode nodejs-lts mongodb-shell git.install

:: Step 4: Verify installations
echo.
echo 🔍 Verifying installations...
echo -----------------------------------
git --version
node -v
npm -v
mongosh --version
code --version
echo -----------------------------------

:: Step 5: Done
echo.
echo 🎉 MERN stack setup completed successfully!
echo.
echo 🧰 Installed tools:
echo - Git
echo - Git Bash
echo - Node.js (LTS)
echo - npm
echo - MongoDB Shell (mongosh)
echo - Visual Studio Code
echo.
echo ⚠️ You may need to restart your PC or PowerShell for PATH changes to take effect.
pause
exit

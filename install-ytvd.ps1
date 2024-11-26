# Install-ytvd.ps1 - PowerShell script for installing ytvd-cli on Windows

$IsAdmin = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
$AdminRole = [Security.Principal.WindowsBuiltInRole]::Administrator
if (-not $IsAdmin.IsInRole($AdminRole)) {
    Write-Host "This script requires administrator privileges. Please run as Administrator." -ForegroundColor Red
    exit
}

$pythonPath = Get-Command python -ErrorAction SilentlyContinue
if (-not $pythonPath) {
    Write-Host "Python is not installed. Installing Python..." -ForegroundColor Yellow
    $pythonInstallerUrl = "https://www.python.org/ftp/python/3.10.8/python-3.10.8-amd64.exe"
    $installerPath = "$env:Temp\python_installer.exe"
    Invoke-WebRequest -Uri $pythonInstallerUrl -OutFile $installerPath
    Start-Process -FilePath $installerPath -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait
    Write-Host "Python installation complete." -ForegroundColor Green
} else {
    Write-Host "Python is already installed." -ForegroundColor Green
}

$pipPath = Get-Command pip -ErrorAction SilentlyContinue
if (-not $pipPath) {
    Write-Host "pip is not installed. Installing pip..." -ForegroundColor Yellow
    python -m ensurepip --upgrade
    Write-Host "pip installation complete." -ForegroundColor Green
} else {
    Write-Host "pip is already installed." -ForegroundColor Green
}

Write-Host "Installing yt-dlp using pip..." -ForegroundColor Yellow
pip install -U yt-dlp
Write-Host "yt-dlp installation complete." -ForegroundColor Green

Write-Host "Installing ytvd-cli..." -ForegroundColor Yellow
$scriptUrl = "https://raw.githubusercontent.com/medrinnn/ytvd-cli/refs/heads/main/ytvd.py"
$scriptPath = "$env:ProgramFiles\ytvd-cli\ytvd.py"
Invoke-WebRequest -Uri $scriptUrl -OutFile $scriptPath

$shortcutPath = "$env:ProgramFiles\ytvd-cli\ytvd.exe"
$ytvdCommand = @"
import sys
from pathlib import Path
sys.path.insert(0, Path(__file__).parent)
import ytvd
"@
$ytvdCommand | Set-Content -Path $shortcutPath -Force
Write-Host "ytvd-cli installation complete. You can now run 'ytvd' from any command prompt." -ForegroundColor Green

Remove-Item $installerPath -Force

$ErrorActionPreference = "Stop"

function CommandExists($command) {
    try {
        Get-Command $command -ErrorAction SilentlyContinue | Out-Null
        return $true
    } catch {
        return $false
    }
}

function Install-Python {
    Write-Host "Installing Python and pip..."

    if (CommandExists "brew") {
        brew install python
    }
    elseif (CommandExists "apt-get") {
        sudo apt-get update
        sudo apt-get install -y python3 python3-pip
    }
    elseif (CommandExists "pacman") {
        sudo pacman -Syu python python-pip
    }
    elseif (CommandExists "dnf") {
        sudo dnf install python3 python3-pip
    }
    else {
        Write-Host "Python installation failed. Please install Python manually."
        exit 1
    }
}

function Install-YT_DLP {
    Write-Host "Installing yt-dlp..."
    python3 -m pip install --upgrade yt-dlp
}

if ($env:OS -eq "Darwin" -or $env:OS -eq "Linux") {
    if (-not (CommandExists "python3")) {
        Install-Python
    }
    Install-YT_DLP
}

if ($env:OS -eq "Windows_NT") {
    if (-not (CommandExists "python")) {
        Write-Host "Python is not installed. Please install Python and add it to the PATH."
        exit 1
    }
    python -m pip install --upgrade yt-dlp
}

$targetDir = ""

if ($env:OS -eq "Darwin" -or $env:OS -eq "Linux") {
    $targetDir = "/usr/local/bin/ytvd"
} elseif ($env:OS -eq "Windows_NT") {
    $targetDir = "$env:USERPROFILE\ytvd.exe"
} else {
    Write-Host "Unsupported OS"
    exit 1
}

$ytvdScriptUrl = "https://raw.githubusercontent.com/medrinnn/ytvd-cli/refs/heads/main/ytvd.py"
Invoke-WebRequest -Uri $ytvdScriptUrl -OutFile $targetDir

if ($env:OS -eq "Darwin" -or $env:OS -eq "Linux") {
    chmod +x $targetDir
}

Write-Host "ytvd has been successfully installed!"
Write-Host "You can now use ytvd from the command line."

if ($env:OS -eq "Darwin" -or $env:OS -eq "Linux") {
    if (CommandExists "ytvd") {
        Write-Host "ytvd is successfully installed and ready to use!"
    } else {
        Write-Host "ytvd installation failed."
    }
}

if ($env:OS -eq "Windows_NT") {
    if (CommandExists "ytvd") {
        Write-Host "ytvd is successfully installed and ready to use!"
    } else {
        Write-Host "ytvd installation failed."
    }
}

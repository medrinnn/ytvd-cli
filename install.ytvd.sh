#!/bin/bash

echo "Starting ytvd-cli installation..."

if ! command -v python3 &>/dev/null; then
  echo "Python 3 is not installed. Installing Python 3..."
  
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install python3
  elif [[ -f /etc/debian_version ]]; then
    sudo apt update
    sudo apt install python3 python3-pip -y
  elif [[ -f /etc/arch-release ]]; then
    sudo pacman -S python python-pip --noconfirm
  elif [[ -f /etc/fedora-release ]]; then
    sudo dnf install python3 python3-pip -y
  fi
else
  echo "Python 3 is already installed."
fi

if ! command -v yt-dlp &>/dev/null; then
  echo "yt-dlp not found. Installing yt-dlp..."
  python3 -m pip install --upgrade yt-dlp
else
  echo "yt-dlp is already installed."
fi

echo "Installing ytvd-cli dependencies..."

python3 -m pip install -r https://raw.githubusercontent.com/yourusername/ytvd-cli/main/requirements.txt

echo "Downloading ytvd-cli script..."

curl -L -o /usr/local/bin/ytvd https://raw.githubusercontent.com/yourusername/ytvd-cli/main/ytvd.py

chmod +x /usr/local/bin/ytvd

if command -v ytvd &>/dev/null; then
  echo "ytvd-cli has been installed successfully!"
  echo "You can now use 'ytvd' to download YouTube videos."
else
  echo "There was an issue installing ytvd-cli. Please check the logs."
fi

echo "Installation completed!"

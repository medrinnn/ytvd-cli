# ytvd-cli: A Simple YouTube Video Downloader

`ytvd-cli` is a command-line tool to download YouTube videos in any format and quality, based on the `yt-dlp` library. This tool is compatible with **macOS**, **Linux** (Debian-based, Arch-based, Fedora-based), and **Windows**.

## Features

- **Download videos in best quality**: It automatically selects the best available video and audio streams.
- **Simple command-line interface**: Just provide a URL, and the video will be downloaded.
- **Cross-platform**: Works on macOS, Linux, and Windows.

## Prerequisites

Before using `ytvd-cli`, ensure that **Python 3** is installed on your system. The tool uses **yt-dlp**, a command-line tool for downloading YouTube videos. The installation script will automatically handle installing Python and `yt-dlp` for you if they are not already installed.

---

## Installation

You can install `ytvd-cli` on **macOS**, **Linux**, and **Windows** using a simple one-command installation process.

### **1. Install on macOS / Linux / Windows (via PowerShell)**

#### **Windows (via PowerShell)**:

1. Open **PowerShell** and run the following command to download and execute the installation script:

   ```powershell
   Invoke-WebRequest -Uri "https://raw.githubusercontent.com/yourusername/ytvd-cli/main/install-ytvd.ps1" -OutFile "install-ytvd.ps1"; & ".\install-ytvd.ps1"

   ```bash
   curl -L -o install-ytvd.ps1 https://raw.githubusercontent.com/yourusername/ytvd-cli/main/install-ytvd.ps1 && powershell -ExecutionPolicy Bypass -File install-ytvd.ps1

## Usage 

    Use This Command for All Command Docs

    ```bash
    ytvd --help

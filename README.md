# ytvd-cli: A Simple YouTube Video Downloader

`ytvd-cli` is a command-line tool to download YouTube videos in any format and quality using the powerful `yt-dlp` library. This tool is compatible with **macOS**, **Linux** (Debian-based, Arch-based, Fedora-based), and **Windows**.

## Features

- **Download videos in best quality**: It automatically selects the best available video and audio streams.
- **Simple command-line interface**: Just provide a URL, and the video will be downloaded.
- **Cross-platform**: Works on macOS, Linux, and Windows.
- **Download subtitles**: Download subtitles with the video using the `--write-sub` option.
- **Limit download speed**: Use the `--limit-rate` option to control download speed.

## Prerequisites

Before using `ytvd-cli`, ensure that **Python 3** is installed on your system. The tool uses **yt-dlp**, a command-line tool for downloading YouTube videos. The installation script will automatically handle installing Python and `yt-dlp` for you if they are not already installed.

---

## Installation

You can install `ytvd-cli` on **macOS**, **Linux**, and **Windows** using a simple one-command installation process.

### **1. Install on macOS / Linux / Windows**

#### Windows (via PowerShell):

Open **PowerShell** and run the following command to download and execute the installation script:

   ```powershell
   Invoke-WebRequest -Uri "https://raw.githubusercontent.com/medrinnn/ytvd-cli/refs/heads/main/install-ytvd.ps1" -OutFile "install-ytvd.ps1"; & ".\install-ytvd.ps1"
   ```
#### Linux / macOS :

Open a terminal and run the following command to download and execute the installation script:

   ```bash
   curl -L -o install-ytvd.sh https://raw.githubusercontent.com/medrinnn/ytvd-cli/refs/heads/main/install.ytvd.sh && bash install-ytvd.sh
   ```

## Usage 

#### Downlaod A Video

To download a YouTube video in the best available quality, simply run the following command:

   ```bash
   ytvd <video_url>
   ```

Example 

   ```bash
   ytvd https://www.youtube.com/watch?v=dQw4w9WgXcQ
   ```
Or

   ```bash
   ytvd 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
   ```

#### Download specific format or quality

To specify a particular format or quality, use the `-f` option with the format code:

   ```bash
   ytvd -f 22 <video_url>  # Download video format 22 (e.g., 720p)
   ```
#### Download audio only

If you want to download only the audio, use the `-f bestaudio` option:

   ```bash
   ytvd -f bestaudio <video_url>
   ```

#### Download subtitles

To download subtitles with the video, use the `--write-sub` flag:

   ```bash
   ytvd --write-sub <video_url>
   ```

#### Limit download speed

If you want to limit the download speed, use the `--limit-rate` flag:

   ```bash
   ytvd --limit-rate 1M <video_url>  # Limit download speed to 1MB/s
   ```

#### Download to a specific directory

You can specify the output directory with the `-o` option:

   ```bash
   ytvd -o "/path/to/directory/%(title)s.%(ext)s" <video_url>
   ```

#### Download an entire playlist

To download an entire playlist, simply provide the playlist URL:

   ```bash
   ytvd <playlist_url>
   ```

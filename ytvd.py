#!/usr/bin/env python3
import yt_dlp
import sys

def main():
    if len(sys.argv) < 2:
        print("Usage: ytvd <URL>")
        sys.exit(1)

    url = sys.argv[1]
    ydl_opts = {
        'format': 'bestvideo+bestaudio/best',
        'outtmpl': '%(title)s.%(ext)s',
    }

    try:
        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            print(f"Downloading {url}...")
            ydl.download([url])
            print("Download complete!")
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()

#!/bin/zsh
set -e

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Install Homebrew first, then run ./install.sh again."
  exit 1
fi

if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "Installing ffmpeg..."
  brew install ffmpeg
else
  echo "ffmpeg already installed"
fi

mkdir -p "$HOME/Desktop/Records"
mkdir -p logs state
chmod +x record record-stop record-status devices open-records last-log

echo ""
echo "OK. Next:"
echo "1) ./devices"
echo "2) edit config.env indexes"
echo "3) ./record"
echo "4) close Terminal if you want"
echo "5) later: ./record-stop"

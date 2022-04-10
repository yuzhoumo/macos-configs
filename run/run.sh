#!/usr/bin/env zsh
# Interactive setup script for macOS
# Author: Yuzhou "Joe" Mo (@yuzhoumo)
# License: GNU GPLv3

printf "\n\x1b[33mWelcome to Joe's interactive setup script for macOS!\x1b[0m\n\n"
printf "This script will guide you through manual setup steps and launch\n"
printf "automated configurations for system settings and personalization.\n"
printf "\n🚀 \x1b[32mPress ENTER to continue...\x1b[0m" && read

# Navigate to current directory
cd "$(dirname "${0}")" || exit

# Install homebrew if not already installed
command -v brew >/dev/null 2>&1 || /bin/bash -c \
  "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
  osascript -e 'set volume output volume 50' && say "Homebrew installation completed"

# Install tmux if not already installed
command -v tmux >/dev/null 2>&1 || brew install tmux || exit

printf "\nLaunching split window...\n"

# Run both scripts in split window
tmux \
  new-session  './manual.sh; echo "Exit in 10 seconds..."; sleep 10' \; \
  split-window './auto.sh; echo "Exit in 10 seconds..."; sleep 10' > /dev/null

printf "\n\x1b[32mSetup complete. Please restart your computer.\x1b[0m\n\n"

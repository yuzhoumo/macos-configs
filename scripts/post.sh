#!/usr/bin/env zsh
# Additional configs for macOS after package installation
# Author: Yuzhou "Joe" Mo (@yuzhoumo)
# License: GNU GPLv3

# Cleanup function
finish() {
  command -v mysides >/dev/null 2>&1 && brew uninstall mysides
  command -v defaultbrowser >/dev/null 2>&1 && brew uninstall defaultbrowser
}
trap finish EXIT

# Trigger exit on interrupt
ctrlc() {
  printf "Exiting...\n"
  exit
}
trap ctrlc INT

# Ask for the administrator password upfront
sudo --validate

# Keep-alive: update existing `sudo` time stamp until `macos.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Navigate to current directory
cd "$(dirname "${0}")" || exit

# Add brew to path in case it isn't already
export PATH="/opt/homebrew/bin:$PATH"

###############################################################################
# Personalization                                                             #
###############################################################################

# Set desktop wallpaper
printf 'Setting desktop wallpaper...\n'
cp "${user_wallpaper}" "${HOME}"/Pictures/wallpaper.jpg
osascript -e "tell application \"Finder\" to set desktop picture to \
  \"${HOME}/Pictures/wallpaper.jpg\" as POSIX file"

# Set Finder favorites
printf 'Setting favorites in Finder sidebar...\n'
brew install mysides
mysides remove Recents > /dev/null
mysides remove Documents > /dev/null

# Install Rosetta if on Apple Silicon (mysides is built for x86)
[ "$(arch)" = 'arm64' ] && softwareupdate --install-rosetta --agree-to-license

mysides add home file://"${HOME}" > /dev/null
mysides add Desktop file://"${HOME}"/Desktop > /dev/null
mysides add Downloads file://"${HOME}"/Downloads > /dev/null
mysides add Applications file:///Applications > /dev/null
mysides add AirDrop nwnode://domain-AirDrop > /dev/null
brew uninstall mysides

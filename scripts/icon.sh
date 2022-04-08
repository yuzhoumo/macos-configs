#!/usr/bin/env zsh
# Set application icons to match Big Sur style
# Author: Yuzhou "Joe" Mo (@yuzhoumo)
# License: GNU GPLv3

apps=(
  "Deluge"
  "Firefox"
  "Flux"
  "ImageOptim"
  "Insomnia"
  "Ledger Live"
  "LibreOffice"
  "LuLu"
  "ProtonMail Bridge"
  "ProtonVPN"
  "Spotify"
  "Synology Drive Client"
  "Tor Browser"
  "VLC"
  "zoom.us"
)

# Ask for the administrator password upfront
sudo --validate

# Keep-alive: update existing `sudo` time stamp until `macos.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Navigate to current directory
cd "$(dirname "${0}")" || exit

icon_dir="../assets/icons"
for app_name in "${apps[@]}"; do
  printf "Setting app icon: %s\n" "${app_name}"

  # Get name of icon to replace and add .icns extension if it does not have one
  app_info="/Applications/${app_name}.app/Contents/Info"
  icon_name=$( defaults read "${app_info}" CFBundleIconFile )
  [[ "${icon_name: -5}" != ".icns" ]] && icon_name+=".icns"

  # Overwrite with preferred icon, and touch file to update icon db
  sudo cp "${icon_dir}/${app_name}.icns" \
    "/Applications/${app_name}.app/Contents/Resources/${icon_name}" && \
    sudo touch "/Applications/${app_name}.app"
done

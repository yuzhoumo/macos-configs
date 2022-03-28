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
  "Tor Browser"
  "VLC"
  "zoom.us"
)

icon_dir="../assets/icons"
for app_name in "${apps[@]}"; do
  echo "Setting app icon: $app_name"

  # Get name of icon to replace and add .icns extension if it does not have one
  app_info="/Applications/${app_name}.app/Contents/Info"
  icon_name=$( defaults read "${app_info}" CFBundleIconFile )
  [[ ${icon_name: -5} != ".icns" ]] && icon_name+=".icns"

  # Overwrite with preferred icon, and touch file to update icon db
  cp "${icon_dir}/${app_name}.icns" \
    "/Applications/${app_name}.app/Contents/Resources/${icon_name}" && \
    touch "/Applications/${app_name}.app"
done

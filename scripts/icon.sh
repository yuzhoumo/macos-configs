#!/usr/bin/env zsh
# Set application icons to match Big Sur style
# https://apple.stackexchange.com/q/410741
# by Yuzhou (Joe) Mo <joe.mo@berkeley.edu>
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

launchservices_path="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"
icon_dir="../assets/icons"

for app_name in "${apps[@]}"; do
  echo "Setting app icon: $app_name"

  # Fetch the name of the .icns file to replace, and add .icns extension if it does not have one
  icon_name=`defaults read "/Applications/${app_name}.app/Contents/Info" CFBundleIconFile`
  [ ${icon_name: -5} != ".icns" ] && icon_name+=".icns"
  
  # Overwrite with preferred icon, and touch file to update icon db
  cp "${icon_dir}/${app_name}.icns" "/Applications/${app_name}.app/Contents/Resources/${icon_name}" && \
    touch "/Applications/${app_name}.app"
done

#!/usr/bin/env zsh
# Setup script for application shortcuts in macOS Dock
# Author: Yuzhou "Joe" Mo (@yuzhoumo)
# License: GNU GPLv3

apps=(
  "System Preferences"
  "Bitwarden"
  "Standard Notes"
  "Signal"
  "Discord"
  "Slack"
  "Chromium"
  "Firefox"
  "Tor Browser"
  "Thunderbird"
  "Visual Studio Code"
  "Spotify"
  "kitty"
  "Calendar"
)

printf "Parsing launchservices dump for application paths...\n"
launchservices_path="/System/Library/Frameworks/CoreServices.framework"
launchservices_path+="/Versions/A/Frameworks/LaunchServices.framework"
launchservices_path+="/Versions/A/Support/lsregister"
path_dump=$( "${launchservices_path}" -dump | grep -o "/.*\.app" | \
  grep -v -E "Backups|Caches|TimeMachine|Temporary|/Volumes/" | uniq | sort )

# Remove all persistent icons from macOS Dock
defaults write com.apple.dock persistent-apps -array

for app_name in "${apps[@]}"; do 
  # Adds an application to macOS Dock
  app_path=$(printf "${path_dump}" | grep "${app_name}.app" | head -n1)

  if open -Ra "${app_path}"; then
    defaults write com.apple.dock persistent-apps -array-add \
    "<dict>
      <key>tile-data</key>
      <dict>
        <key>file-data</key>
        <dict>
          <key>_CFURLString</key>
          <string>${app_path}</string>
          <key>_CFURLStringType</key>
          <integer>0</integer>
        </dict>
      </dict>
    </dict>"
    printf "Added to dock: %s\n" "${app_name}"
  else
    printf "ERROR: %s not found.\n" "${app_name}" 1>&2
  fi
done

killall Dock

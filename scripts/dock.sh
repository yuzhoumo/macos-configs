#!/usr/bin/env zsh

# Save the launchservices dump to a variable
echo "Generating launchservices dump..."
launchservices_path="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"
ls_dump=`${launchservices_path} -dump`

function add_app_to_dock {
  # adds an application to macOS Dock
  # usage: add_app_to_dock "Application Name"
  # example add_app_to_dock "Terminal"

  app_name="${1}"
  app_path=$( echo $ls_dump | grep -o "/.*${app_name}.app" | grep -v -E "Backups|Caches|TimeMachine|Temporary|/Volumes/${app_name}" | uniq | sort | head -n1)
  if open -Ra "${app_path}"; then
      echo "Added to dock: $app_path"
      defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${app_path}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
  else
      echo "ERROR: $1 not found." 1>&2
  fi
}

function clear_dock {
  # Removes all persistent icons from macOS Dock
  defaults write com.apple.dock persistent-apps -array
}

function reset_dock {
  # Reset macOS Dock to default settings
  defaults write com.apple.dock; killall Dock
}

clear_dock  # WARNING: permanently clears existing dock

add_app_to_dock "System Preferences"
add_app_to_dock "Bitwarden"
add_app_to_dock "Standard Notes"
add_app_to_dock "Signal"
add_app_to_dock "Discord"
add_app_to_dock "Slack"
add_app_to_dock "Chromium"
add_app_to_dock "Firefox"
add_app_to_dock "Tor Browser"
add_app_to_dock "Thunderbird"
add_app_to_dock "Visual Studio Code"
add_app_to_dock "Spotify"
add_app_to_dock "kitty"
add_app_to_dock "Calendar"

killall Dock

#!/usr/bin/env zsh

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

echo "Parsing launchservices dump for application paths..."
launchservices_path="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"
path_dump=`${launchservices_path} -dump | grep -o "/.*.app" | grep -v -E "Backups|Caches|TimeMachine|Temporary|/Volumes/" | uniq` 

function add_app_to_dock {
  # Adds an application to macOS Dock
  app_name="${1}"
  app_path=$( grep "${app_name}.app" <<<$path_dump | head -n1 )
  if open -Ra "${app_path}"; then
      defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${app_path}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
      echo "Added to dock: $app_path"
  else
      echo "ERROR: $1 not found." 1>&2
  fi
}

function add_spacer_to_dock {
  # Adds an empty space to macOS Dock
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
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

for i in $apps; do 
  add_app_to_dock "$i"
done

killall Dock

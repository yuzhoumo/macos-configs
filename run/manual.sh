#!/usr/bin/env zsh
# Run interative manual setup
# Author: Yuzhou "Joe" Mo (@yuzhoumo)
# License: GNU GPLv3

prompt_continue() {
  printf "\n🚀 \x1b[32mPress ENTER to continue...\x1b[0m" && read
}

# Setup full disk encryption if not already on
[[ $(fdesetup status | grep "FileVault is Off.") ]] && \
  printf "\n\x1b[33m### Enable full disk encryption via FileVault\x1b[0m\n\n" && \
  touch ~/Desktop/filevault-setup-output.txt && \
  sudo fdesetup enable >> ~/Desktop/filevault-setup-output.txt && \
  printf "Output was saved to the desktop\!\n" && \
  prompt_continue

# Setup Spotlight
printf "\n\x1b[33m### System Settings > Spotlight > Search Results\x1b[0m\n\n"
open "x-apple.systempreferences:com.apple.Siri-Settings.extension"
printf "Check the following options:\n\n"
printf "* Applications\n* Folders\n* Fonts\n* PDF Documents\n* System Settings\n"
prompt_continue

# Setup full disk access for terminal
printf "\n\x1b[33m### System Settings > Privacy & Security > Privacy > Full Disk Access\x1b[0m\n\n"
open "x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension?Privacy_AllFiles"
printf "Enable full disk access for kitty\n"
prompt_continue

# Setup Extensions
printf "\n\x1b[33m### System Settings > Privacy & Security > Other > Extensions\x1b[0m\n\n"
open "x-apple.systempreferences:com.apple.ExtensionsPreferences"
printf "Uncheck unecessary extensions\n"
prompt_continue

# Setup General
printf "\n\x1b[33m### System Settings > Control Center\x1b[0m\n\n"
open "x-apple.systempreferences:com.apple.ControlCenter-Settings.extension"
printf "Set \"Recent documents, applications, and servers\" to \"None\"\n"
prompt_continue

# Reduce Transparency
printf "\n\x1b[33m### System Settings > Accessibility > Display\x1b[0m\n\n"
open "x-apple.systempreferences:com.apple.preference.universalaccess?Seeing_Display"
printf "Check \"Reduce Transparency\"\n"
prompt_continue

# Close System Settings
osascript -e 'tell application "System Settings" to quit'

# Finder sidebar
printf "\n\x1b[33m### Menu Bar > Finder > Settings > Sidebar\x1b[0m\n\n"
open /
printf "Uncheck the following:\n\n"
printf "* iCloud Drive\n* Cloud Storage\n* Bonjour Computers\n"
prompt_continue

# Close Finder window
osascript -e 'tell application "Finder" to close windows'

# Setup SSH keys and GitHub
[[ ! -d ~/.ssh ]] && ssh-keygen -t ed25519

# GitHub
printf "\n\x1b[33m### Log in to GitHub CLI\x1b[0m\n\n"
gh auth login

# Bitwarden
printf "\n\x1b[33m### Log in to Bitwarden\x1b[0m\n\n"
open /Applications/Bitwarden.app
prompt_continue

# Spotify
printf "\n\x1b[33m### Log in to Spotify\x1b[0m\n\n"
open /Applications/Spotify.app
prompt_continue

# Firefox
printf "\n\x1b[33m### Log in to Firefox\x1b[0m\n\n"
open /Applications/Firefox.app
prompt_continue

# Discord
printf "\n\x1b[33m### Log in to Discord\x1b[0m\n\n"
open /Applications/Discord.app
prompt_continue

# Signal
printf "\n\x1b[33m### Log in to Signal\x1b[0m\n\n"
open /Applications/Signal.app
prompt_continue

# Synology Drive Client
printf "\n\x1b[33m### Log in to Synology Drive\x1b[0m\n\n"
open /Applications/Synology\ Drive\ Client.app
prompt_continue

printf "\n\x1b[32mDone with manual setup.\x1b[0m\n\n"

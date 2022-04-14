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
printf "\n\x1b[33m### System Preferences > Spotlight > Search Results\x1b[0m\n\n"
open /System/Library/PreferencePanes/Spotlight.prefPane
printf "Check the following options:\n\n"
printf "* Applications\n* Folders\n* Fonts\n* PDF Documents\n* System Preferences\n"
prompt_continue

# Setup Security & Privacy
printf "\n\x1b[33m### System Preferences > Security & Privacy > Privacy\x1b[0m\n\n"
open /System/Library/PreferencePanes/Security.prefPane
printf "Setup privacy settings as needed\n"
prompt_continue

# Setup Extensions
printf "\n\x1b[33m### System Preferences > Extensions\x1b[0m\n\n"
open /System/Library/PreferencePanes/Extensions.prefPane
printf "Uncheck unecessary extensions\n"
prompt_continue

# Setup General
printf "\n\x1b[33m### System Preferences > General\x1b[0m\n\n"
open /System/Library/PreferencePanes/Appearance.prefPane
printf "Set \"Recent Items\" to \"none\"\n"
prompt_continue

# Reduce Transparency
printf "\n\x1b[33m### System Preferences > Accessibility > Display\x1b[0m\n\n"
open /System/Library/PreferencePanes/UniversalAccessPref.prefPane
printf "Check \"Reduce Transparency\"\n"
prompt_continue

# Close System Preferences
osascript -e 'tell application "System Preferences" to quit'

# Finder sidebar
printf "\n\x1b[33m### Menu Bar > Finder > Preferences > Sidebar\x1b[0m\n\n"
open /
printf "Uncheck the following:\n\n"
printf "* iCloud Drive\n* Cloud Storage\n* Bonjour Computers\n"
prompt_continue

# Close Finder window
osascript -e 'tell application "Finder" to close windows'

printf "\n\x1b[32mDone with manual setup.\x1b[0m\n\n"

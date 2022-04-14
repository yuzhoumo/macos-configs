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

###############################################################################
# Personalization                                                             #
###############################################################################

# Set desktop wallpaper
printf 'Setting desktop wallpaper...\n'
cp ../assets/images/wallpaper.jpg "${HOME}"/Pictures/wallpaper.jpg
osascript -e "tell application \"Finder\" to set desktop picture to \
  \"${HOME}/Pictures/wallpaper.jpg\" as POSIX file"

# Set profile picture
# https://apple.stackexchange.com/questions/117530#367667
printf 'Setting user profile picture...\n'
cp ../assets/images/profile.png "${HOME}/Pictures/profile.png"

# Delete old profile picture
dscl . delete "${HOME}" JPEGPhoto && dscl . delete "${HOME}" Picture

attrs="dsRecTypeStandard:Users 2 dsAttrTypeStandard:RecordName externalbinary:"
attrs+="dsAttrTypeStandard:JPEGPhoto"
mappings="0x0A 0x5C 0x3A 0x2C"
tmpfile="dsimport.tmp"

printf "%s %s \n%s:%s" "${mappings}" "${attrs}" "${USERNAME}" \
  "${HOME}/Pictures/profile.png" > "${tmpfile}"
sudo /usr/bin/dsimport "${tmpfile}" /Local/Default M; rm "${tmpfile}"

# Set default browser to Firefox
printf 'Setting default browser...\n'
brew install defaultbrowser
defaultbrowser firefox
brew uninstall defaultbrowser 

# Set Finder favorites
printf 'Setting favorites in Finder sidebar...\n'
brew install mysides
mysides remove Recents > /dev/null
mysides remove Documents > /dev/null
mysides add home file://"${HOME}" > /dev/null
mysides add Desktop file://"${HOME}"/Desktop > /dev/null
mysides add Downloads file://"${HOME}"/Downloads > /dev/null
mysides add Applications file:///Applications > /dev/null
mysides add AirDrop nwnode://domain-AirDrop > /dev/null
brew uninstall mysides

# Copy Firefox user.js to all default profiles
printf "Setting user.js file for default Firefox profiles...\n"
profiles_dir="${HOME}/Library/Application Support/Firefox/Profiles" 
for profile in $(ls "${profiles_dir}" | grep default); do
  cp ../assets/files/user.js "${profiles_dir}/${profile}"
  printf "Found profile: %s\n" "${profiles_dir}/${profile}"
done

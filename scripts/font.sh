#!/usr/bin/env zsh
# Install fonts
# Author: Yuzhou "Joe" Mo (@yuzhoumo)
# License: GNU GPLv3

fonts_dir="../assets/fonts"
install_location="$HOME/Library/Fonts"

# Navigate to current directory
cd "$(dirname "${0}")" || exit

fonts=$( find "${fonts_dir}" -name '*.[o,t]tf' )

printf "\nCopying fonts...\n\n%s\n" "${fonts}"
printf "%s" "${fonts}" | xargs -I % cp "%" "${install_location}/"
printf "\nFonts have been installed\n"

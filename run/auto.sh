#!/usr/bin/env zsh
# Run automated setup scripts
# Author: Yuzhou "Joe" Mo (@yuzhoumo)
# License: GNU GPLv3

# Launch system settings automation
printf "\n\x1b[33m### Apply automated system settings\x1b[0m\n\n"
../scripts/macos.sh

# Launch font automation
printf "\n\x1b[33m### Install fonts\x1b[0m\n\n"
../scripts/font.sh

# Launch brew automation
printf "\n\x1b[33m### Install packages from Homebrew\x1b[0m\n\n"
../scripts/brew.sh

# Launch icon automation
printf "\n\x1b[33m### Set application icons\x1b[0m\n\n"
../scripts/icon.sh

# Launch dock automation
printf "\n\x1b[33m### Set macOS dock\x1b[0m\n\n"
../scripts/dock.sh

# Launch post-install automation
printf "\n\x1b[33m### Set various post-install tweaks\x1b[0m\n\n"
../scripts/post.sh

printf "\n\x1b[32mDone with automated setup.\x1b[0m\n\n"

#!/usr/bin/env zsh
# Post-setup configuration script for macOS
# by Yuzhou (Joe) Mo <joe.mo@berkeley.edu>
# License: GNU GPLv3

# TODO: Setup Code folder and pull git repositories
mkdir ~/Code

# Configure global git config
git config --global user.email "49494600+yuzhoumo@users.noreply.github.com"
git config --global user.name "Joe Mo"

# Disable "Are you sure you want to open this application?" dialog on installed apps
sudo xattr -dr com.apple.quarantine /Applications 2>/dev/null
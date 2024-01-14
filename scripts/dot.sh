#!/usr/bin/env zsh
# Pull and install dotfiles from Github
# Author: Yuzhou "Joe" Mo (@yuzhoumo)
# License: GNU GPLv3

code_directory="${HOME}/Code"
github_username="yuzhoumo"
dotfiles_repo="dotfiles"
dotfiles_script="sync.sh"

http_url="https://github.com/${github_username}/${dotfiles_repo}.git"
ssh_url="git@github.com:${github_username}/${dotfiles_repo}.git"

printf "Installing dotfiles...\n"

mkdir -p "${code_directory}/${github_username}" && cd "${code_directory}/${github_username}"

# Use http to clone to avoid authentication, then set origin to ssh
[ -d "${dotfiles_repo}" ] || git clone "${http_url}"
cd "${dotfiles_repo}" && git remote set-url origin "${ssh_url}" && \
  "./${dotfiles_script}"


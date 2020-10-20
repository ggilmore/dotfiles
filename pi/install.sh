#!/usr/bin/env bash

set -euxo pipefail

echo "upgrade-system "
yes | sudo apt-get update
yes | sudo apt-get full-upgrade

PACKAGES=(
  autojump
  bat
  docker
  exa
  fail2ban
  fd
  fish
  fzf
  git
  lftp
  parallel
  ufw
  vim
)

for package in "${PACKAGES[@]}"; do
  yes | sudo apt-get install "${package}"
done

# install log2ram
echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list
wget -qO - https://azlux.fr/repo.gpg.key | sudo apt-key add --yes -
yes | sudo apt update
yes | sudo apt install log2ram

DEV_FOLDER="${HOME}/dev/github.com/ggilmore"

mkdir -p "${DEV_FOLDER}"
pushd "${DEV_FOLDER}"

git clone https://github.com/ggilmore/dotfiles.git

popd

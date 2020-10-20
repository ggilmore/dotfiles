#!/usr/bin/env bash

set -euxo pipefail

TMP_DIR=$(mktemp -d)
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

sudo bash -c "yes | apt-get update"
sudo bash -c "yes | apt-get full-upgrade"

PACKAGES=(
  autojump
  docker
  emacs-nox
  exa
  fail2ban
  fish
  fzf
  git
  lftp
  parallel
  tmux
  ufw
  vim
)

for package in "${PACKAGES[@]}"; do
  sudo bash -c "yes | apt-get install ${package}"
done

# install bat
BAT_DEB_FILE="${TMP_DIR}/bat.deb"
BAT_VERSION="${BAT_VERSION:-"0.16.0"}"

wget -O "${BAT_DEB_FILE}" "https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_armhf.deb"
sudo bash -c "yes | apt-get install libgcc1-armhf-cross"
sudo bash -c "yes | apt install ${BAT_DEB_FILE}"

# install fd
FD_DEB_FILE="${TMP_DIR}/fd.deb"
FD_VERSION="${FD_VERSION:-"8.1.1"}"

wget -O "${FD_DEB_FILE}" "https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd_  ${FD_VERSION}_armhf.deb"
sudo bash -c "yes | apt install ${FD_DEB_FILE}"

# install log2ram
echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list
wget -qO - https://azlux.fr/repo.gpg.key | sudo apt-key add --yes -
sudo bash -c "yes | apt update"
sudo bash -c "yes | apt install log2ram"

DEV_FOLDER="${HOME}/dev/github.com/ggilmore"

mkdir -p "${DEV_FOLDER}"
pushd "${DEV_FOLDER}"

git clone https://github.com/ggilmore/dotfiles.git

popd

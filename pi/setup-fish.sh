#!/usr/bin/env bash

set -euxo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"/..

FISH_CONFIG_FILE="${HOME}/.config/fish/config.fish"

mkdir -p "$(dirname "${FISH_CONFIG_FILE}")"

FISH_AUTO_JUMP_FILE="/usr/local/share/autojump/autojump.fish"

if [ ! -f "$FISH_AUTO_JUMP_FILE" ]; then
  echo "$FISH_AUTO_JUMP_FILE does not exist."
  exit 1
fi

cp ./config.fish "${FISH_CONFIG_FILE}"

#!/bin/sh

NC='\033[0m'
GREEN='\033[0;32m'
INSTALL_DIR="/opt/homebrew"

if [ ! -d "$INSTALL_DIR" ]
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.config/zsh/.zprofile"
else
    printf "${GREEN}brew${NC} already installed. \n"
fi

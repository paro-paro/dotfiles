#!/bin/sh
INSTALL_DIR="/opt/homebrew"
if [ ! -d "$INSTALL_DIR" ]
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$XDG_CONFIG_HOME/zsh/.zprofile"
else
    echo "homebrew already installed."
fi

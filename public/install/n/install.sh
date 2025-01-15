#!/bin/sh

NC='\033[0m'
GREEN='\033[0;32m'
INSTALL_DIR="$HOME/.local/share/n"

if [ ! -d "$INSTALL_DIR" ]
then
    export N_PREFIX="$HOME/.local/share/n"
    curl -L https://bit.ly/n-install | bash
else
    printf "${GREEN}n${NC} already installed. \n"
fi

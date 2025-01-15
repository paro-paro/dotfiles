#!/bin/sh

NC='\033[0m'
GREEN='\033[0;32m'
INSTALL_DIR="$HOME/.local/share/bun"

if [ ! -d "$INSTALL_DIR" ]
then
    export BUN_INSTALL="$HOME/.local/share/bun"
    curl -fsSL https://bun.sh/install | bash
else
    printf "${GREEN}bun${NC} already installed. \n"
fi

#!/bin/sh

NC='\033[0m'
GREEN='\033[0;32m'
INSTALL_DIR="$HOME/.local/share/deno"

if [ ! -d "$INSTALL_DIR" ]
then
    export DENO_INSTALL="$HOME/.local/share/deno"
    curl -fsSL https://deno.land/x/install/install.sh | sh
else
    printf "${GREEN}deno${NC} already installed. \n"
fi

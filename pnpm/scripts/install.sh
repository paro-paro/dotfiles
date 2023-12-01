#!/bin/sh
INSTALL_DIR="$HOME/.local/share/pnpm"
if [ ! -d "$INSTALL_DIR" ]
then
    source ./upgrade.sh
else
    echo "pnpm already installed."
fi

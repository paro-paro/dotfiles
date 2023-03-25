#!/bin/sh
INSTALL_DIR="$HOME/.ssh"
if [ ! -d "$INSTALL_DIR" ]
then
    cp -R "$XDG_CONFIG_HOME/ssh" $INSTALL_DIR
    rm "$HOME/.ssh/install.sh"
    echo "ssh config copied to $INSTALL_DIR"
else
    echo "ssh config already exists."
fi

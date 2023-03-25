#!/bin/sh
INSTALL_DIR="$NVM_DIR"
install () {
    echo "Installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install --lts
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> "$XDG_CONFIG_HOME/zsh/.zprofile"
}

if [ ! -d "$INSTALL_DIR" ]
then
    echo "Creating installation directory: ${INSTALL_DIR}"
    mkdir -p $INSTALL_DIR
    install
elif [ -d "$INSTALL_DIR" ] && [ ! -d "$INSTALL_DIR/.git" ]
then
    echo "Installing nvm at ${INSTALL_DIR}"
    install
else
    echo "nvm already installed."
fi

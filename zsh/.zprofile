#!/bin/zsh
source $HOME/.config/env/global.env.sh
source $ZDOTDIR/utils/alias.sh

# set PATH - from /etc/zprofile
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

# homewbrew
eval "$(/opt/homebrew/bin/brew shellenv)"

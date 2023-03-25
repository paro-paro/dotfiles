#!/bin/zsh
source $HOME/.config/envs/env
source $ZDOTDIR/extras/aliases.zsh

# set PATH - from /etc/zprofile
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

export PATH="$XDG_BIN_HOME:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

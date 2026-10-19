#!/bin/zsh

# Execution order
# .zshenv — always sourced, always first (on login, interactive, non-interactive shells)
# .zprofile — sourced for login shells only (after .zshenv)
# .zshrc — sourced for interactive shells only (after .zprofile for login shells, or after .zshenv for non-login interactive shells)

unsetopt globalrcs

export ZDOTDIR="$HOME/.config/public/zsh"
source "$HOME/.config/public/zsh/env/set.sh" # set environment variables

# system paths from /etc/paths (/etc/zprofile is skipped: unsetopt globalrcs)
if [ -x /usr/libexec/path_helper ]; then
    eval "$(/usr/libexec/path_helper -s)"
fi

# homebrew, prepended so it wins over the system paths
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

source $ZDOTDIR/utils/path.sh # custom PATHs, prepended so they win over homebrew

# Vite+ bin (https://viteplus.dev)
[ -f "$XDG_CONFIG_HOME/vite-plus/env" ] && . "$XDG_CONFIG_HOME/vite-plus/env"

#!/bin/zsh

# Execution order
# .zshenv — always sourced, always first (on login, interactive, non-interactive shells)
# .zprofile — sourced for login shells only (after .zshenv)
# .zshrc — sourced for interactive shells only (after .zprofile for login shells, or after .zshenv for non-login interactive shells)

unsetopt globalrcs
export ZDOTDIR="$HOME/.config/public/zsh"
source "$HOME/.config/public/zsh/env/set.sh" # set environment variables
source $ZDOTDIR/utils/path.sh # set up custom PATHs
# typeset -gU cdpath fpath mailpath path # remove possible duplicates in PATH

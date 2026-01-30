export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export LANG=en_US.UTF-8

export APPS="/Applications"
export DEV_PREFIX="/Volumes/dev"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="$HOME/.local/run"
export XDG_BIN_HOME="$HOME/.local/bin" # not in spec

for file in "$HOME/.config/public/zsh/env/libs/"*
do
    source "$file"
done
unset file

if [ -d "$APPS/Zed.app" ]
then
    export EDITOR="zed --wait"
else
    export EDITOR="vim"
fi

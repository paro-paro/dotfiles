export LANG=en_US.UTF-8
export APPS="/Applications"
export DEV_PREFIX="/Users/antonio/Dev"
export CLICOLOR=1
export LSCOLORS=fxexcxdxbxegedabagacad

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="$HOME/.local/run" # ???
export XDG_BIN_HOME="$HOME/.local/bin" # not in spec

for file in "$HOME/.config/env/lib/"*
do
    source "$file"
done
unset file

if [ -d "$APPS/Visual Studio Code.app" ]
then
    export EDITOR="code --wait"
else
    export EDITOR="vim"
fi

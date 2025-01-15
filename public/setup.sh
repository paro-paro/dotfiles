#!/bin/zsh
APPS="/Applications"
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_BIN_HOME="$HOME/.local/bin"

set_symlink () {
    src=$1
    dst=$2
    [ -e $src ] && [ ! -h $dst ] && ln -s $src $dst
}

# handle zsh
set_symlink "$XDG_CONFIG_HOME/public/zsh/.zshenv" "$HOME/.zshenv"
[[ -d "$HOME/.zsh_sessions" ]] && rm -rf "$HOME/.zsh_sessions"
[[ -a "$HOME/.zsh_history" ]] && rm "$HOME/.zsh_history"
[[ ! -f "$HOME/.hushlogin" ]] && touch "$HOME/.hushlogin"

# handle xdg
i=0
print "Creating XDG directories..." >&2
xdg_dirs=(.cache .local/share .local/bin .local/state .local/run)
for dir in $xdg_dirs
do
    [[ -d $HOME/$dir ]] && continue
    mkdir -p $HOME/$dir
    print "$HOME/$dir" >&2
    ((i++))
done
[[ "$i" == 0 ]] && print "XDG directories already created." >&2
printf "\n"

j=0
print "Creating cache directories..." >&2
cache_dirs=(zsh brew brew/cache brew/logs vim python npm node bun)
for dir in $cache_dirs
do
    [[ -d "$XDG_CACHE_HOME/$dir" ]] && continue
    mkdir -p "$XDG_CACHE_HOME/$dir"
    print "$XDG_CACHE_HOME/$dir" >&2
    ((j++))
done
[[ "$j" == 0 ]] && print "Cache directories already created." >&2
printf "\n" 

# add code and cursor cli's
if [[ -d "$APPS/Visual Studio Code.app" ]]; then
    VSCODE_BIN_PATH="$APPS/Visual Studio Code.app/Contents/Resources/app/bin/code"
fi

if [[ -d "$APPS/Cursor.app" ]]; then
    CURSOR_BIN_PATH="$APPS/Cursor.app/Contents/Resources/app/bin/cursor"
fi

[[ -n $VSCODE_BIN_PATH ]] && [[ -f $VSCODE_BIN_PATH ]] && set_symlink "$VSCODE_BIN_PATH" "$XDG_BIN_HOME/code"
[[ -n $CURSOR_BIN_PATH ]] && [[ -f $CURSOR_BIN_PATH ]] && set_symlink "$CURSOR_BIN_PATH" "$XDG_BIN_HOME/cursor"

echo "Success: Basic setup done."

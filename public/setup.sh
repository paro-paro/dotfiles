#!/bin/zsh
APPS="/Applications"
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_STATE_HOME="$HOME/.local/state"
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
cache_dirs=(zsh brew brew/cache brew/logs)
for dir in $cache_dirs
do
    [[ -d "$XDG_CACHE_HOME/$dir" ]] && continue
    mkdir -p "$XDG_CACHE_HOME/$dir"
    print "$XDG_CACHE_HOME/$dir" >&2
    ((j++))
done
[[ "$j" == 0 ]] && print "Cache directories already created." >&2
printf "\n"

k=0
print "Creating state directories..." >&2
state_dirs=(zsh vim python node)
for dir in $state_dirs
do
    [[ -d "$XDG_STATE_HOME/$dir" ]] && continue
    mkdir -p "$XDG_STATE_HOME/$dir"
    print "$XDG_STATE_HOME/$dir" >&2
    ((k++))
done
[[ "$k" == 0 ]] && print "State directories already created." >&2
printf "\n"

echo "Success: Basic setup done."

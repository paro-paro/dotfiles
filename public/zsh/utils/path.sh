# unique entries: when a directory is added again, the first position is kept
typeset -gU path

path=(
    $XDG_BIN_HOME       # custom bin dir
    $path
)

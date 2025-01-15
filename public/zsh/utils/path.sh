#!/bin/sh

# custom bin dir
export PATH="$XDG_BIN_HOME:$PATH"

# n
case ":$PATH:" in
    *":$N_PREFIX:"*) ;;
    *) export PATH="$N_PREFIX/bin:$PATH" ;;
esac

# deno
case ":$PATH:" in
    *":$DENO_INSTALL:"*) ;;
    *) export PATH="$DENO_INSTALL/bin:$PATH" ;;
esac

# bun
case ":$PATH:" in
    *":$BUN_INSTALL:"*) ;;
    *) export PATH="$BUN_INSTALL/bin:$PATH" ;;
esac

# cargo
case ":$PATH:" in
    *":$CARGO_HOME:"*) ;;
    *) export PATH="$CARGO_HOME/bin:$PATH" ;;
esac

# bun autocomplete
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# remove possible duplicates in PATH
typeset -gU cdpath fpath mailpath path

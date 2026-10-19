# zsh
export SAVEHIST=1000
export HISTSIZE=2000
export LESSHISTFILE=-
export HISTFILE="$XDG_STATE_HOME/zsh/.zsh_history"

# brew
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CACHE="$XDG_CACHE_HOME/brew/cache"
export HOMEBREW_LOGS="$XDG_CACHE_HOME/brew/logs"

# vim + python + node + npm
export VIMINIT="source $XDG_CONFIG_HOME/public/.vimrc"
export PYTHON_HISTORY="$XDG_STATE_HOME/python/.python_history"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node/.node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/.npmrc"

# claude
export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME/claude"

# uv
export UV_CACHE_DIR="$DEV_PREFIX/.cache/uv"

#!/bin/zsh
unsetopt BEEP

if [ "$TERM_PROGRAM" = "vscode" ]; then
    bindkey "^[[D" backward-char        # left
    bindkey "^[[C" forward-char         # right
    bindkey "^[b" backward-word         # alt + left
    bindkey "^[f" forward-word          # alt + right
    bindkey "^[[1;5D" beginning-of-line # ctrl + left
    bindkey "^[[1;5C" end-of-line       # ctrl + right
    bindkey "^[[3~" delete-char         # fn + delete (forward delete)
fi

# completions + version control
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/.zcompdump"
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '%r [%F{yellow}%b%f | %F{yellow}%u%f %F{green}%c%f %F{red}%m%f]'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' check-for-staged-changes true
zstyle ':vcs_info:*' unstagedstr '+'
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep -m 1 '^??' &>/dev/null
    then
        hook_com[misc]='!'
    fi
}

# set up prompt with vcs_info
precmd () { vcs_info }
setopt PROMPT_SUBST
PROMPT='%F{yellow}%T%f %1~ %# '
RPROMPT='${vcs_info_msg_0_}'

# utils
source $ZDOTDIR/utils/alias.sh
source $ZDOTDIR/utils/path.sh

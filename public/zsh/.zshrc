#!/bin/zsh
# sourced on interactive shells (prompt)

unsetopt BEEP
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS # write history immediately, shared across tabs, no duplicates
source $ZDOTDIR/utils/alias.sh

if [ "$TERM_PROGRAM" = "zed" ]; then
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
zstyle ':vcs_info:*' formats '%F{yellow}%u%f %F{green}%c%f %F{red}%m%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' check-for-staged-changes true
zstyle ':vcs_info:*' unstagedstr '+'
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

# hooks only run inside a repo; ls-files skips the tracked-file diff vcs_info already did
+vi-git-untracked() {
    if [[ -n $(git -C "${hook_com[base]}" ls-files --others --exclude-standard --directory --no-empty-directory 2>/dev/null | head -n 1) ]]
    then
        hook_com[misc]='!'
    fi
}

# set up prompt with vcs_info
precmd () {
    vcs_info
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
        _git_prompt="[%F{yellow}${branch}%f] "
    else
        _git_prompt=""
    fi
}

setopt PROMPT_SUBST
PROMPT='%F{yellow}%T%f %1~ ${_git_prompt}%# '
RPROMPT='${vcs_info_msg_0_}'

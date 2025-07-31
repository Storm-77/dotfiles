# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -ac'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

PROMPT_COMMAND='PS1_CMD1=$()'; PS1='\[\e[38;5;34;2;3m\]\u\[\e[38;5;215m\]@\[\e[38;5;34m\]\H \[\e[38;5;160;1m\]\w \[\e[23;38;5;215m\]> \[\e[0;38;5;33m\]${PS1_CMD1}\[\e[0m\]'

if type fzf >/dev/null 2>&1; then
    eval "$(fzf --bash)"
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi



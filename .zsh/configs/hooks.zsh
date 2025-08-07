
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
eval "$(tmuxifier init -)"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


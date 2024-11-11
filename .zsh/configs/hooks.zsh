
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


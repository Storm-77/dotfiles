# disable flow control, cant stop terminal with ctrl+s
stty -ixon

bindkey '^S' autosuggest-accept

bindkey '^f' forward-word
bindkey '^ ' autosuggest-fetch

bindkey '^z' autosuggest-clear

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

bindkey '^X' kill-whole-line

bindkey '^e' vi-cmd-mode

# do not to switch to edit mode when i press delete key
bindkey "^?" backward-delete-char  # For Backspace
bindkey "^[[3~" delete-char  # This binds the Delete key to its default behavior

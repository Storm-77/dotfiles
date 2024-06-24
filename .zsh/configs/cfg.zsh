export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export HISTFILESIZE=50000
export HISTSIZE=500000

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(zoxide init zsh)"

plugins=(git docker fzf)

source $ZSH/oh-my-zsh.sh

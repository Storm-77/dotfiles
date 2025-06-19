
zinit light zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# zinit light Aloxaf/fzf-tab
zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.

# pure prompt
zinit light sindresorhus/pure

zinit ice as"completion"
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zinit snippet https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo/sudo.plugin.zsh

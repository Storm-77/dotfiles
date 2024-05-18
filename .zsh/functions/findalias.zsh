
fae(){
   alias | fzf | cut -d '=' -f 1 | xargs -r -o -I {} zsh -c "source ~/.zshrc && eval {}"
}

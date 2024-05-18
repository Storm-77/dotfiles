pacrem(){
    pacman -Qet | fzf | awk '{print $1}' | xargs -o -r sudo pacman -R
}

pacrema(){
    pacman -Q | fzf | awk '{print $1}' | xargs -o -r sudo pacman -R
}

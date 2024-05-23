pacrem(){
    # delete selected package and its dependencies that are not requiered by other packages
    pacman -Qet | fzf | awk '{print $1}' | xargs -o -r sudo pacman -Rs
}

pacrema(){
    # delete selected package and its dependencies that are not requiered by other packages
    pacman -Q | fzf | awk '{print $1}' | xargs -o -r sudo pacman -Rs
}

pacrema-recurs(){
    # delete selected package and its dependencies, and everything that depends on that package
    # use with caution
    pacman -Q | fzf | awk '{print $1}' | xargs -o -r sudo pacman -Rcs
}

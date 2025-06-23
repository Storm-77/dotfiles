pacrem(){

    explicitly_installed_mode(){
        # delete selected package and its dependencies that are not required by other packages
          pacman -Qe | fzf -m | awk '{print $1}' | xargs -o -r sudo pacman -Rs
    }
          
    # Check if any arguments are provided
    if [ $# -eq 0 ]; then
        explicitly_installed_mode
    fi 


    while getopts ":har" opt; do
      case $opt in
        h)
            echo "Pacrem, mini tui for pacman\n"
            echo "\tAvailable flags: (only first takes effect)"
            echo "\t-h\tdisplay help and exit"
            echo "\t-r\tuse recursive mode, uninstall package dependencies and all packages that depend on this package"
            echo "\t-a\tall packages mode, lists packages installed as dependencies as well as explicitly installed packages"
            echo "\n\tWhen no arguments provided default mode lists explicitly installed packages"
            break
          ;;
        a)
            # delete selected packages and their dependencies that are not required by other packages
            pacman -Q | fzf -m | awk '{print $1}' | xargs -o -r sudo pacman -Rs
            break
          ;;
        r)
            # delete selected package and its dependencies, and everything that depends on that package
            # use with caution
            pacman -Q | fzf | awk '{print $1}' | xargs -o -r sudo pacman -Rcs
            break
          ;;
        \?)
            echo "Unknown flag see: [pacrem -h]"
            break
            ;;
        :)
          echo "Default mode"
          explicitly_installed_mode
          break
          ;;
      esac
    done


}

pacfind(){
    whence -pm '*' | fzf | xargs -o -r pacman -Qo
}

pacfiles(){
   pacman -Q | fzf | awk '{print $1}' | xargs -o -r pacman -Ql
}

pacinfo(){
	pacman -Qq | fzf --preview "pacman -Qi {}" --preview-window=right,65%\
    --no-sort --no-multi --border-label 'Package info' --prompt '⚡ ' \
    --header $'  (S)pactree (D)everse pactree (F)pacman info\n  (R)binaries provided (W)All (E)explicitly installed  
        ' \
    --bind 'tab:down,btab:up' \
    --bind 'ctrl-w:reload(pacman -Qq)' \
    --bind 'ctrl-e:reload(pacman -Qqe)' \
    --bind 'ctrl-s:preview(pactree -d 2 {})' \
    --bind 'ctrl-d:preview(pactree -d 3 -r {})' \
    --bind 'ctrl-f:preview(pacman -Qi {})' \
    --bind 'ctrl-r:preview(pacman -Ql {} | grep "/bin/")' \
}


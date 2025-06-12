
batset(){
    if [ -z "$1" ]; then
        echo "Reset to default: \n"
        sudo tlp setcharge BAT0
    else
        if [[ $1 =~ ^[0-9]+$ ]]; then
            sudo tlp setcharge BAT0 $1
        else
            echo "Invalid argument:\nUssage setbat <max threshold number>"
            return 1
        fi  
    fi

    return 0
    sudo tlp-stat -b

}

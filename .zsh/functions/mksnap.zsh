mksnap(){

    if [ -z "${1+x}" ]; then
        snap_description="pre-update"
    else
        snap_description=$1
    fi
    
    sudo timeshift --create --comments $snap_description 

}



nm_connect(){
    
    if [ -z "${1+x}" ]; then
        # no argument passed
        echo "Usage: nm_connect <connection_name>"
        return 1;
    fi

    connection_name=$1

    if nmcli connection show --active | grep -q $connection_name ; then
        # is connected
        echo "Ok, already connected"
    else
        nmcli connection up $connection_name > /dev/null 2>&1
        exists=$?

        if [[ "$exists" -eq 0 ]]; then
            echo "Ok, connected"
            return 0;
        fi
        echo "Invalid connection name"
    fi

}

nm_disconnect(){
    
    if [ -z "${1+x}" ]; then
        # no argument passed
        echo "Usage: nm_disconnect <connection_name>"
        return 1;
    fi

    connection_name=$1

    if nmcli connection show --active | grep -q $connection_name ; then
        # is connected
        nmcli connection down $connection_name > /dev/null 2>&1
        echo "Ok"
    else
        echo "Ok, no connection in place"
    fi

}

nm_toggle(){

    if [ -z "${1+x}" ]; then
        # no argument passed
        echo "Usage: nm_toggle <connection_name>"
        return 1;
    fi

    connection_name=$1

    if nmcli connection show --active | grep -q $connection_name ; then
        # is connected
        nmcli connection down $connection_name > /dev/null 2>&1
        ecode=$?

        if [[ "$ecode" -eq 0 ]]; then
            echo "Ok, disconnected"
            return 0;
        fi
    else
        nmcli connection up $connection_name > /dev/null 2>&1
        exists=$?

        if [[ "$exists" -eq 0 ]]; then
            echo "Ok, connected"
            return 0;
        fi
        echo "Bad name"
    fi
}

# add for toggling connection

ta() {
    if [ -z "${1+x}" ]; then
        session_name=$(basename "$(pwd)")
    else
        session_name=$1
    fi

    tmux attach -t "$session_name"
}

tn() {
    if [ -z "${1+x}" ]; then
        session_name=$(basename "$(pwd)")
    else
        session_name=$1
    fi

    tmux new -s "$session_name"
}



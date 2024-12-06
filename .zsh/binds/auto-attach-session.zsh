#
# run ta command when shell is interactive, AND not running in tmux pane
if [[ -o interactive && -z $TMUX && -z "$SSH_CONNECTION" ]]; then
    if tty | grep -q 'pts' ; then
        ta
    fi
fi

# Function to close all windows except the first two
close_except_first_two() {
    # Get the list of window indices and close those greater than 1
    for i in $(tmux list-windows -F "#{window_index}"); do
        if [ "$i" -gt 2 ]; then
            tmux kill-window -t "$i"
        fi
    done
}

close_except_first_two

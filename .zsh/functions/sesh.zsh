ta() {
    if [ -z "${1+x}" ]; then
        if [ $(pwd) = "$HOME" ]; then
            sesh connect main
      else
        sesh connect .
      fi
    else
        sesh connect $1
    fi

}


t(){
    if [ -n "${1+x}" ]; then
        sesh connect $1
    else

        sesh connect $(
            sesh list | fzf \
                --no-sort --border-label ' sesh ' --prompt '⚡  ' \
                --header '  (A)ll (S)sessions (D)configs (X)zoxide (G)kill (F)ind' \
                --bind 'tab:down,btab:up' \
                --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list)' \
                --bind 'ctrl-s:change-prompt(🪟  )+reload(sesh list -t)' \
                --bind 'ctrl-d:change-prompt(⚙️  )+reload(sesh list -c)' \
                --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z)' \
                --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
                --bind 'ctrl-g:execute(tmux kill-session -t {})+change-prompt(⚡  )+reload(sesh list)'
            )
    fi
}

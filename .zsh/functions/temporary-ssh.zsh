
tssh() {
    #do things with parameters like $1 such as
    ssh $1 -o "UserKnownHostsFile=/dev/null"
}


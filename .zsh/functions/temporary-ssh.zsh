tssh() {
    ssh $@ -o "UserKnownHostsFile=/dev/null"
}


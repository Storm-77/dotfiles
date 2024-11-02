
vmrun(){

    sudo virsh list --all --name | fzf | xargs -o -r sudo virsh start
}

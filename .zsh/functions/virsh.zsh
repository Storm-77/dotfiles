
vmtui(){

    sudo -v &&
    sudo systemctl start libvirtd &&
    sudo virsh list --all --name | fzf \
        --header '  (S)tart (D)connect (X)show all (Z)show running' \
        --bind 'ctrl-d:execute(nohup virt-manager --connect qemu:///system --show-domain-console {} >/dev/null 2>&1 &)+abort' \
        --bind 'ctrl-s:execute-silent(sudo virsh start {})' \
        --bind 'ctrl-z:reload(sudo virsh list --state-running --name)' \
        --bind 'ctrl-x:reload(sudo virsh list --all --name)' \

}

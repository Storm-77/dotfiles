
# allows to interactively pick kernel image to rebuild
mkinit(){
    kernel_image_to_make=$(find /boot -path '/boot/lost+found' -prune -o -name 'vmlinuz*' -print | sed 's|/boot/vmlinuz-||; s|-x86_64$||' | fzf --height=8)
    echo $kernel_image_to_make | xargs -o -r sudo mkinitcpio -p 
}

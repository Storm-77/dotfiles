alias btw=fastfetch
alias caur=aur-check-updates
alias uaur="yay -Syu --aur"
alias ryay="yay -Sc"
alias lsaur="pacman -Qm"
alias pacorph="pacman -Qtdq"
alias pacorphrm="pacorph | sudo pacman -Rns -"
alias cat=bat
alias grep=rg
alias lg=lazygit
alias nv="nvim ."
alias pacfetch="sudo pacman -Syy"
alias pacup="sudo pacman -Su"
alias kernel="uname -sr"

alias pacerror="sudo pacman -Dk"
alias ncdu="ncdu --color dark"
alias ncdur="ncdu / --exclude /mnt --exclude /run --exclude /proc"
alias ncduro="ncdu / --exclude /mnt --exclude /home --exclude /run --exclude /proc"
alias rtop="radeontop -c"

alias xall="xhost +si:localuser:$USER"
alias mrrank="sudo -v && rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist"

alias mkinitimg="sudo mkinitcpio -p linux"
alias cfgrub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias zsr="source ~/.zshrc"
alias ..="cd .."
alias ...="cd ../.."
alias .=pwd

alias extract="unp -Ua"
alias fa="alias | fzf | cut -d '=' -f 1"

alias sdkc="sdk current"
alias astd="/opt/android-studio/bin/studio.sh . > /dev/null 2>&1 &"

alias cp="cp -vi"
alias mv="mv -vi"

alias cpv="rsync -avh --info=progress2"

alias myip="curl ifconfig.me"
alias dff="df -h -x tmpfs -x efivarfs"
alias gcnix="nix-collect-garbage -d"

alias chs="cht --shell"

alias xz='xz -T $(nproc)'
alias diff='diff --color=auto'
alias ip='ip -color=auto'

alias lsnap="sudo timeshift --list"
alias rmsnap="sudo timeshift --delete"
alias usesnap="sudo timeshift --restore"

#alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

alias guc="git reset --soft HEAD~1"

alias rmtmp="sudo systemd-tmpfiles --clean && sudo journalctl --vacuum-time=7d"
alias batstat="sudo tlp-stat -b"

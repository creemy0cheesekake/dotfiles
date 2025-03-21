# alias rm='echo "use trash-put (alias tp) instead."; false'
alias f 'vifm'
alias tp 'trash-put'
alias pc 'yay -S --removemake'
alias ps 'yay -Ssq'
alias pcs 'yay -s --removemake'
alias rpc 'yay -Rns'
alias ls 'ls -Alth --color'
alias lsc 'ls --color=never'
alias v 'nvim'
alias bin 'cd /usr/local/bin'
alias music 'cmus'
alias play 'mpv'
alias spdt 'speedtest-cli'
alias tetris 'yetris'
alias snake 'nsnake'
alias mntwindows 'sudo mount /dev/nvme0n1p3 /mnt/Windows/'
alias ptc 'ping -i .2 -c 3 8.8.8.8'
alias mkbch 'git checkout -b'
alias tmail "tmpmail && tmpmail | grep Inbox | sed 's/.*for //' | head -c-3 | cpy s"
alias jl "julia"
alias tard "tar -zxvf"
alias pdf "setsid sioyek"
alias torrent "transmission-cli"
alias prune "find . -empty -type d -delete "
alias keys "xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
alias update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias install-grub "sudo grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB"
alias termsplit 'eval "alacritty &"'
alias octalmode "stat -c '%a'"
alias 7z "7zz"
alias wifilogin "xdg-open \"http://$(route -n | head -3 | tail -1 | xargs | cut -f2 -d' ')\""
alias bc "bc -l"
alias clearcpy "echo '' | cpy"
alias mkdir "mkdir -p"
alias dict "sdcv"
alias jpnb "jupyter notebook"
alias cleansedirname 'rename "s/ /_/g"'
alias cd 'z'
alias cdi 'zi'

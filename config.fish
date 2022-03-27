if status is-interactive
    figlet Welcome ! | lolcat -S 113 -F .15
    pfetch | lolcat -S 65 -F .2
    set fish_key_bindings fish_user_key_bindings
    set PATH /usr/local/bin:/home/arjun/Applications/thinkorswim:/sbin:/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/jvm/default/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:/home/arjun/.local/bin:/home/arjun/.cabal/bin:/home/arjun/.cargo/bin:/home/arjun/.rvm/bin
    set -x  _JAVA_AWT_WM_NONREPARENTING 1

    rvm default
    source ~/.dotfiles/aliases.fish
    source ~/.dotfiles/funcs.fish
end


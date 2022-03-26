if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx EDITOR nvim
    source ~/.dotfiles/aliases.fish
    pfetch | lolcat -S 65 -F .2
    figlet Welcome ! | lolcat -S 113 -F .15
	set fish_key_bindings fish_user_key_bindings
    killall emote &> /dev/null
    eval "nohup emote &" &> /dev/null
end

set PATH /usr/local/bin:/home/arjun/Applications/thinkorswim:/sbin:/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/jvm/default/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:/home/arjun/.local/bin:/home/arjun/.cabal/bin:/home/arjun/.cargo/bin
set -x  _JAVA_AWT_WM_NONREPARENTING 1

source ~/.dotfiles/funcs.fish

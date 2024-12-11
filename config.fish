if status is-interactive
    figlet Welcome !
    pfetch
    set fish_key_bindings fish_user_key_bindings
	zoxide init fish | source
    source ~/.dotfiles/aliases.fish
    source ~/.dotfiles/funcs.fish
end



ZSH_THEME="fishy"
INSERT_MODE_INDICATOR="%F{yellow}+%f"
DISABLE_MAGIC_FUNCTIONS=true

plugins=( git zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting zsh-vi-mode)

pfetch
figlet Welcome !

export HISTFILE=$ZDOTDIR/histfile

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
unalias history

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/funcs.zsh
eval "$(zoxide init zsh)"

source ~/.zsh/git-prompt.zsh/git-prompt.zsh
source ~/.zsh/git-prompt.zsh/custom_prompt.zsh

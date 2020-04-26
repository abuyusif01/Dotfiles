export ZSH=$HOME/.oh-my-zsh
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color? [Yes, No, Abort, Edit] "

ZSH_THEME="bubblified"
source $HOME/.oh-my-zsh/oh-my-zsh.sh
source $HOME/.config/zsh/rc/config.zsh
source $HOME/.config/zsh/Plugins/fast/fast-syntax-highlighting.plugin.zsh
source $HOME/.config/zsh/Plugins/zsh-auto/zsh-autosuggestions.zsh

HISTFILE=~/.local/share/kitty/history.kitty
HISTSIZE=10000000000
SAVEHIST=1000000000

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

setopt appendhistory
setopt correct
#bindkey -v

#some nice looking shit
#$HOME/.config/bin/ufetch


#[ -f $HOME/.config/zsh/Plugins/fzf.zsh ] && source ~$HOME/.config/zsh/Plugins/fzf.zsh

#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
 # source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

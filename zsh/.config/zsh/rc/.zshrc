source $HOME/.config/zsh/rc/config.zsh
source $HOME/.config/zsh/Plugins/fast/fast-syntax-highlighting.plugin.zsh
source $HOME/.config/zsh/Plugins/fast/fast-string-highlight

export PATH=$PATH:$HOME/.config/bin
export PATH=$PATH:/opt/jdk-13.0.1/bin

HISTFILE=~/.local/share/kitty/history.kitty
HISTSIZE=10000000000
SAVEHIST=10000000000
setopt appendhistory
bindkey -v

#some nice looking shit
$HOME/.config/bin/ufetch

[ -f $HOME/.config/zsh/Plugins/fzf.zsh ] && source ~$HOME/.config/zsh/Plugins/fzf.zsh

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

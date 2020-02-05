source $HOME/.config/zsh/rc/config.zsh
source $HOME/.config/zsh/Plugins/fast/fast-syntax-highlighting.plugin.zsh
source $HOME/.config/zsh/Plugins/fast/fast-string-highlight

export PATH=$PATH:$HOME/.config/bin
export PATH=$PATH:/opt/jdk-13.0.1/bin

<<<<<<< HEAD
HISTFILE=~/.local/share/kitty/history.kitty
=======
HISTFILE=~/.config/zsh/.cache/history
>>>>>>> 37a136c4b7de4b9bf8f238ea849876a70fc557bd
HISTSIZE=10000000000
SAVEHIST=10000000000
setopt appendhistory
bindkey -v

#some nice looking shit
#ufetch

[ -f $HOME/.config/zsh/Plugins/fzf.zsh ] && source ~$HOME/.config/zsh/Plugins/fzf.zsh

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
MUSICROOT=~/Music
function fplay {
if [ $1 = '-v' ]; then
shift 1
find -LE $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -print -exec afplay "{}" \; &
elif [ $1 = '-g' ]; then
shift 1
find -E $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -exec open -a QuickTime\ Player "{}" \; -exec osascript -e 'tell application "QuickTime Player" to play document 1' \; &
else
find -E $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -exec afplay "{}" \; &
fi
}

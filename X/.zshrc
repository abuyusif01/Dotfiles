source /home/blackdracula/.zsh/config.zsh
source /home/blackdracula/.zsh/fast/fast-syntax-highlighting.plugin.zsh
source /home/blackdracula/.zsh/fast/fast-string-highlight
export PATH=$PATH:/home/blackdracula/.config/bin

#some nice looking shit
ufetch

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


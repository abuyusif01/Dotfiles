# only sourcing here!!
source $HOME/.zprezto/init.zsh
source $HOME/.zsh/fast/fast-syntax-highlighting.plugin.zsh
source $HOME/.zsh/config.zsh
source $HOME/.zsh/functions.zsh



# path changes
export PATH=$HOME/bin:$PATH
export LANG="en_US.UTF-8"
export PATH=$HOME/.local/bin:$PATH
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# FZF bindings debian time
#source /usr/share/fzf/key-bindings.zsh
#source /usr/share/fzf/completion.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

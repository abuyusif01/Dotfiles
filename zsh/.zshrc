# OPENSPEC:START
# OpenSpec shell completions configuration
fpath=("/Users/abubakar.yusif/.zsh/completions" $fpath)
autoload -Uz compinit
compinit
# OPENSPEC:END

# only sourcing here!!
source $HOME/.zprezto/init.zsh
source $HOME/.zsh/fast/fast-syntax-highlighting.plugin.zsh
source $HOME/.zsh/config.zsh
source $HOME/.zsh/functions.zsh

source /opt/homebrew/Cellar/fzf/0.67.0/shell/key-bindings.zsh
source /opt/homebrew/Cellar/fzf/0.67.0/shell/completion.zsh

# path changes
export PATH=$HOME/.config/bin:$PATH
export PATH=/home/blackdracula/dev/flutter_dev/flutter/bin:$PATH
export LANG="en_US.UTF-8"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.pub-cache/bin:$PATH
eval "$(shadowenv init zsh)"
eval "$(direnv hook zsh)"

# only sourcing here!!
source $HOME/.zprezto/init.zsh
source $HOME/.zsh/fast/fast-syntax-highlighting.plugin.zsh
source $HOME/.zsh/config.zsh
source $HOME/.zsh/functions.zsh

# path changes
export PATH=$HOME/.config/bin:$PATH
export PATH=/home/blackdracula/dev/flutter_dev/flutter/bin:$PATH
export LANG="en_US.UTF-8"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.pub-cache/bin:$PATH
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
export XDG_USER_CONFIG_DIR=$HOME/.config
#ANDROID_HOME=$HOME/Android/Sdk
export CHROME_EXECUTABLE="/bin/brave-beta"
export ANDROID_SDK=/opt/android-sdk
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH
# FZF bindings debian time
#source /usr/share/fzf/key-bindings.zsh
#source /usr/share/fzf/completion.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

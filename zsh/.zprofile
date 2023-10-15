# scroll with less
export LESS='--mouse --wheel-lines=3'

# keyboard related stuff
xset r rate 250 50
ksuperkey -e 'Super_L=Alt_L|F2'
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"


# unclutter
unclutter --fork --ignore-scrolling --timeout 5 --jitter 10

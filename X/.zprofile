if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
  export LC_ALL='en_US.UTF-8'
fi

typeset -gU cdpath fpath mailpath path
path=(
  /usr/local/{bin,sbin}
  $path
)

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='--mouse --wheel-lines=3'
export ZDOTDIR="$HOME/.config/zsh/rc"

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

server=`ps -e | grep -i xorg`
if [ -z "$server" ]; then
    startx
    wmname compiz
    export EDITOR='nvim'
    export VISUAL='nvim'
    export PAGER='less'
else
    echo "X is running at `ps -e |grep -i xorg|awk '{print$2}'`"
fi

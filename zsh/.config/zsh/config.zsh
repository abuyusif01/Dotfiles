
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag --hidden -p ~/.fignore -g ""'
fi

sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    elif [[ $BUFFER == $EDITOR\ * ]]; then
        LBUFFER="${LBUFFER#$EDITOR }"
        LBUFFER="sudoedit $LBUFFER"
    elif [[ $BUFFER == sudoedit\ * ]]; then
        LBUFFER="${LBUFFER#sudoedit }"
        LBUFFER="$EDITOR $LBUFFER"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}

# various aliases.
alias free="free -h"
alias cat="bat " # this one is way better
alias ls="alias ls=lsd && ls"
alias clip='xclip -selection clipboard'
alias n="nvim"
alias home="cd&&clear"
alias suspend="systemctl suspend"
alias scan="nmcli d wifi rescan"
alias list="nmcli d wifi list"
alias ch="cd; cat /dev/null >! .zhistory"
alias temp="System_temp.sh"

#packages aliases.
alias remove="yay -Rs"
alias install="yay -S"
alias pinfo="yay -Qi " # get info of an installed package.
alias orphan="yay -Rns $(pacman -Qtdq)" # remove orphaned packages.
alias cleanc="yay -Scc" # clean cached packages files.

# git aliases.
alias gs="git status"
alias ga="git add"
alias gc="git commit --signoff"
alias gcp="git cherry-pick"
alias gl="git log | bat"
alias gd="git diff"
alias gpush="git push origin master"
alias clone="git clone"
alias gb="git branch -a"
alias gco="git checkout"
alias gbd="git branch -d "

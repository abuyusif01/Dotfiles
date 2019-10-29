# systemd aliases.
 user_commands=(
  list-units is-active status show help list-unit-files
  is-enabled list-jobs show-environment cat list-timers)

sudo_commands=(
  start stop reload restart try-restart isolate kill
  reset-failed enable disable reenable preset mask unmask
  link load cancel set-environment unset-environment
  edit)

for c in $user_commands; do; alias sc-$c="systemctl $c"; done
for c in $sudo_commands; do; alias sc-$c="sudo systemctl $c"; done

alias sc-enable-now="sc-enable --now"
alias sc-disable-now="sc-disable --now"
alias sc-mask-now="sc-mask --now"

# double press Esc to add sudo.
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
zle -N sudo-command-line
bindkey "\e\e" sudo-command-line
export EDITOR=nvim
# various aliases.
alias free="free -h"
alias network="sc-restart NetworkManager"
alias blame="systemd-analyze && systemd-analyze blame"
alias journal="journalctl -b0 -p err"
alias fdisk="sudo fdisk -l"
alias cleanj="sudo journalctl --vacuum-time=5d"
alias cpr="rsync --progress --size-only --inplace --verbose "
alias cat="bat " # this one is way better
alias ls="alias ls=lsd && ls"
alias clip='xclip -selection clipboard'
alias zsh="exec zsh"
alias n="nvim"
alias home="cd"
alias suspend="systemctl suspend"

#packages aliases.
alias remove="yay -Rs"
alias install="yay -S"
alias pinfo="yay -Qi " # get info of an installed package.
alias orphan="yay -Rns $(pacman -Qtdq)" # remove orphaned packages.
alias cleanc="yay -Scc" # clean cached packages files.

# git aliases.
alias gs="git status"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit --signoff"
alias gcp="git cherry-pick"
alias gl="git log | bat"
alias gd="git diff"
alias gpush="git push origin master"
alias gpull="git pull origin master"

#export variables
export PATH=$PATH:/home/blackdracula/ICPC/Practice
export PATH=$PATH:/home/blackdracula/bin

#some fancy stuff
ufetch

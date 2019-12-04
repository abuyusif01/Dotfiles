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

tmux set -g status-right "#(echo \\\\(test\\\\))"
tmux set -g status-bg \#0f111a

#determines search program for fzf
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag --hidden -p ~/.fignore -g ""'
fi

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
alias n="nvim"
alias home="cd&&clear"
alias suspend="systemctl suspend"
alias C="cd; cd C_C++/C; ls"
alias Cp="cd; cd C_C++/C++; ls"
alias scan="nmcli d wifi rescan"
alias list="nmcli d wifi list"
alias study="cd;cd Sem && ranger"
alias jfx="javafx11-scenebuilder"
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

#export PATH && Vars
export PATH=$PATH:/home/blackdracula/.config/bin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim

#fuck intellij-idea
wmname compiz

#nice looking shit
ufetch
sleep 0.2
#have no idea wtf is this not working well
tmux source ~/Dotfiles/tmux/.config/tmux/.tmux.conf

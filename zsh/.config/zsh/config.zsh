# alias to easy my laziness life
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
wmname compiz # this supposed to be at startup

#nice looking shit
ufetch
sleep 0.1

#have no idea wtfk this shit not working well
tmux source ~/Dotfiles/tmux/.config/tmux/.tmux.conf

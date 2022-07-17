# CTF aliases
alias nc='function _nc(){ stty raw -echo (stty size; cat) | nc -nlvp $1 };_nc' # a trick to get everything working with nc, stole it from contpyshell

# Connectivity aliases
alias connect='function _connect(){ [[ -z $1 ]] && echo "SSID Must be given" && return -1 || echo -n "Connecting to $1"; nmcli d wifi list &> /dev/null; nmcli d wifi connect $1; [[ $? -eq 0 ]] && echo -n "Connection successfully"; return 0 ||  "Something went wrong!!!"; return -1 }; _connect' # I just hate using mouse
alias list='nmcli d wifi list'

# various aliases.
alias zsh="exec zsh"
alias n="nvim"
alias py="python3"
alias open="xdg-open"
alias d="dirs -v" # -v option give the number of stack which enable cd -1, -2, -3...
alias clip='xclip -selection clipboard' # sending buffer to clipboard

# systemd alias
alias start="systemctl start"
alias stop="systemctl stop"
alias status="systemctl status"
alias reload="systemctl reload"

# modernaize
alias ls="lsd"
alias du="dust"
alias df="duf"
alias c="bat"

# packages aliases.
alias y="yay -Syu --noconfirm"
alias remove="yay -Rds"
alias install="yay -S"
alias pinfo="yay -Qi " # get info of an installed package.
alias orphan="yay -Rns $(pacman -Qtdq)" # remove orphaned packages.
alias cleanc="yay -Scc" # clean cached packages files.
 
# git aliases.
alias clone="git clone"
alias gs="git status"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit --signoff"
alias gcp="git cherry-pick"
alias gl="git log | bat"
alias gr="git remote"
alias gra="git remote add"
alias grm="git remote rm"
alias grv="git remote -v"
alias gd="git diff"
alias gpl="git pull"
alias ngd="git diff --name-only | uniq | xargs nvim" # open files with conflicts in nvim
alias gclean="git reflog expire --all --expire=now && git gc --prune=now --aggressive"

# Directory hashes.
hash -d dots="/home/$HOME/.dotfiles"
hash -d git="/home/$HOME/Random/git"
hash -d dav="/home/$HOME/Random/git/vince"

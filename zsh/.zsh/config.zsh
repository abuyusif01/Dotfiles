# shell settings
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

# zsh completion
autoload -U compinit && compinit

# ls colors
eval $( dircolors -b $HOME/.dircolors )

# determines search program for fzf
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden""'
fi

# various aliases.
alias free="free -h"
alias fdisk="sudo fdisk -l"
alias cat="bat "
alias n="nvim"
alias py="python3"
alias ls="lsd"
alias suspend="systemctl suspend"
alias clip='xclip -selection clipboard'
alias du="du -sh"
alias start="systemctl start"
alias stop="systemctl stop"
alias status="systemctl status"
alias reload="systemctl daemon-reload"


# packages aliases. using debian based
#alias y="yay -Syu --noconfirm"
#alias remove="yay -Rds"
#alias install="yay -S"
#alias pinfo="yay -Qi " # get info of an installed package.
#alias orphan="yay -Rns $(pacman -Qtdq)" # remove orphaned packages.
#alias cleanc="yay -Scc" # clean cached packages files.

# git aliases.
alias gs="git status"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit --signoff"
alias gcp="git cherry-pick"
alias gl="git log|bat"
alias gr="git remote"
alias gra="git remote add"
alias grm="git remote rm"
alias grv="git remote -v"
alias gd="git diff|bat"
alias gpl="git pull"
alias ngd="git diff --name-only | uniq | xargs nvim" # open files with conflicts in nvim
alias gclean="git reflog expire --all --expire=now && git gc --prune=now --aggressive"

# Directory hashes.
hash -d dots="$HOME/.dotfiles"
hash -d note="$HOME/SigCyberSec/pre-training"
hash -d clip="$HOME/Screenshots/clip"
hash -d shot="$HOME/Screenshots"
hash -d sig="$HOME/SigCyberSec"
hash -d dev="$HOME/dev"
hash -d azi="$HOME/connections/azilink"
hash -d try="$HOME/connections/tryh4ckm3"

# fzf alias

alias prev="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"



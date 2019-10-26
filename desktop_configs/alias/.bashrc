#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
##############################ALIAS######################################
									#
#Default alias								#
alias ls='ls --color=auto'						#
alias grep='grep --color=auto'						#
									#
#Daily alias								#
alias clip='xclip -selection clipboard'					#
alias scan='nmcli d wifi rescan'					#
alias show='nmcli d wifi list'						#
									#
#Git alias								#
alias gs='git status'							#
alias ga='git add'							#
alias gc='git commit -m'						#
alias gpull='git pull origin master'					#
alias gpush='git push origin master'					#
									#
#Load some files							#
alias run='sh /home/blackdracula/.alias'				#
									#
#Packages 								#
alias install='yay -S'							#
alias remove='yay -Rd'							#
alias update='yay -Syu'							#
alias orphan='yay -Rd $(yay -Qtdq)'					#
alias space='yay -Scc'							#
									#
#Ease life								#
alias ..='cd ..'							#
alias ...='cd ../..'							#
alias home='cd'								#
									#
#Studies								#
alias study='cd /home/blackdracula/Notes/Sem'				#
									#
##############################ALIAS######################################

PS1='[\u@\h \W]\$ '

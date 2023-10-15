# automatically run startx when logging in on tty1

export LESS='--mouse --wheel-lines=3'

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
   startx
fi

# keyboard related stuff
xset r rate 250 50

#!/bin/bash

if pgrep -x "spotify" > /dev/null
then
    STATUS=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus'|egrep -A 1 "string"|cut -b 26-|cut -d '"' -f 1)

    ARTIST=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 \
            org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' \
            string:'Metadata' |\
            awk -F 'string "' '/string|array/ {printf "%s",$2; next}{print ""}' |\
            awk -F '"' '/artist/ {print $2}')

   SONG=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 \
            org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' \
            string:'Metadata' |\
            awk -F 'string "' '/string|array/ {printf "%s",$2; next}{print ""}' |\
            awk -F '"' '/title/ {print $2}' | sed -e 's/([^()]*)//g' | cut -c 1-20 )

    [ "$STATUS" = "Playing" ] && echo "$SONG BY $ARTIST" || echo "$SONG BY $ARTIST"

    # mute the audio if an ad is playing(too broke for premium now)
    [ -z "$ARTIST" ] &&`pactl set-sink-mute 0 1` || `pactl set-sink-mute 0 0;`

else
    echo ""
fi

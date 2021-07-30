SINK=$( pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1 )

volume=`pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`

echo " $volume%"
#ramp-volume-1 =
#ramp-volume-2 =

#format-muted =0% 
#ramp-volume-0 =
#ramp-volume-1 =
#ramp-volume-2 =

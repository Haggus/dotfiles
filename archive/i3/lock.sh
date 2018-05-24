#!/bin/sh

BLANK='#00000000'  # blank
CLEAR='#282828aa'  # clear
CLEARER='#28282877'  # clearer
GREEN='#b8bb26ff'  # green
DARK_GREEN='#98971aff'  # dark green
TEXT='#ebdbb2ff'  # text
RED='#fb4934ff'  # red
YELLOW='#fabd2fff'  # yellow

i3lock \
--insidevercolor=$CLEAR \
--ringvercolor=$YELLOW \
\
--insidewrongcolor=$CLEAR \
--ringwrongcolor=$RED \
\
--insidecolor=$CLEAR \
--ringcolor=$GREEN \
--linecolor=$DARK_GREEN \
--separatorcolor=$CLEARER \
\
--verifcolor=$TEXT \
--wrongcolor=$TEXT \
--timecolor=$TEXT \
--datecolor=$TEXT \
--layoutcolor=$TEXT \
--keyhlcolor=$CLEARER \
--bshlcolor=$CLEARER \
\
--screen 1 \
--blur 5 \
--clock \
--indicator \
--timestr="%H:%M:%S" \
--datestr="%A, %m %Y" \
\
--veriftext="..." \
--wrongtext="</3" \

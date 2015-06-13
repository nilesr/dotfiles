#! /bin/bash 
enabled=
# Original code credit to:
# Dhananjay Sathe : dhananjaysathe@gmail.com
# http://dsathe.blogspot.com/
# Heavily adapted by Niles Rogoff
wide="file:///home/niles/Documents/mirror.jpg"
depth=2 # set as required
x=61
lockindex=0
bit=0
rm /tmp/background
mkfifo /tmp/background
monitor=0
lockbase="$HOME/Pictures/lock"
cat /tmp/background|while read f; do
	x=61
done &
function check() {
	echo Checking
	if test $(xrandr -q|grep -c ' connected') -eq 1; then
		return 0
	else
		return 1
	fi
}
check
function getpics() {
	find "$1" -maxdepth $depth -type f -iregex ".*\(jpg\|jpeg\|gif\|png\|bmp\)$"
}
monitor=$? # Set monitor to the return value of check
echo "$monitor"|tee ~/.wp-show/hack # See comment below
stdbuf -i0 -o0 udevadm monitor -k --env|grep --line-buffered -i HOTPLUG|while read -r line; do	
	echo "$line"
	if test "$monitor" -eq 0; then
		monitor=1
	else
		monitor=0
	fi
	sleep 5
	check
	monitor=$?
	# Because while runs in a subshell, I can't set the monitor variable globally
	# This is a hack
	echo "$monitor"|tee ~/.wp-show/hack
done &
while true; do
	if test "$monitor" -eq 0; then
		bit=0
		if test "$x" -ge 60; then
			x=0
			if test "$(date +%H|sed 's/^0//')" -le 4; then
				base="$HOME/Pictures/Morning"
			else
				base="$HOME/Pictures/dnd-Backgrounds"
			fi
			echo setting picture
			photo=$(getpics "$base" | shuf -n1)
			uri="file://$photo"
			DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.screensaver picture-options "scaled"
			DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.background picture-options "scaled"
			DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.background picture-uri "$uri"
			lockindex=$(($lockindex+1))
			lockindex=$(($lockindex%$(getpics "$lockbase"|wc -l)))
			lockscreen="file://"$(getpics "$lockbase"|head -n "$lockindex"|tail -n 1)
			DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.screensaver picture-uri "$lockscreen"
		fi
	else
		if test "$bit" == 0; then
			echo setting to wide picture
			DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.screensaver picture-options "spanned"
			DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.background picture-options "spanned"
			DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.screensaver picture-uri "$wide"
			DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.background picture-uri "$wide"
			x=60
			bit=1
		fi
	fi
	sleep 1
	monitor=$(cat ~/.wp-show/hack)
	#echo x: $x monitor: $monitor bit: $bit
	x=$(($x+1))
done


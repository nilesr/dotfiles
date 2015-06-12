#! /bin/bash 
enabled=
#Dhananjay Sathe : dhananjaysathe@gmail.com
#http://dsathe.blogspot.com/
wide="file:///home/niles/Documents/mirror.jpg"
depth=2 # set as required
x=61
bit=0
rm /tmp/background
mkfifo /tmp/background
monitor=0
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
			if test "$(date +%H|sed 's/^0//')" -le 6; then
				base="$HOME/Pictures/Morning"
			else
				base="$HOME/Pictures/Backgrounds"
			fi
			echo setting picture
			photo=$(find "$base" -maxdepth $depth -iregex ".*\(jpg\|jpeg\|gif\|png\|bmp\)$" -type f | shuf -n1)
			uri="file://$photo"
			DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.screensaver picture-options "scaled"
			DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.background picture-options "scaled"
			DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.background picture-uri "$uri"
			if test $(date +%M|sed 's/^0//') -lt 20; then
				lockscreen="file:///home/niles/Documents/lock.jpg"
			elif test $(date +%M|sed 's/^0//') -lt 40; then
				lockscreen="file:///home/niles/Documents/lock2.jpg"
			else
				lockscreen="file:///home/niles/Documents/lock3.fixed.jpg"
			fi
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


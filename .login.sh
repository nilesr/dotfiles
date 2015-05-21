#!/usr/bin/env bash
sudo journalctl -f|grep --line-buffered "gkr-pam: unlocked login keyring"|grep --line-buffered -v gnome-session|while read line; echo "$line"; do gst-launch-0.10 playbin uri=file:///usr/share/sounds/KDE-Sys-App-Error-Critical.ogg; done

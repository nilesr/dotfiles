#!/usr/bin/env bash
function printnum {
    tput setaf 5; echo -n "["; tput setaf 6; echo -n "$1"; tput setaf 5; echo -n "] "; tput setaf 3; echo "$2"
}
i=0
printnum 0 Spice-Birch
printnum 1 Silver-Birch
printnum 2 Archbishop
printnum 3 Ubuntubishop
tput sgr0
read -n 1 -p "Select: " choice
if test "$choice" -lt 9 &> /dev/null; then
    echo
fi
case "$choice" in 
    0)
        ssh root@niles.mooo.com -p 24
        ;;
    1)
        ssh root@niles.mooo.com -p 23
        ;;
    2)
        ssh root@10.8.0.3
        ;;
    3)
        :
        ;;
    *)
        read rest
        read -p "Username: " user
        total="$user"@$choice"$rest"
        ssh $total
        ;;
esac
if test 0 -eq "$?"; then
    exit 0
fi
echo # Force a newline
read -n 1 -p "Terminal closed improperly. Press any key to exit"

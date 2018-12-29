# Machine specific instructions, not on dotfiles repo
test -f "$HOME"/.fishrc; and source "$HOME"/.fishrc
if grep --version|grep -q 'GNU grep' ^/dev/null
	alias grep="grep -P --color=always"
else
	# BSD grep doesn't like -P
	alias grep="grep --color=always"
end

# Solarized Dark 256 dircolors
setenv LS_COLORS 'no=00;38;5;244:rs=0:di=00;38;5;33:ln=00;38;5;37:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:ex=00;38;5;64:*.tar=00;38;5;61:*.tgz=00;38;5;61:*.arj=00;38;5;61:*.taz=00;38;5;61:*.lzh=00;38;5;61:*.lzma=00;38;5;61:*.tlz=00;38;5;61:*.txz=00;38;5;61:*.zip=00;38;5;61:*.z=00;38;5;61:*.Z=00;38;5;61:*.dz=00;38;5;61:*.gz=00;38;5;61:*.lz=00;38;5;61:*.xz=00;38;5;61:*.bz2=00;38;5;61:*.bz=00;38;5;61:*.tbz=00;38;5;61:*.tbz2=00;38;5;61:*.tz=00;38;5;61:*.deb=00;38;5;61:*.rpm=00;38;5;61:*.jar=00;38;5;61:*.rar=00;38;5;61:*.ace=00;38;5;61:*.zoo=00;38;5;61:*.cpio=00;38;5;61:*.7z=00;38;5;61:*.rz=00;38;5;61:*.apk=00;38;5;61:*.gem=00;38;5;61:*.jpg=00;38;5;136:*.JPG=00;38;5;136:*.jpeg=00;38;5;136:*.gif=00;38;5;136:*.bmp=00;38;5;136:*.pbm=00;38;5;136:*.pgm=00;38;5;136:*.ppm=00;38;5;136:*.tga=00;38;5;136:*.xbm=00;38;5;136:*.xpm=00;38;5;136:*.tif=00;38;5;136:*.tiff=00;38;5;136:*.png=00;38;5;136:*.PNG=00;38;5;136:*.svg=00;38;5;136:*.svgz=00;38;5;136:*.mng=00;38;5;136:*.pcx=00;38;5;136:*.dl=00;38;5;136:*.xcf=00;38;5;136:*.xwd=00;38;5;136:*.yuv=00;38;5;136:*.cgm=00;38;5;136:*.emf=00;38;5;136:*.eps=00;38;5;136:*.CR2=00;38;5;136:*.ico=00;38;5;136:*.tex=00;38;5;245:*.rdf=00;38;5;245:*.owl=00;38;5;245:*.n3=00;38;5;245:*.ttl=00;38;5;245:*.nt=00;38;5;245:*.torrent=00;38;5;245:*.xml=00;38;5;245:*Makefile=00;38;5;245:*Rakefile=00;38;5;245:*Dockerfile=00;38;5;245:*build.xml=00;38;5;245:*rc=00;38;5;245:*1=00;38;5;245:*.nfo=00;38;5;245:*README=00;38;5;245:*README.txt=00;38;5;245:*readme.txt=00;38;5;245:*.md=00;38;5;245:*README.markdown=00;38;5;245:*.ini=00;38;5;245:*.yml=00;38;5;245:*.cfg=00;38;5;245:*.conf=00;38;5;245:*.c=00;38;5;245:*.cpp=00;38;5;245:*.cc=00;38;5;245:*.sqlite=00;38;5;245:*.go=00;38;5;245:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.lof=00;38;5;240:*.lol=00;38;5;240:*.lot=00;38;5;240:*.out=00;38;5;240:*.toc=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*~=00;38;5;240:*#=00;38;5;240:*.part=00;38;5;240:*.incomplete=00;38;5;240:*.swp=00;38;5;240:*.tmp=00;38;5;240:*.temp=00;38;5;240:*.o=00;38;5;240:*.pyc=00;38;5;240:*.class=00;38;5;240:*.cache=00;38;5;240:*.aac=00;38;5;166:*.au=00;38;5;166:*.flac=00;38;5;166:*.mid=00;38;5;166:*.midi=00;38;5;166:*.mka=00;38;5;166:*.mp3=00;38;5;166:*.mpc=00;38;5;166:*.ogg=00;38;5;166:*.ra=00;38;5;166:*.wav=00;38;5;166:*.m4a=00;38;5;166:*.axa=00;38;5;166:*.oga=00;38;5;166:*.spx=00;38;5;166:*.xspf=00;38;5;166:*.mov=00;38;5;166:*.MOV=00;38;5;166:*.mpg=00;38;5;166:*.mpeg=00;38;5;166:*.m2v=00;38;5;166:*.mkv=00;38;5;166:*.ogm=00;38;5;166:*.mp4=00;38;5;166:*.m4v=00;38;5;166:*.mp4v=00;38;5;166:*.vob=00;38;5;166:*.qt=00;38;5;166:*.nuv=00;38;5;166:*.wmv=00;38;5;166:*.asf=00;38;5;166:*.rm=00;38;5;166:*.rmvb=00;38;5;166:*.flc=00;38;5;166:*.avi=00;38;5;166:*.fli=00;38;5;166:*.flv=00;38;5;166:*.gl=00;38;5;166:*.m2ts=00;38;5;166:*.divx=00;38;5;166:*.webm=00;38;5;166:*.axv=00;38;5;166:*.anx=00;38;5;166:*.ogv=00;38;5;166:*.ogx=00;38;5;166:'

# Ignore duplicate commands and commands starting with a space
set HISTCONTROL 'ignoreboth'
function irc
	toilet --gay -t -f mono9 --irc $argv|head -n 6|tail -n 5|xsel -b
	echo copied "$argv" to clipboard, 5 lines
end
function bigtwitch
	toilet -t -f mono9 "$argv"|head -n 6|sed 's/ /░/g;'|head -n 6
	toilet -t -f mono9 "$argv"|head -n 6|sed 's/ /░/g;'|head -n 6|xsel -b
end
function twitch
	echo (toilet -t -f pagga "$argv"|head -n 1|sed 's/./░/g;'|head -n 6) (toilet -t -f pagga "$argv"|sed 's/ /░/g;'|head -n 6)|xsel -b
	echo (toilet -t -f pagga "$argv"|head -n 1|sed 's/./░/g;'|head -n 6) (toilet -t -f pagga "$argv"|sed 's/ /░/g;'|head -n 6)|tr ' ' '\n'
end

function color
	set colors "110 192 190 180 140 65 10 25 30 95 105 135 210 225"
	set len (echo $colors|wc -w)
	echo $colors | cut -d ' ' -f (math (math (random) \% $len) + 1)
end
function str_repeat
	for i in (seq $argv[2])
		set result "$result""$argv[1]"
	end
	echo -n "$result"
end
function display
	if test (count $argv) -gt 1
		tput sc
	end
	tput setaf (color)
	set cols (tput cols)
	#tput cup $line (math (tput cols) - (echo "$argv"|python3 -c 'import sys; print(len(sys.stdin.read()))') + 1)
	#tput cup $line (math $cols - (echo "$argv"|wc -c) + 1)
	str_repeat " " (math $cols - (echo "$argv[1]"|wc -c) + 1)
	echo $argv[1]
	tput sgr0
	if test (count $argv) -gt 1
		tput rc
		echo "$argv[2]"
	end
	#set line (math $line + 1)
end
function weather
	if test "$online" = "false"
		return
	end
	#set destination ""
	#set destination "24061" # Blacksburg
	set destination "seattle"
	#if test (echo "$argv" | wc -c) -gt 1;
	if not test -z "$argv[1]";
		set destination $argv
	end
	curl -s wttr.in/$destination|head -n 17
end
function alert
	if test "$online" = "false"
		return
	end
	# We need all these headers because otherwise it comes out garbled, some encoding error or something. We probably only need the Accept header because that specifies latin 1 or utf-8 as valid encodings, but I'm keeping them all just in case
	set level (curl -s 'https://isc.sans.edu/infocon.txt' -H 'Host: isc.sans.edu' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:48.0) Gecko/20100101 Firefox/48.0' -H 'Accept: text/html, */* ISO-8859-1,utf-8;q=0.7,*;q=0.7 gzip,deflate en- us,en;q=0.5' -H 'Accept-Language: en' --compressed -H 'Referer: https://isc.sans.edu/infocon.html' -H 'Connection: close' -H 'Upgrade-Insecure-Requests: 1'); or return
	echo "$level" > /tmp/alert
	if not test -z "$level"; and test "$level" != "green";
		toilet -t -f mono9 Infocon $level
	else
		display "ISC $level"
	end
end
#ps aux|grep -v grep|grep -v root|grep -q vmstat; or nohup bash -c 'touch /tmp/cpu; ( vmstat 2|stdbuf -oL awk \'{print 100-$15}\'|while read line; do echo "$line"|tee /tmp/cpu ;done)& disown' > /dev/null &
# make these global
#set line 0
set online true
function has_default_route
	if uname|grep -q Darwin # if we're on mac
		route get 8.8.8.8 | grep -q gateway # untested
	else # if we're in a sane environment
		route -n|grep -q '^0.0.0.0'
	end
end
function login_message
	# ghetto as fuck, just check if there's a defeault route
	#if route|grep -iq default;
	if has_default_route
		set online true
	else
		set online false
	end
	# Print cpu usage
	#printf '%s ' (cat /tmp/cpu)
	# print ram usage
	if which free >/dev/null ^/dev/null # mac doesn't have the free command
		set statline (math (free|grep Mem|awk '{print "100*"$3"/"$2}'))
	end
	# Print disk usage
	set statline "$statline "( df -h / /home|tail -n 2|awk '{print $5}'|tr -d '%'|tr '\n' ' ')
	# Display users on login
	set statline "$statline"(who -q|head -n 1|tr ' ' '\n'|sort|uniq -c|awk '{print $2 ": " $1 " " }' | tr '\n' ' ')
	# Display first line of todo list on login if it exists
	set todo $HOME"/Documents/todo/todo.txt"
	if test -e $todo;
		set temp (head -n 1 $todo ^/dev/null)
	else
		set temp (hostname)
	end
	#set line 0
	display "$temp" "$statline"
	test -e ~/.image.txt; or touch ~/.image.txt ~/.noimage
	if not test -e .noimage
		set temp (math (stat ~/.image.txt |grep Modify|cut -d " " -f 2|cut -d "-" -f 3) - (date +%d)|tr -d '-')
		if test $temp -ge 3
			#set image (cat ~/.image.txt)
			#display "$image"
		end
	end
	# If the date has changed since the last login
	for file in date hour alert;
		if not test -e /tmp/$file; 
			touch /tmp/$file
			chmod 777 /tmp/$file ^/dev/null
		end
	end
	set newdate false
	set newhour false
	if not test (date +%x) = (cat /tmp/date) ^/dev/null
		set newdate true
		date +%x > /tmp/date
	end
	if not test (date +%H) = (cat /tmp/hour) ^/dev/null
		set newhour true
		date +%H > /tmp/hour
	end
	set alerted false
	if not test green = (cat /tmp/alert) ^/dev/null
		alert
		set alerted true
	end
	if test "$newhour" = "true";
		if test "$alerted" = "false"; 
			alert
		end
	end
	cat /etc/resolv.conf|grep -v 127.0.0.1|grep -v '^#.*'|grep -iq nameserver; and display "NON-LOCAL NAMESERVERS"
	if test "$newdate" = "true"; 
		weather
	end
	sudo iptables -nL OUTPUT|grep "udp dpt:53"|grep -q "DROP"; or display "IPTABLES RULES INCORRECT"
	if test -d ~/.local/share/rr
		set size_in_kb (du -s ~/.local/share/rr | cut -f 1)
		if test "$size_in_kb" -ge 10240 # 10.0MB I think
			set hrsize (du -sh ~/.local/share/rr | cut -f 1)
			display "~/.local/share/rr now taking up $hrsize"
		end
	end
end

# Set locale, workaround for arch linux
set --global --export LANG en_US.UTF-8
# Remove the "friendly" (dumb) fish greeting
set fish_greeting ''
# Set termcap
set --global --export TERM xterm-256color
# Always run tmux in 256color mode
alias tmux tmux\ -2
# Always run sbcl inside rlwrap and without the header
alias sbcl "rlwrap sbcl --noinform --load ~/.quicklisp/setup.lisp"
# Never put single quotes around names with spaces in them
#alias ls='ls --quoting-style=literal'


function fuck-resolvconf
	nmcli n off
	nmcli n on
end

alias ptpy="ptpython --vi"
alias f=fg

#eval (lesspipe|while read line; echo "$line"|tr '=' ' '|sed 's/export/set -x/'; end)
set -x fish_color_normal ""
set -x fish_color_command 878787 grey
set -x fish_color_quote 40a040 green
set -x fish_color_redirection normal
set -x fish_color_end ""
#set -x fish_color_error red --bold
set -x fish_color_error red
set -x fish_color_param 878787 grey
set -x fish_color_comment 878787 grey
set -x fish_color_match 878787 grey
set -x fish_color_search_match yellow
set -x fish_color_operator 878787 grey
set -x fish_color_escape 878787 grey
set -x fish_color_cwd green
set -x fish_pager_color_prefix 878787 grey
set -x fish_pager_color_completion normal
set -x fish_pager_color_description 555 yellow
set -x fish_pager_color_progress red
set -x fish_pager_color_secondary ""

set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x LC_NUMERIC en_US.UTF-8
set -x LC_TIME en_US.UTF-8
set -x LC_COLLATE en_US.UTF-8
set -x LC_MONETARY en_US.UTF-8
set -x LC_MESSAGES en_US.UTF-8
set -x LC_PAPER en_US.UTF-8
set -x LC_NAME en_US.UTF-8
set -x LC_ADDRESS en_US.UTF-8
set -x LC_TELEPHONE en_US.UTF-8
set -x LC_MEASUREMENT en_US.UTF-8
set -x LC_IDENTIFICATION en_US.UTF-8
set -x LC_ALL en_US.UTF-8


alias ping=ping\ -s\ 8\ -i.2
function read_confirm
	while true
		read -p 'echo "This will delete a source file. Sure? (y/n):"' -l confirm
		switch $confirm
			case Y y
				return 0
			case '' N n
				return 1
		end
	end
end
function rm
	if echo $argv | grep -Piq '.*\.sh|.*\.py|.*\.c|.*\.h|.*\.java|.*\.rb|.*\.html|.*\.css|.*\.js|.*\.pl|.*\.erl'
		read_confirm; and /usr/bin/env rm -iv $argv
	else
		/usr/bin/env rm -v $argv
	end
end
alias putty=~/.putty.sh
alias proxy=~/.proxy.sh
alias :q exit
if test -f /tmp/brokevim
	alias vim="vim -X" # This fixes the XMSP Init bug (_IceTransSocketINETConnect() no usable address for _______)
	# Unfortunately it also breaks vim yank/paste using the X11 keyboard
end
alias :e vim
alias vi=vim

function image
	set count (find ~/Pictures -maxdepth 1 -type f|wc -l)
	set count (math (random) '%' $count)
	find ~/Pictures -maxdepth 1 -type f|head -n $count|tail -n 1 | cut -d "/" -f 5 |tee ~/.image.txt
end

function ensure_msd
	if not test -f ~/.ssh/id_rsa
		test -e ~/.bin/msd; and msd
	end
end

function commit
	#ensure_msd
	git add -A :/
	git commit -am "$argv"
end
function rb
	if test "$argv" = "root"
		git rebase --interactive --root
	else if not test -z "$argv"
		git rebase --interactive HEAD~"$argv"
	else
		git rebase --interactive HEAD~3
	end
end
alias todo "vi ~/Documents/todo/todo.txt"
function destroy
	if test -z "$argv"
		echo "Safety kicking in, not recursively shredding the current working directory. Please specify path(s) as arguments"
		return
	end
	echo "This will permenantly erase files. Press enter to confirm, or Ctrl+C to cancel"
	read nothing
	find "$argv" -type f -print0|xargs -0 shred -vfuz
	/usr/bin/env rm -rf "$argv"
end

function viopen
	sudo vi /etc/NetworkManager/system-connections/open
	echo "Restart network manager? Enter to continue"
	read nothing
	sudo systemctl restart NetworkManager
	echo "Bring connection open up? Enter to continue"
	read nothing
	nmcli n on; nmcli c up open
	echo "Up, waiting for default route"
	set online false
	while test "$online" = "false"; 
		sleep 1
		has_default_route; and set online true
	end
	echo "default route acquired, attempting to resolve hosts"
	# if we can resolve names and ping out, we're done
	sudo iptables -D OUTPUT --proto udp --dport 53 -j DROP
	host -W 2 niles.xyz; and return
	sudo iptables -A OUTPUT --proto udp --dport 53 -j DROP
	#echo "We were unable to resolve a host, can we ping out?"
	#ping -c 1 -W 2 8.8.8.8; and return
	echo "We can't ping out. Probably need to accept terms and conditions on the router"
	echo "Swap dnscrypt for 8.8.8.8 and default route? Enter to continue"
	read nothing
	#sudo systemctl stop dnscrypt; sudo systemctl start dnsmasq
	# this doesn't work on mac beacuse it uses BSD route instead of the normal one, but there's no NetworkManager on mac so who cares
	echo nameserver (route -n|grep '^0.0.0.0'|awk '{print $2}') | sudo tee /etc/resolv.conf
	echo nameserver 8.8.8.8 | sudo tee -a /etc/resolv.conf > /dev/null # -a for append
	echo nameserver 127.0.0.1 | sudo tee -a /etc/resolv.conf > /dev/null # this is useless now because I don't use dnsmasq anymore
	sudo iptables -F OUTPUT
	open http://gstatic.com/generate_204 >/dev/null ^/dev/null
	echo "Swap back after authenticating? Enter to continue"
	read nothing
	sudo systemctl stop dnsmasq
	brokedns # will start dnscrypt@{1..4}, unbound
	sudo iptables -I OUTPUT --dest 127.0.0.1 -j ACCEPT
	sudo iptables -A OUTPUT --proto udp --dport 53 -j DROP
	echo nameserver 127.0.0.1 | sudo tee /etc/resolv.conf # no -a to overwrite the file
	
end

alias watch='watch --color'
function promise
	eval $argv
	set ret $status
	while true
		sleep 1
		eval $argv
		if not test $status = $ret
			break
		end
	end
end

function timestamp
	eval $argv|while read line; printf "%s " (date); echo $line; end
end

# NILES THIS FIXES LYX DON'T FUCKING TOUCH IT
set -x --global QT_QPA_PLATFORMTHEME qt5ct

function kssh # even .2 seconds is somethimes still to short
	kopen; sleep .2; ssh $argv
end
function kopen # open ssh port on niles.xyz via port knocking
	ensure_msd
	knock niles.xyz {(cat ~/.ssh/open)} -d 10
end
function pingw # ping gateway -> ping gw -> pingw
	set gw (route -n|grep '^0\.0\.0\.0'|awk '{print $2}')
	if test "$gw" = "";
		echo "No gateway"
		return
	end
	ping "$gw" $argv
end

# for the occasional times where my mouse won't work
alias m="xdotool mousemove --"
alias mr="xdotool mousemove_relative --"

function brc-wrap
	if test (count $argv) -le 1
		brc $argv[1] fish
	else
		brc $argv
	end
end
function strat-wrap # brc was renamed to strat in Bedrock Linux 0.7 Poki
	if test (count $argv) -le 1
		strat $argv[1] fish
	else
		strat $argv
	end
end

if test -d /bedrock
	if test -e /bedrock/sbin/brn; and grep -qi nyla /bedrock/sbin/brn; # Bedrock Linux 1.0beta2 Nyla
		for strata in (bri -L)
			if test -z (bri -c $strata init)
				#it's not a *real* strata
				continue
			end
			alias $strata "brc-wrap $strata"
			# so "jessie gcc --version" becomes "brc-wrap jessie gcc --version" which becomes "brc jessie gcc --version"
			# but "jessie" becomes "brc-wrap jessie" which becomes "brc jessie fish"
		end
	else # Bedrock Linux 0.7 Poki or higher
		for strata in /bedrock/run/enabled_strata/*
			alias (basename $strata) "strat-wrap $strata"
		end
	end

	if test -e /bedrock/sbin/brn; and grep -qi nyla /bedrock/sbin/brn; # Bedrock Linux 1.0beta2 Nyla
		set -x PATH $PATH /bedrock/bin /bedrock/sbin /bedrock/brpath/pin/bin /bedrock/brpath/pin/sbin /bedrock/brpath/bin /bedrock/brpath/sbin
	else # Bedrock Linux 0.7 Poki or higher
		set -x PATH $PATH /bedrock/bin /bedrock/cross/pin/bin /bedrock/cross/bin
	end
end

alias open xdg-open

function push
	if pwd|grep -qi odk\|tables\|services\|survey\|android\|app-designer
		echo "In ODK folder, only pushing to origin"
		git push --all origin
	else
		for server in (git remote)
			#git push "$server" (git branch --color=never|grep --color=never '^\*'|cut -c 3-)
			git push --all "$server"
		end
	end
end
alias pull git\ pull
function brokevim
	touch /tmp/brokevim
	alias vim="vim -X"
end
function brokeadb
	sudo adb kill-server
	sudo adb start-server
end
alias htop "env TERM=screen htop"

set -x PATH $PATH /sbin /usr/sbin /usr/local/sbin /usr/local/bin

alias jsc "rlwrap jsc"

set -x --global EDITOR vim
set -x --global EDIT vim

function disown
	bash -c "($argv) "'&>/dev/null & disown'
end

# ``no6 1'' to disable ipv6, no6 0 to go back
function nov6
	sudo sysctl -w net.ipv6.conf.all.disable_ipv6="$argv"
	sudo sysctl -w net.ipv6.conf.default.disable_ipv6="$argv"
end
alias no6 nov6

#function brokedns
	#if not ping -c 1 8.8.8.8 > /dev/null
		#echo "No internet connection"
		#return
	#end
	#set resolvers d0wn-us-ns1 d0wn-us-ns2 d0wn-us-ns4 fvz-anytwo
	#set resolver (random choice $resolvers)
	#echo "Setting resolver to $resolver"
	#sudo sed -i 's/ResolverName .*/ResolverName '"$resolver"'/g' /etc/dnscrypt-proxy.conf
	#sudo systemctl restart dnscrypt
	#host google.com localhost; or brokedns
	#echo Done
#end
function brokedns
	for service in unbound "dnscrypt@1" "dnscrypt@2" "dnscrypt@3" "dnscrypt@4"
		sudo systemctl restart "$service"
	end
end



if test -t 0
	if status --is-interactive
		alias clear='/usr/bin/clear; login_message'
		function fish_prompt
			env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status JOBS=(jobs|wc -l) STATUS=$status bash ~/.shell_prompt.sh left
		end
		function fish_right_prompt
			env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.shell_prompt.sh right
		end
		function moron # For use in public. Combine with a white theme with non-monospaced black text background
			function fish_prompt
				env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status JOBS=(jobs|wc -l) STATUS=$status bash ~/.shell_prompt.sh moron
			end
			function fish_right_prompt
			end
			set -x fish_color_error black
			set -x fish_color_param black
			set -x fish_color_comment black
			set -x fish_color_match black
			set -x fish_color_search_match black
			set -x fish_color_operator black
			set -x fish_color_escape black
			set -x fish_color_cwd black
			set -x fish_pager_color_prefix black
			set -x fish_pager_color_completion black
			set -x fish_pager_color_description black
			set -x fish_pager_color_progress black
			set -x fish_pager_color_secondary ""
			alias ls=ls\ --color=never
			function clear
				/usr/bin/env clear
			end
			function login_message
				clear
			end
			clear
		end
		login_message
	end
end
alias journalctl "env SYSTEMD_PAGER=less journalctl"
alias systemctl  "env SYSTEMD_PAGER=cat systemctl --no-pager -l"

set -x --global RUBYOPT "-w"
alias rerun "env RUBYOPT=-w rerun" # TODO is this still needed?
function lm2
	# depends on lm2.json being in the cwd
	cd ~/Documents/projects/js/lainmod
	python3 lm2.py
	cd -
end
alias tcl "rlwrap tclsh"

if test -e ~/Documents/projects/Python/vote.py
	set last 0
	if test -e ~/.last_vote
		set last (cat ~/.last_vote|cut -d . -f 1)
	end
	set now (date +%s)
	if test (math $now - $last) -gt (math '60 * 60 * 12')
		display "Invoking vote.py in the background"
		bash -c 'python3 ~/Documents/projects/Python/vote.py &> /tmp/vote.log & disown'
	else
		#set nextvote (math $last + (math '60 * 60 * 12') - $now)
		#set hrs (math (math $nextvote / 60) / 60)
		#set mins (math (math $nextvote / 60) '%' 60)
		#display "Next vote in $hrs:$mins"
	end
end

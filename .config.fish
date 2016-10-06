# Prompt
alias grep=/usr/bin/grep\ -P\ --color=always
if test -t 0
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

end

# Solarized Dark 256 dircolors
setenv LS_COLORS 'no=00;38;5;244:rs=0:di=00;38;5;33:ln=00;38;5;37:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:ex=00;38;5;64:*.tar=00;38;5;61:*.tgz=00;38;5;61:*.arj=00;38;5;61:*.taz=00;38;5;61:*.lzh=00;38;5;61:*.lzma=00;38;5;61:*.tlz=00;38;5;61:*.txz=00;38;5;61:*.zip=00;38;5;61:*.z=00;38;5;61:*.Z=00;38;5;61:*.dz=00;38;5;61:*.gz=00;38;5;61:*.lz=00;38;5;61:*.xz=00;38;5;61:*.bz2=00;38;5;61:*.bz=00;38;5;61:*.tbz=00;38;5;61:*.tbz2=00;38;5;61:*.tz=00;38;5;61:*.deb=00;38;5;61:*.rpm=00;38;5;61:*.jar=00;38;5;61:*.rar=00;38;5;61:*.ace=00;38;5;61:*.zoo=00;38;5;61:*.cpio=00;38;5;61:*.7z=00;38;5;61:*.rz=00;38;5;61:*.apk=00;38;5;61:*.gem=00;38;5;61:*.jpg=00;38;5;136:*.JPG=00;38;5;136:*.jpeg=00;38;5;136:*.gif=00;38;5;136:*.bmp=00;38;5;136:*.pbm=00;38;5;136:*.pgm=00;38;5;136:*.ppm=00;38;5;136:*.tga=00;38;5;136:*.xbm=00;38;5;136:*.xpm=00;38;5;136:*.tif=00;38;5;136:*.tiff=00;38;5;136:*.png=00;38;5;136:*.PNG=00;38;5;136:*.svg=00;38;5;136:*.svgz=00;38;5;136:*.mng=00;38;5;136:*.pcx=00;38;5;136:*.dl=00;38;5;136:*.xcf=00;38;5;136:*.xwd=00;38;5;136:*.yuv=00;38;5;136:*.cgm=00;38;5;136:*.emf=00;38;5;136:*.eps=00;38;5;136:*.CR2=00;38;5;136:*.ico=00;38;5;136:*.tex=00;38;5;245:*.rdf=00;38;5;245:*.owl=00;38;5;245:*.n3=00;38;5;245:*.ttl=00;38;5;245:*.nt=00;38;5;245:*.torrent=00;38;5;245:*.xml=00;38;5;245:*Makefile=00;38;5;245:*Rakefile=00;38;5;245:*Dockerfile=00;38;5;245:*build.xml=00;38;5;245:*rc=00;38;5;245:*1=00;38;5;245:*.nfo=00;38;5;245:*README=00;38;5;245:*README.txt=00;38;5;245:*readme.txt=00;38;5;245:*.md=00;38;5;245:*README.markdown=00;38;5;245:*.ini=00;38;5;245:*.yml=00;38;5;245:*.cfg=00;38;5;245:*.conf=00;38;5;245:*.c=00;38;5;245:*.cpp=00;38;5;245:*.cc=00;38;5;245:*.sqlite=00;38;5;245:*.go=00;38;5;245:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.lof=00;38;5;240:*.lol=00;38;5;240:*.lot=00;38;5;240:*.out=00;38;5;240:*.toc=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*~=00;38;5;240:*#=00;38;5;240:*.part=00;38;5;240:*.incomplete=00;38;5;240:*.swp=00;38;5;240:*.tmp=00;38;5;240:*.temp=00;38;5;240:*.o=00;38;5;240:*.pyc=00;38;5;240:*.class=00;38;5;240:*.cache=00;38;5;240:*.aac=00;38;5;166:*.au=00;38;5;166:*.flac=00;38;5;166:*.mid=00;38;5;166:*.midi=00;38;5;166:*.mka=00;38;5;166:*.mp3=00;38;5;166:*.mpc=00;38;5;166:*.ogg=00;38;5;166:*.ra=00;38;5;166:*.wav=00;38;5;166:*.m4a=00;38;5;166:*.axa=00;38;5;166:*.oga=00;38;5;166:*.spx=00;38;5;166:*.xspf=00;38;5;166:*.mov=00;38;5;166:*.MOV=00;38;5;166:*.mpg=00;38;5;166:*.mpeg=00;38;5;166:*.m2v=00;38;5;166:*.mkv=00;38;5;166:*.ogm=00;38;5;166:*.mp4=00;38;5;166:*.m4v=00;38;5;166:*.mp4v=00;38;5;166:*.vob=00;38;5;166:*.qt=00;38;5;166:*.nuv=00;38;5;166:*.wmv=00;38;5;166:*.asf=00;38;5;166:*.rm=00;38;5;166:*.rmvb=00;38;5;166:*.flc=00;38;5;166:*.avi=00;38;5;166:*.fli=00;38;5;166:*.flv=00;38;5;166:*.gl=00;38;5;166:*.m2ts=00;38;5;166:*.divx=00;38;5;166:*.webm=00;38;5;166:*.axv=00;38;5;166:*.anx=00;38;5;166:*.ogv=00;38;5;166:*.ogx=00;38;5;166:'

# Ignore duplicate commands and commands starting with a space
set HISTCONTROL 'ignoreboth'
# Display todo item
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
	echo $colors |awk '{print $'(bash -c 'echo $(($(($RANDOM%'$len'))+1))')'}'
end
function display
    set level (echo $argv|awk '{print $1}')
    set temp (echo "$argv"|cut -c 3-)
    tput setaf (color)
    tput cup $level (math (tput cols) - (echo "$temp"|wc -c) + 1)
    echo $temp
    tput sgr0
end
function weather
    curl -s wttr.in/24061|head -n 17
end
function alert
    # We need all these headers because otherwise it comes out garbled, some encoding error or something. We probably only need the Accept header because that specifies latin 1 or utf-8 as valid encodings, but I'm keeping them all just in case
    set level (curl -s 'https://isc.sans.edu/infocon.txt' -H 'Host: isc.sans.edu' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:48.0) Gecko/20100101 Firefox/48.0' -H 'Accept: text/html, */* ISO-8859-1,utf-8;q=0.7,*;q=0.7 gzip,deflate en- us,en;q=0.5' -H 'Accept-Language: en' --compressed -H 'Referer: https://isc.sans.edu/infocon.html' -H 'Connection: close' -H 'Upgrade-Insecure-Requests: 1'); or return
    echo "$level" > /tmp/alert
    chmod 777 /tmp/alert
    if not test -z "$level"; and test "$level" != "green";
        toilet -t -f mono9 ALERT LEVEL $level
    else
        display $argv Alert Level $level
    end
end
#ps aux|grep -v grep|grep -v root|grep -q vmstat; or nohup bash -c 'touch /tmp/cpu; ( vmstat 2|stdbuf -oL awk \'{print 100-$15}\'|while read line; do echo "$line"|tee /tmp/cpu ;done)& disown' > /dev/null &
function login_message
	if test -t 0
		/usr/bin/clear
		# Print cpu usage
		#printf '%s ' (cat /tmp/cpu)
		# print ram usage
		set total (free|grep Mem|awk '{print $2}')
		set used (free|grep Mem|awk '{print $3}')
		printf '%s ' (echo 100\*$used/$total|bc)
		# Print disk usage
		printf "%s " ( df -h / /home|grep --color=never -P '/$|/home$'|sort|awk '{print $5}'|tr -d '%')
		# Display users on login
		who -q|head -n 1|tr ' ' '\n'|sort|uniq -c|awk '{print $2 ": " $1 " " }'|while read line; printf "%s" "$line"; end; echo
		set temp (head -n 1 ~/Documents/todo/todo.txt 2>/dev/null)
        set line 0
        display $line $temp
        set line (math $line + 1)
		# If the date has changed since the last login
		if not test -e /tmp/date; touch /tmp/date; end
		if not test -e /tmp/hour; touch /tmp/hour; end
        date +%H > /tmp/newhour
		date +%x > /tmp/newdate
		# Print the current weather
		diff /tmp/hour /tmp/newhour > /dev/null; or set newhour true;
		diff /tmp/date /tmp/newdate > /dev/null; or set newday true;
		chmod 777 /tmp/date
        touch /tmp/alert
        #if test x(cat /tmp/alert) != x"green"; # THIS DOESN'T WORK IF /tmp/alert IS EMPTY BECAUSE FISH SUCKS. It works in bash
        set lastalert (cat /tmp/alert)
        set alerted false
        if test "$lastalert" != "green";
            alert $line
            set line (math $line + 1)
            set alerted true
        end
        if test "$newhour" = "true";
            if test "$alerted" = "false"; 
                alert $line
                set line (math $line + 1)
                mv /tmp/newhour /tmp/hour
            end
        end
        if test "$newday" = "true"; 
            weather
            mv /tmp/newdate /tmp/date
        end
        cat /etc/resolv.conf|grep -v 127.0.0.1|grep -v '^#.*'|grep -iq nameserver; and display $line NON-LOCAL NAMESERVERS
        set line (math $line + 1)
	end
end
login_message
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
# Machine specific instructions, not on dotfiles repo
test -f "$HOME"/.fishrc; and source "$HOME"/.fishrc

set -x GOROOT /usr/lib/go
set -x GOPATH ~/.gocode
set -x GOBIN $GOPATH/bin
set -x PATH $PATH $GOROOT/bin $GOPATH/bin

set -x PATH $PATH ~/.bin

function fuck-resolvconf
	command nmcli n off
	command nmcli n on
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


alias ping=ping\ -s\ 8
alias clear='/usr/bin/clear; login_message'
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
	if echo $argv | grep -Piq '.*\.py|.*\.c|.*\.java|.*\.rb|.*\.html|.*\.css|.*\.js|.*\.pl'
		read_confirm; and /usr/bin/rm $argv
	else
		/usr/bin/rm $argv
	end
end
alias putty=~/.putty.sh
alias proxy=~/.proxy.sh
alias :q exit
alias :e vim
alias vi=vim

function image
    set count (find ~/Pictures -maxdepth 1 -type f|wc -l)
    set count (math (random) '%' $count)
    find ~/Pictures -maxdepth 1 -type f|head -n $count|tail -n 1 | tee ~/.image.txt
end

function commit
    git add -A
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
    echo "This will permenantly erase files. Press enter to confirm"
    read nothing
    find "$argv" -type f -print0|xargs -0 shred -vfuz
    /usr/bin/env rm -rf "$argv"
end


# NILES THIS FIXES LYX DON'T FUCKING TOUCH IT
set -x --global QT_QPA_PLATFORMTHEME qt5ct

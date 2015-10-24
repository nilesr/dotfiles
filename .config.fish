# in .config.fish
#
# Prompt
function fish_prompt
  env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status JOBS=(jobs|wc -l) bash ~/.shell_prompt.sh left
end

function fish_right_prompt
  env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.shell_prompt.sh right
end

# Solarized Dark 256 dircolors
setenv LS_COLORS 'no=00;38;5;244:rs=0:di=00;38;5;33:ln=00;38;5;37:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:ex=00;38;5;64:*.tar=00;38;5;61:*.tgz=00;38;5;61:*.arj=00;38;5;61:*.taz=00;38;5;61:*.lzh=00;38;5;61:*.lzma=00;38;5;61:*.tlz=00;38;5;61:*.txz=00;38;5;61:*.zip=00;38;5;61:*.z=00;38;5;61:*.Z=00;38;5;61:*.dz=00;38;5;61:*.gz=00;38;5;61:*.lz=00;38;5;61:*.xz=00;38;5;61:*.bz2=00;38;5;61:*.bz=00;38;5;61:*.tbz=00;38;5;61:*.tbz2=00;38;5;61:*.tz=00;38;5;61:*.deb=00;38;5;61:*.rpm=00;38;5;61:*.jar=00;38;5;61:*.rar=00;38;5;61:*.ace=00;38;5;61:*.zoo=00;38;5;61:*.cpio=00;38;5;61:*.7z=00;38;5;61:*.rz=00;38;5;61:*.apk=00;38;5;61:*.gem=00;38;5;61:*.jpg=00;38;5;136:*.JPG=00;38;5;136:*.jpeg=00;38;5;136:*.gif=00;38;5;136:*.bmp=00;38;5;136:*.pbm=00;38;5;136:*.pgm=00;38;5;136:*.ppm=00;38;5;136:*.tga=00;38;5;136:*.xbm=00;38;5;136:*.xpm=00;38;5;136:*.tif=00;38;5;136:*.tiff=00;38;5;136:*.png=00;38;5;136:*.PNG=00;38;5;136:*.svg=00;38;5;136:*.svgz=00;38;5;136:*.mng=00;38;5;136:*.pcx=00;38;5;136:*.dl=00;38;5;136:*.xcf=00;38;5;136:*.xwd=00;38;5;136:*.yuv=00;38;5;136:*.cgm=00;38;5;136:*.emf=00;38;5;136:*.eps=00;38;5;136:*.CR2=00;38;5;136:*.ico=00;38;5;136:*.tex=00;38;5;245:*.rdf=00;38;5;245:*.owl=00;38;5;245:*.n3=00;38;5;245:*.ttl=00;38;5;245:*.nt=00;38;5;245:*.torrent=00;38;5;245:*.xml=00;38;5;245:*Makefile=00;38;5;245:*Rakefile=00;38;5;245:*Dockerfile=00;38;5;245:*build.xml=00;38;5;245:*rc=00;38;5;245:*1=00;38;5;245:*.nfo=00;38;5;245:*README=00;38;5;245:*README.txt=00;38;5;245:*readme.txt=00;38;5;245:*.md=00;38;5;245:*README.markdown=00;38;5;245:*.ini=00;38;5;245:*.yml=00;38;5;245:*.cfg=00;38;5;245:*.conf=00;38;5;245:*.c=00;38;5;245:*.cpp=00;38;5;245:*.cc=00;38;5;245:*.sqlite=00;38;5;245:*.go=00;38;5;245:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.lof=00;38;5;240:*.lol=00;38;5;240:*.lot=00;38;5;240:*.out=00;38;5;240:*.toc=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*~=00;38;5;240:*#=00;38;5;240:*.part=00;38;5;240:*.incomplete=00;38;5;240:*.swp=00;38;5;240:*.tmp=00;38;5;240:*.temp=00;38;5;240:*.o=00;38;5;240:*.pyc=00;38;5;240:*.class=00;38;5;240:*.cache=00;38;5;240:*.aac=00;38;5;166:*.au=00;38;5;166:*.flac=00;38;5;166:*.mid=00;38;5;166:*.midi=00;38;5;166:*.mka=00;38;5;166:*.mp3=00;38;5;166:*.mpc=00;38;5;166:*.ogg=00;38;5;166:*.ra=00;38;5;166:*.wav=00;38;5;166:*.m4a=00;38;5;166:*.axa=00;38;5;166:*.oga=00;38;5;166:*.spx=00;38;5;166:*.xspf=00;38;5;166:*.mov=00;38;5;166:*.MOV=00;38;5;166:*.mpg=00;38;5;166:*.mpeg=00;38;5;166:*.m2v=00;38;5;166:*.mkv=00;38;5;166:*.ogm=00;38;5;166:*.mp4=00;38;5;166:*.m4v=00;38;5;166:*.mp4v=00;38;5;166:*.vob=00;38;5;166:*.qt=00;38;5;166:*.nuv=00;38;5;166:*.wmv=00;38;5;166:*.asf=00;38;5;166:*.rm=00;38;5;166:*.rmvb=00;38;5;166:*.flc=00;38;5;166:*.avi=00;38;5;166:*.fli=00;38;5;166:*.flv=00;38;5;166:*.gl=00;38;5;166:*.m2ts=00;38;5;166:*.divx=00;38;5;166:*.webm=00;38;5;166:*.axv=00;38;5;166:*.anx=00;38;5;166:*.ogv=00;38;5;166:*.ogx=00;38;5;166:'

# Ignore duplicate commands and commands starting with a space
set HISTCONTROL 'ignoreboth'
if test -t 0
	# Print disk usage
	printf "%s " (df -h|grep --color=never '/$'|awk '{print $5}'|tr -d '%')
	# Display users on login
	who -q|head -n 1|tr ' ' '\n'|uniq -c|awk '{print $2 ": " $1 " " }'|while read line; printf "%s" "$line"; end; echo
end
# Display todo item
function color
	set colors "110 192 190 180 140 65 10 25 30 95 105 135 210 225"
	set len (echo $colors|wc -w)
	echo $colors |awk '{print $'(bash -c 'echo $(($(($RANDOM%'$len'))+1))')'}'
end
if test -t 0
	tput setaf (color)
	head -n 1 ~/Documents/todo.txt 2>/dev/null
	tput sgr0
end
# Set locale, workaround for arch linux
set --global --export LANG en_US.UTF-8
# Remove the "friendly" (dumb) fish greeting
set fish_greeting ''
# Set termcap
set --global --export TERM xterm-256color
# Always run tmux in 256color mode
alias tmux tmux\ -2
alias sbcl "rlwrap sbcl --noinform"
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
set -x fish_color_command 809080 
set -x fish_color_quote 40a040 green
set -x fish_color_redirection normal
set -x fish_color_end ""
#set -x fish_color_error red --bold
set -x fish_color_error red
set -x fish_color_param 809080 
set -x fish_color_comment 809080 
set -x fish_color_match 809080 
set -x fish_color_search_match yellow
set -x fish_color_operator 809080 
set -x fish_color_escape 809080 
set -x fish_color_cwd green
set -x fish_pager_color_prefix 809080 
set -x fish_pager_color_completion normal
set -x fish_pager_color_description 555 yellow
set -x fish_pager_color_progress red
set -x fish_pager_color_secondary ""
function irc
	toilet --gay -t -f mono9 --irc $argv|head -n 6|tail -n 5|xsel -b
	echo copied "$argv" to clipboard, 5 lines
end

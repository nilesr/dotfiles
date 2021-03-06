#
# This shell prompt config file was created by promptline.vim
#
function __promptline_ps1 {
	echo "Please do not use this function"
	exit
	local slice_prefix slice_empty_prefix slice_joiner slice_suffix is_prompt_empty=1

	# section "a" header
	slice_prefix="${a_bg}${sep}${a_fg}${a_bg}${space}" slice_suffix="$space${a_sep_fg}" slice_joiner="${a_fg}${a_bg}${alt_sep}${space}" slice_empty_prefix="${a_fg}${a_bg}${space}"
	[ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
	# section "a" slices
	__promptline_wrapper "$(if [[ -n ${ZSH_VERSION-} ]]; then print %n; elif [[ -n ${FISH_VERSION-} ]]; then printf "%s" "$USER"; else printf "%s" \\u; fi )" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

	# section "c" header
	slice_prefix="${c_bg}${sep}${c_fg}${c_bg}${space}" slice_suffix="$space${c_sep_fg}" slice_joiner="${c_fg}${c_bg}${alt_sep}${space}" slice_empty_prefix="${c_fg}${c_bg}${space}"
	[ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
	# section "c" slices
	__promptline_wrapper "$(__promptline_cwd)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

	# section "y" header
	slice_prefix="${y_bg}${sep}${y_fg}${y_bg}${space}" slice_suffix="$space${y_sep_fg}" slice_joiner="${y_fg}${y_bg}${alt_sep}${space}" slice_empty_prefix="${y_fg}${y_bg}${space}"
	[ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
	# section "y" slices
	__promptline_wrapper "$(__promptline_vcs_branch)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }
	__promptline_wrapper "$(__promptline_git_status)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

	# close sections
	printf "%s" "${reset_bg}${sep}$reset$space"
}
function __promptline_vcs_branch {
	local branch
	local branch_symbol=" "

	# git
	if hash git 2>/dev/null; then
		if branch=$( { git symbolic-ref --quiet HEAD || git rev-parse --short HEAD; } 2>/dev/null ); then
			branch=${branch##*/}
			printf "%s" "${branch_symbol}${branch:-unknown}"
			return
		fi
	fi
	return 1
}
function __promptline_cwd {
	local dir_limit="4"
	local truncation="…"
	local first_char
	local part_count=0
	local formatted_cwd=""
	local dir_sep="  "
	local tilde="~"

	local cwd="${PWD/#$HOME/$tilde}"

	# get first char of the path, i.e. tilde or slash
	[[ -n ${ZSH_VERSION-} ]] && first_char=$cwd[1,1] || first_char=${cwd::1}

	# remove leading tilde
	cwd="${cwd#\~}"
	#formatted_cwd="$dir_sep"λ

	while [[ "$cwd" == */* && "$cwd" != "/" ]]; do
		# pop off last part of cwd
		local part="${cwd##*/}"
		cwd="${cwd%/*}"

		formatted_cwd="$dir_sep$part$formatted_cwd"
		part_count=$((part_count+1))

		[[ $part_count -eq $dir_limit ]] && first_char="$truncation" && break
	done
	#mu="μ"
	#lambda="λ"
	#if test "$EUID" = 0; then
	#shell_char="$lambda"
	#else
	#shell_char="$mu"
	#fi
	#shell_char="$shell_char$dir_sep"
	#printf "%s" "$shell_char"
	printf "%s" "$first_char$formatted_cwd"
}
function __promptline_left_prompt {
	local slice_prefix slice_empty_prefix slice_joiner slice_suffix is_prompt_empty=1


	# section "a" header
	slice_prefix="${a_bg}${sep}${a_fg}${a_bg}${space}" slice_suffix="$space${a_sep_fg}" slice_joiner="${a_fg}${a_bg}${alt_sep}${space}" slice_empty_prefix="${a_fg}${a_bg}${space}"
	[ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
	# section "a" slices
	#__promptline_wrapper "$(if [[ -n ${ZSH_VERSION-} ]]; then print %n; elif [[ -n ${FISH_VERSION-} ]]; then printf "%s" "$USER@$(hostname)"; else printf "%s" \\u; fi )" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }
	# test "$STATUS" -ne 0 && __promptline_wrapper "$STATUS" "$slice_prefix" "$slice_suffix"
	upper() {
		echo "$@"|python3 -c "import sys;x=sys.stdin.read();print(x[0].upper()+x[1:],end='')"
	}
	local hostname=$(hostname)
	# www.something.com -> something
	# opensub00.umiacs.umd.edu -> opensub00
	if test "$(echo $hostname|cut -d . -f 1)" = "www"; then
		hostname="$(echo $hostname|cut -d . -f 2)"
	else
		hostname="$(echo $hostname|cut -d . -f 1)"
	fi
	# uppercase it
	hostname=$(upper $hostname)
	__promptline_wrapper "$(if [[ -n ${ZSH_VERSION-} ]]; then print $hostname; elif [[ -n ${FISH_VERSION-} ]]; then printf "%s" "$hostname"; else printf "%s" \\u; fi )" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }
	if test -d /bedrock; then
		if test -e /bedrock/sbin/brn && grep -qi nyla /bedrock/sbin/brn; then # Bedrock Linux 1.0beta2 Nyla
			if test "$(bri -p 1|awk '{print $3}')" != '('"$(bri -n)"')'; then
				__promptline_wrapper "$(upper "$(bri -n)")" "$slice_prefix" "$slice_suffix"
			fi
		else
			if test "$(brl deref init)" != "$(brl which)"; then
				__promptline_wrapper "$(upper "$(brl which)")" "$slice_prefix" "$slice_suffix"
			fi
		fi
	fi
	__promptline_wrapper "$(whoami)" "$slice_prefix" "$slice_suffix"
	if test -d "/fs/ftp/incoming/$(whoami)" && test $(ls -1 /fs/ftp/incoming/"$(whoami)"|wc -l) -ne 0; then
		__promptline_wrapper "Dropped files waiting" "$slice_prefix" "$slice_suffix"
	fi



	# section "d" header
	slice_prefix="${d_bg}${sep}${d_fg}${d_bg}${space}" slice_suffix="$space${d_sep_fg}" slice_joiner="${d_fg}${d_bg}${alt_sep}${space}" slice_empty_prefix="${d_fg}${d_bg}${space}"
	[ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
	# section "d" slices
	#if grep -q '/dev/mapper/sd' /etc/mtab; then
	if test -e /dev/mapper/sd; then
		__promptline_wrapper ! "$slice_prefix" "$slice_suffix"
	fi


	# section "e" header
	slice_prefix="${e_bg}${sep}${e_fg}${e_bg}${space}" slice_suffix="$space${e_sep_fg}" slice_joiner="${e_fg}${e_bg}${alt_sep}${space}" slice_empty_prefix="${e_fg}${e_bg}${space}"
	[ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
	# section "b" slices
	if grep -q 'gdfs(/home/niles/.ssh/gdfs.creds)' /etc/mtab; then
		__promptline_wrapper ! "$slice_prefix" "$slice_suffix"
	fi



	# section "b" header
	slice_prefix="${b_bg}${sep}${b_fg}${b_bg}${space}" slice_suffix="$space${b_sep_fg}" slice_joiner="${b_fg}${b_bg}${alt_sep}${space}" slice_empty_prefix="${b_fg}${b_bg}${space}"
	[ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
	# section "b" slices
	local jobs="$JOBS"
	if test "$jobs" -ne 0; then 
		if test "$jobs" -gt 1; then
			__promptline_wrapper "$jobs"⚙ "$slice_prefix" "$slice_suffix"
		else
			__promptline_wrapper ⚙ "$slice_prefix" "$slice_suffix"
		fi
	fi
	# section "f" header
	slice_prefix="${f_bg}${sep}${f_fg}${f_bg}${space}" slice_suffix="$space${f_sep_fg}" slice_joiner="${f_fg}${f_bg}${alt_sep}${space}" slice_empty_prefix="${f_fg}${f_bg}${space}"
	[ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
	# section "f" slices
	if test "$PROMPTLINE_LAST_EXIT_CODE" -ne 0; then
		__promptline_wrapper $PROMPTLINE_LAST_EXIT_CODE "$slice_prefix" "$slice_suffix"
	fi

	# section "c" header
	slice_prefix="${c_bg}${sep}${c_fg}${c_bg}${space}" slice_suffix="$space${c_sep_fg}" slice_joiner="${c_fg}${c_bg}${alt_sep}${space}" slice_empty_prefix="${c_fg}${c_bg}${space}"
	[ $is_prompt_empty -eq 1 ] && slice_prefix="$slice_empty_prefix"
	# section "c" slices
	__promptline_wrapper "$(__promptline_cwd)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; is_prompt_empty=0; }

	# close sections
	printf "%s" "${reset_bg}${sep}$reset$space"
}
function __promptline_wrapper {
	# wrap the text in $1 with $2 and $3, only if $1 is not empty
	# $2 and $3 typically contain non-content-text, like color escape codes and separators

	[[ -n "$1" ]] || return 1
	printf "%s" "${2}${1}${3}"
}
function __promptline_git_status {
	[[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == true ]] || return 1

	local added_symbol="●"
	local unmerged_symbol="✖"
	#local modified_symbol="✚"
	#local modified_symbol="+"
	#local modified_symbol="Δ"
	local modified_symbol=±
	local clean_symbol="✔"
	local has_untracked_files_symbol="…"

	local ahead_symbol="↑"
	local behind_symbol="↓"

	local unmerged_count=0 modified_count=0 has_untracked_files=0 added_count=0 is_clean=""

	set -- $(git rev-list --left-right --count @{upstream}...HEAD 2>/dev/null)
	local behind_count=$1
	local ahead_count=$2

	# Added (A), Copied (C), Deleted (D), Modified (M), Renamed (R), changed (T), Unmerged (U), Unknown (X), Broken (B)
	while read line; do
		case "$line" in
			M*) modified_count=$(( $modified_count + 1 )) ;;
			U*) unmerged_count=$(( $unmerged_count + 1 )) ;;
		esac
	done < <(git diff --name-status)

	#while read line; do
	#case "$line" in
	#*) added_count=$(( $added_count + 1 )) ;;
	#esac
	#done < <(git diff --name-status --cached)
	added_count=$(git diff --name-status --cached|wc -l)

	if [ -n "$(git ls-files --others --exclude-standard)" ]; then
		has_untracked_files=1
	fi

	if [ $(( unmerged_count + modified_count + has_untracked_files + added_count )) -eq 0 ]; then
		is_clean=1
	fi

	local leading_whitespace=""
	[[ $ahead_count -gt 0 ]]         && { printf "%s" "$leading_whitespace$ahead_symbol$ahead_count"; leading_whitespace=" "; }
	[[ $behind_count -gt 0 ]]        && { printf "%s" "$leading_whitespace$behind_symbol$behind_count"; leading_whitespace=" "; }
	[[ $modified_count -gt 0 ]]      && { printf "%s" "$leading_whitespace$modified_symbol$modified_count"; leading_whitespace=" "; }
	[[ $unmerged_count -gt 0 ]]      && { printf "%s" "$leading_whitespace$unmerged_symbol$unmerged_count"; leading_whitespace=" "; }
	[[ $added_count -gt 0 ]]         && { printf "%s" "$leading_whitespace$added_symbol$added_count"; leading_whitespace=" "; }
	[[ $has_untracked_files -gt 0 ]] && { printf "%s" "$leading_whitespace$has_untracked_files_symbol"; leading_whitespace=" "; }
	[[ $is_clean -gt 0 ]]            && { printf "%s" "$leading_whitespace$clean_symbol"; leading_whitespace=" "; }
}
function __promptline_right_prompt {
	local slice_prefix slice_empty_prefix slice_joiner slice_suffix

	# section "y" header
	slice_prefix="${y_sep_fg}${rsep}${y_fg}${y_bg}${space}" slice_suffix="$space${y_sep_fg}" slice_joiner="${y_fg}${y_bg}${alt_rsep}${space}" slice_empty_prefix=""
	# section "y" slices
	__promptline_wrapper "$(__promptline_vcs_branch)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; }
	__promptline_wrapper "$(__promptline_git_status)" "$slice_prefix" "$slice_suffix" && { slice_prefix="$slice_joiner"; }

	# close sections
	printf "%s" "$reset"
}
function __promptline {
	local last_exit_code="${PROMPTLINE_LAST_EXIT_CODE:-$?}"

	local esc=$'[' end_esc=m
	if [[ -n ${ZSH_VERSION-} ]]; then
		local noprint='%{' end_noprint='%}'
	elif [[ -n ${FISH_VERSION-} ]]; then
		local noprint='' end_noprint=''
	else
		local noprint='\[' end_noprint='\]'
	fi
	local wrap="$noprint$esc" end_wrap="$end_esc$end_noprint"
	local space=" "
	local sep=""
	local rsep=""
	#local alt_sep="|"
	local alt_sep=""
	local alt_rsep=""
	local reset="${wrap}0${end_wrap}"
	local reset_bg="${wrap}49${end_wrap}"
	local a_fg="${wrap}38;5;236${end_wrap}"
	local a_bg="${wrap}48;5;108${end_wrap}"
	local a_sep_fg="${wrap}38;5;108${end_wrap}"
	local b_fg="${wrap}38;5;232${end_wrap}"
	local b_bg="${wrap}48;5;220${end_wrap}"
	local b_sep_fg="${wrap}38;5;220${end_wrap}"
	local c_fg="${wrap}38;5;244${end_wrap}"
	local c_bg="${wrap}48;5;236${end_wrap}"
	local c_sep_fg="${wrap}38;5;236${end_wrap}"

	local d_fg="${wrap}38;5;254${end_wrap}"
	local d_bg="${wrap}48;5;160${end_wrap}"
	local d_sep_fg="${wrap}38;5;160${end_wrap}"

	local e_fg="${wrap}38;5;254${end_wrap}"
	local e_bg="${wrap}48;5;24${end_wrap}"
	local e_sep_fg="${wrap}38;5;24${end_wrap}"

	local f_fg="${wrap}38;5;236${end_wrap}"
	local f_bg="${wrap}48;5;208${end_wrap}"
	local f_sep_fg="${wrap}38;5;208${end_wrap}"

	local y_fg="${wrap}38;5;253${end_wrap}"
	local y_bg="${wrap}48;5;239${end_wrap}"
	local y_sep_fg="${wrap}38;5;239${end_wrap}"
	if [[ -n ${ZSH_VERSION-} ]]; then
		PROMPT="$(__promptline_left_prompt)"
		RPROMPT="$(__promptline_right_prompt)"
	elif [[ -n ${FISH_VERSION-} ]]; then
		if [[ -n "$1" ]]; then
			if [[ "$1" = "left" ]]; then
				__promptline_left_prompt 
			elif test "$1" = "moron"; then
				echo -n "  "
			else
				__promptline_right_prompt
			fi
		else
			__promptline_ps1
		fi
	else
		PS1="$(__promptline_ps1)"
	fi
}

if [[ -n ${ZSH_VERSION-} ]]; then
	if [[ ! ${precmd_functions[(r)__promptline]} == __promptline ]]; then
		precmd_functions+=(__promptline)
	fi
elif [[ -n ${FISH_VERSION-} ]]; then
	__promptline "$1"
else
	if [[ ! "$PROMPT_COMMAND" == *__promptline* ]]; then
		PROMPT_COMMAND='__promptline;'$'\n'"$PROMPT_COMMAND"
	fi
fi

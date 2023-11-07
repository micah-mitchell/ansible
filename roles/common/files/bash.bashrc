# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s histappend
export HISTTIMEFORMAT="%Y.%m.%d %H:%M:%S "

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/bin/python /usr/lib/command-not-found -- $1
                   return $?
                elif [ -x /usr/share/command-not-found ]; then
		   /usr/bin/python /usr/share/command-not-found -- $1
                   return $?
		else
		   return 127
		fi
	}
fi

# 20101014 ablackton
# If this is an xterm set the title to host:dir for easier readability
case "$TERM" in
  xterm*|rxvt*)
    XTERM_TITLE='\[\033]0;\h:\w\007\]';
  ;;
  *)
  ;;
esac

#if [ "$color_prompt" = yes ]; then
#  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi

unset color_prompt force_color_prompt

USERCOLOUR='\[\033[01;32m\]';
DASHCOLOUR='\[\033[00;37m\]';
DATECOLOUR='\[\033[01;37m\]';
RED='\e[0;31m'
GREEN='\e[0;32m'
DIRCOLOUR='\[\033[00m\]\[\033[01;34m\]';
TEXTCOLOUR='\[\033[00m\]';
case $(id -u) in
  0)
    PS1="$XTERM_TITLE\[\033[01;31m\]\u@\H\n\w#$TEXTCOLOUR ";
  ;;
  *)
    PROMPT_COMMAND='RET=$?;'
    RET_VALUE='$(echo $RET)' #Ret value not colorized - you can modify it.
    RET_SMILEY='$(if [[ $RET = 0 ]]; then echo -ne "\[$GREEN\]:)"; else echo -ne "\[$RED\]:("; fi;)'
PS1="$XTERM_TITLE\
$DASHCOLOUR## \
$DATECOLOUR\d \t \
$DASHCOLOUR## \
$RET_VALUE $RET_SMILEY \
$DASHCOLOUR## \n\
$USERCOLOUR\u@\h\
$DASHCOLOUR:\
$DIRCOLOUR\w$TEXTCOLOUR\$ "
  ;;
esac
if [ -x /usr/bin/dircolors ]; then
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls --color=auto'
alias l='ls --color=auto -alF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
else
alias l='ls -alF'
fi

#unset USERCOLOUR DASHCOLOUR DATECLOUR RED GREEN RET_VALUE RET_SMILEY


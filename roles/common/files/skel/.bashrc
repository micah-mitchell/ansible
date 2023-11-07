# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# History ----------------------------------------------------------
# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace
# Expand the history size
export HISTSIZE=1000
export HISTFILESIZE=10000
# Set history date/time format
export HISTTIMEFORMAT="%Y.%m.%d-%H:%M:%S "
# Remove some basic commands from history
export HISTIGNORE="ls:cd:[bf]g:exit:..:...:l:cl"
# Causes bash to append history instead of overwriting it
shopt -s histappend
# Share history across all terminals
PROMPT_COMMAND="history -a; history -c; history -r"
export PROMPT_COMMAND
# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon


# Colors ----------------------------------------------------------
#export TERM=xterm-color
export TERM=xterm-256color
#export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1 
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


# Path --------------------------------------------------------------
# Path is set in ~/.profile and in ~/.bash_profile

# Input stuff -------------------------------------------------------
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set show-all-if-ambiguous On" # show list automatically, without double tab
bind "set bell-style none" # no bell

#set -o vi                   # Vi mode
#bind -m vi-command -r 'v'
set -o emacs                # Emacs mode
set -o noclobber            # dont inadvertently overwrite files
shopt -s autocd             # change to named directory
shopt -s cdable_vars        # if cd arg is not valid, assumes its a var defining a dir
shopt -s cdspell            # autocorrects cd misspellings
shopt -s checkwinsize       # update the value of LINES and COLUMNS after each command if altered
shopt -s cmdhist            # save multi-line commands in history as single line
shopt -s dotglob            # include dotfiles in pathname expansion
shopt -s expand_aliases     # expand aliases
shopt -s extglob            # enable extended pattern-matching features
shopt -s globstar           # recursive globbing
shopt -s progcomp           # programmable completion
shopt -s hostcomplete       # attempt hostname expansion when @ is at the beginning of a word
shopt -s nocaseglob         # pathname expansion will be treated as case-insensitive

# Completion -------------------------------------------------------
# Turn on advanced bash completion if the file exists 
# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Command Not Found ------------------------------------------------
# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found ]; then
  if [ -x /usr/bin/python3 ]; then
    function command_not_found_handle {
      # check because c-n-f could've been removed in the meantime
      if [ -x /usr/lib/command-not-found ]; then
        /usr/bin/python3 /usr/lib/command-not-found -- $1
        return $?
      elif [ -x /usr/share/command-not-found ]; then
        /usr/bin/python3 /usr/share/command-not-found -- $1
        return $?
      else
        return 127
      fi
    }
  fi
fi

# Set the default editor -------------------------------------------
export EDITOR=vim
export VISUAL=vim

# Set xTerm Title --------------------------------------------------
# If this is an xterm set the title to host:dir for easier readability
case "$TERM" in
  xterm*|rxvt*)
    XTERM_TITLE='\[\033]0;\u@\h:\w\007\]';
  ;;
  *)
  ;;
esac

# Prompt -----------------------------------------------------------
# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\[\e[0m\]' # No Color
export COLOR_WHITE='\[\e[0;37m\]'
export COLOR_BOLD_WHITE='\[\e[1;37m\]'
export COLOR_BLACK='\[\e[0;30m\]'
export COLOR_BOLD_BLACK='\[\e[1;30m\]'
export COLOR_BLUE='\[\e[0;34m\]'
export COLOR_BOLD_BLUE='\[\e[1;34m\]'
export COLOR_GREEN='\[\e[0;32m\]'
export COLOR_BOLD_GREEN='\[\e[1;32m\]'
export COLOR_CYAN='\[\e[0;36m\]'
export COLOR_BOLD_CYAN='\[\e[1;36m\]'
export COLOR_RED='\[\e[0;31m\]'
export COLOR_BOLD_RED='\[\e[1;31m\]'
export COLOR_PURPLE='\[\e[0;35m\]'
export COLOR_BOLD_PURPLE='\[\e[1;35m\]'
export COLOR_BROWN='\[\e[0;33m\]'
export COLOR_BOLD_BROWN='\[\e[1;33m\]'
export COLOR_YELLOW='\[\e[0;33m\]'
export COLOR_BOLD_YELLOW='\[\e[1;33m\]'
export COLOR_GRAY='\[\e[1;30m\]'
export COLOR_BOLD_GRAY='\[\e[1;37m\]'

# Box Drawing codes: https://en.wikipedia.org/wiki/Box-drawing_characters
unset color_prompt force_color_prompt

PROMPT_COMMAND='RET=$?;'

PIPE="$COLOR_RED|$COLOR_WHITE"
RET_FAIL='$(if [[ $RET != 0 ]]; then echo -ne "\[\e[0;31m\]| (\$?=$RET)"; fi;)'
JOBS="Jobs:\j"
case $(id -u) in
  0)
PS1="$XTERM_TITLE\
$COLOR_PURPLE\D{%F %T} $PIPE $JOBS $PIPE $COLOR_RED\u@\H $RET_FAIL \n\
$COLOR_RED\w$COLOR_NC\$ "
  ;;
  *)
PS1="$XTERM_TITLE\n\
$COLOR_PURPLE\D{%F %T} $PIPE $JOBS $PIPE $COLOR_GREEN\u@\H $RET_FAIL \n\
$COLOR_CYAN\w$COLOR_NC\$ "
  ;;
esac


# Alias definitions ------------------------------------------------
# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
#alias rm='rm -iv'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias less='less -R'
alias multitail='multitail --no-repeat -c'
alias vi='vim'
alias df='df -m'

# Change directory aliases
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
cl() { cd $1; ls -alF; } 

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Add commands to assist in using rootless podman
cc() { sudo su -l podman -c "$*"; echo "$*"; }
cs() { sudo su -l podman; }
alias podman='cc podman'

# Other Alias
alias ports='lsof -i -P -n'
alias routes='ip route list'
alias wanip='dig TXT +short o-o.myaddr.l.google.com @ns1.google.com'

# Colorize Shell --------------------------------------------------
# To have colors for ls and all grep commands such as grep, egrep and zgrep
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias l='ls --color=auto -alF'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
else
  alias l='ls -alF'
fi

# Functions --------------------------------------------------------
# Extract Files 
extract() {
    if [ -z ${1} ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        echo "Usage: extract <archive> [directory]"
        echo "Example: extract presentation.zip."
        echo "Valid archive types are:"
        echo "tar.bz2, tar.gz, tar.xz, tar, bz2, gz, tbz2,"
        echo "tbz, tgz, lzo, rar, zip, 7z, xz, txz, lzma and tlz"
    else
        case "$1" in
            *.tar.bz2|*.tbz2|*.tbz)         tar xvjf "$1" ;;
            *.tgz)                          tar zxvf "$1" ;;
            *.tar.gz)                       tar xvzf "$1" ;;
            *.tar.xz)                       tar xvJf "$1" ;;
            *.tar)                          tar xvf "$1" ;;
            *.rar)                          7z x "$1" ;;
            *.zip)                          unzip "$1" ;;
            *.7z)                           7z x "$1" ;;
            *.lzo)                          lzop -d  "$1" ;;
            *.gz)                           gunzip "$1" ;;
            *.bz2)                          bunzip2 "$1" ;;
            *.Z)                            uncompress "$1" ;;
            *.xz|*.txz|*.lzma|*.tlz)        xz -d "$1" ;;
            *) echo "Sorry, '$1' could not be decompressed." ;;
        esac
    fi
}

# Enable Powerline
# Setup with steps at: http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
#if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
#  source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
#fi
#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/share/powerline/bindings/bash/powerline.sh
#fi




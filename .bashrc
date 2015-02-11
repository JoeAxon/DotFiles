# ~/.bashrc


# tmux utility function for creating sessions
create_session()
{
	session_name=$1
	site_root=$2

	tmux new-session -d -s $session_name
	tmux send -t $session_name "SITE_ROOT=$site_root" ENTER
	tmux send -t $session_name "alias cr='cd \$SITE_ROOT'" ENTER

	tmux send -t $session_name 'cr' ENTER
	tmux send -t $session_name clear ENTER

	tmux attach -t $session_name
}



# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"



# Setup Prompt
PS1='\[\033[33m\][\W] \[\033[47m\]\[\033[31m\]$(__git_ps1 "(%s)")\[\033[0m\]\n\$ '
unset color_prompt force_color_prompt


# If this is an xterm set the title to user@host:dir
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support for
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi


# Load bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# Load local bash config
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


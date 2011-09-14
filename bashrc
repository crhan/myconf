# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
PS1='\n\[\e[01;37m\][`a=$?;if [ $a -ne 0 ]; then echo -n -e "\[\e[01;32;41m\]{$a}"; fi`\[\033[01;32m\]\u\[\033[01;33m\]@\[\033[01;35m\]\h\[\033[00m\] \[\033[01;34m\]`pwd``B=$(git branch 2>/dev/null | sed -e "/^ /d" -e "s/* \(.*\)/\1/"); if [ "$B" != "" ]; then S="git"; elif [ -e .bzr ]; then S=bzr; elif [ -e .hg ]; then S="hg"; elif [ -e .svn ]; then S="svn"; else S=""; fi; if [ "$S" != "" ]; then if [ "$B" != "" ]; then M=$S:$B; else M=$S; fi; fi; [[ "$M" != "" ]] && echo -n -e "\[\e[33;40m\]($M)\[\033[01;32m\]\[\e[00m\]"`\[\033[01;34m\]\[\e[01;37m\]]\n\[\e[01;34m\]$ \[\e[00m\]'
# If not running interactively, don't do anything

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=4000
export HISTTIMEFORMAT="%F %T:"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -laF'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Alias to make 'cd ..' easier
alias cd.="cd .."
alias clr="clear"

export EDITOR=vim

export "PATH=$HOME/bin:/sbin:/bin/sbin:$PATH:/home/crhan/src/android-sdk/platform-tools"

function testSSH(){
	for i in crhan.com crhan.info s{9,10,11,12}.shtion.com; do ping -qc20 $i;done;	
	
}

function rsyncMo(){
    rsync -vr root@$1:/mnt/sdcard/dcim/ /home/crhan/Pictures/DesireZ/
    find /home/crhan/Pictures/DesireZ/ -type d | xargs chmod 755
    find /home/crhan/Pictures/DesireZ/ -type f | xargs chmod 644
}

complete -c sudo
[[ -f /etc/profile.d/bash-completion.sh ]] && source /etc/profile.d/bash-completion.sh

# use keychain as the ssh-agent frontend
if [ -x "$(which keychain)" ]
then
    ssh_key=`find $HOME/.ssh/ -type f`
    for i in $ssh_key;do
        [ -f ${i}.pub ] && ssh_key_add=${ssh_key_add+${ssh_key_add} }${i}
    done
    eval `keychain --eval ${ssh_key_add}`
fi

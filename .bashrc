#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export VISUAL="vim"
export EDITOR="vim"
function parse_git_branch() {

git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'	
}

# Code for bash display
PS1='\[\e[3;35m\]\u\[\e[m\]\[\e[36m\]@ARCHLiNuX\[\e[m\] \[\e[1;35m\]\w $(parse_git_branch)\[\e[m\]\[\e[3;32m\]\$\[\e[m\]\[\e[0;37m\] '

export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
eval "`dircolors -b ~/ThemingStuff/dircolors-solarized/dircolors.ansi-dark`"
alias ls='ls --color=auto'
alias clears='printf "\033c"'


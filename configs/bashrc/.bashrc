# 
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i*]] && return

alias ls='ls --color=auto'

BLACK="\[\e[30m\]"
BLUE="\[\e[34m\]"
CYAN="\[\e[36m\]"
GREEN="\[\e[32m\]"
MAGENTA="\[\e[35m\]"
RED="\[\e[31m\]"
WHITE="\[\e[37m\]"
YELLOW="\[\e[33m\]"

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PS1='${YELLOW}[${CYAN}\u@\H|\W${YELLOW}]${RED}\\$\]'
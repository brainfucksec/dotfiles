# ==============================================================
#
# $HOME/.bash_aliases FILE
# By Brainfuck (brainfucksec)
#
# Last modified: Sun Jan  5 11:13:20 CET 2020
#
# ==============================================================


# ==============================================================
# == Common commands
# ==============================================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ll='ls -lFh'
alias la='ls -alFh'
alias l1='ls -1F --group-directories-first'
alias l1m='ls -1 | more'
alias lm='ls | more'
alias lsn='ls | cat -n'
alias mkdir='mkdir -p -v'
alias cpv='cp -v'
alias cpr='cp -R'
alias rcp='rsync -ahv --info=progress2'
alias cs='printf "\033c"'
alias src='source ~/.bashrc'


# ==============================================================
# == System administration commands
#
# Aliases for functions defined on $HOME/.bashrc FILE
# and for executables in ~/bin and ~/usr/local/bin directories
# ==============================================================

# systemctl
alias ssc='sudo systemctl'
alias sc='systemctl'
alias scr='systemctl -t service -a --state running --no-page --no-legend'
alias scf='systemctl --failed | head -n -6 | tail -n -1'

# memory/cpu
alias df='df -Tha --total'
alias free='free -mt'
alias ps='ps auxf'
alias ht='htop'
alias cputemp='sensors | grep Core'

# network
alias gu='gitupdate'
alias myip='curl -s http://ipinfo.io'

# archives and volumes management
alias ex='extract'
alias m='mountdev'
alias u='unmountdev'


# ==============================================================
# == Directories shortcuts
# ==============================================================
alias h='cd ~/'
alias gm='cd /run/media/"$(whoami)"'
alias a='cd ~/archive'
alias dc='cd ~/documents'
alias dl='cd ~/downloads'
alias p='cd ~/programming'
alias pd='cd ~/programming/dev'
alias pg='cd ~/programming/git'


# ==============================================================
# == Applications shortcuts
# ==============================================================
alias ytmp3="youtube-dl --config-location ~/.config/youtube-dl/config"
alias sp='strongpass'
alias fl='feh -g 640x480 --scale-down -d -S filename'
alias vb='vboxmanage'
alias nt='note'
alias n='nnn'
alias z='zathura --fork'

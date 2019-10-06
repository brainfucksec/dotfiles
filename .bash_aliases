# ==============================================================
#
# $HOME/.bash_aliases FILE
# By Brainfuck [brainfucksec]
#
# Last modified: Tue Sep 17 19:02:56 CEST 2019
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
alias l1='ls -1F'
alias l1m='ls -1 | more'
alias lm='ls | more'
alias lsn='ls | cat -n'
alias mkdir='mkdir -p -v'
alias cp='cp -v'
alias cpr='cp -Rv'
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
alias sc='sudo systemctl'
alias scr='sudo systemctl -t service -a --state running --no-page --no-legend'
alias scf='sudo systemctl --failed | head -n -6 | tail -n -1'

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
alias a='cd ~/archive'
alias dc='cd ~/documents'
alias dl='cd ~/downloads'
alias p='cd ~/programming'
alias pd='cd ~/programming/dev'
alias pg='cd ~/programming/git'


# ==============================================================
# == Applications shortcuts
# ==============================================================
alias ytmp3="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 -o '%(title)s.%(ext)s'"
alias sp='strongpass'
alias fl='feh -g 640x480 --scale-down -d -S filename'
alias bb='bleachbit -c --preset'
alias vb='vboxmanage'
alias n='note'
alias z='zathura --fork'

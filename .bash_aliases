# ==============================================================
#
# $HOME/.bash_aliases FILE
# By Brainfuck
#
# Last modified: Sun May  3 08:05:11 CEST 2020
# ==============================================================


# ==============================================================
# Common commands
# ==============================================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ll='ls -lFh'
alias la='ls -alFh'
alias l1='ls -1F --group-directories-first'
alias lh='ls -ld .??*'
alias l1m='ls -1 | more'
alias lm='ls | more'
alias lsn='ls | cat -n'
alias mkdir='mkdir -p -v'
alias cp='cp --preserve=all'
alias cpv='cp --preserve=all -v'
alias cpr='cp --preserve=all -R'
alias cpp='rsync -ahv --info=progress2'
alias cs='printf "\033c"'
alias src='source ~/.bashrc'

# ==============================================================
# System administration commands:
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

# archives and volumes management
alias ex='extract'
alias m='mountdev'
alias u='unmountdev'

# other
alias myip='curl -s https://ipapi.co/json'

# ==============================================================
# Directories shortcuts
# ==============================================================
alias h='cd ~/'
alias gm='cd /run/media/"$(whoami)" && ls -1'
alias a='cd ~/archive'
alias dc='cd ~/documents'
alias dl='cd ~/downloads'
alias c='cd ~/code'

# ==============================================================
# Applications shortcuts
# ==============================================================
alias n='note'
alias z='zathura --fork'
alias e='nvim'
alias fl='feh -g 640x480 --scale-down -d -S filename'
alias ytmp3="youtube-dl --config-location ~/.config/youtube-dl/config"
alias vb='vboxmanage'
alias gu='gitupdate'

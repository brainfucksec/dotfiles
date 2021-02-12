# ==============================================================
#
# $HOME/.bash_aliases FILE
# By Brainfuck
#
# Last modified: Fri Feb 12 09:11:22 AM CET 2021
# ==============================================================


# ==============================================================
# Common commands
# ==============================================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias lm='ls | more'
alias ll='ls -lFh'
alias la='ls -alFh --group-directories-first'
alias l1='ls -1F --group-directories-first'
alias l1m='ls -1F --group-directories-first | more'
alias lh='ls -ld .??*'
alias lsn='ls | cat -n'
alias mkdir='mkdir -p -v'
alias cp='cp --preserve=all'
alias cpv='cp --preserve=all -v'
alias cpr='cp --preserve=all -R'
alias rmf='rm -rf'
alias rmi='rm -i'
alias cpp='rsync -ahvW --info=progress2'
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
alias md='mountdev'
alias ud='unmountdev'

# other
alias myip='curl -s https://ipinfo.io/'

# ==============================================================
# Directories shortcuts
# ==============================================================
alias gm='cd /run/media/"$(whoami)" && ls -1'
alias dc='cd ~/documents'
alias dl='cd ~/downloads'

# ==============================================================
# Applications shortcuts
# ==============================================================
alias n='note'
alias z='zathura --fork'
alias e='nvim'
alias fl='feh -g 640x480 --scale-down -d -S filename'
alias ytmp3="youtube-dl --config-location ~/.config/youtube-dl/config"
alias gu='gitupdate'
alias clean='bleachbit -c --preset'

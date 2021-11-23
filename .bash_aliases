# ==============================================================
#
# $HOME/.bash_aliases FILE
# By Brainf+ck
#
# Last modified: 2021/11/23
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
alias rmi='rm -i'
alias cpp='rsync -ahW --info=progress2'
alias cs='printf "\033c"'
alias src='source ~/.bashrc'
alias q='exit'

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
alias lkf='lsblk -f'

# ==============================================================
# Directories shortcuts
# ==============================================================
alias ccd='cd ~/code/dev'
alias ccs='cd ~/study'
alias ccm='cd /run/media/"$(whoami)" && ls -1'
alias ccg='cd ~/code/git'
alias cdc='cd ~/documents'
alias cdl='cd ~/downloads'

# ==============================================================
# Git aliases
# ==============================================================
alias g='git'
alias gp='git push'
alias gl='git pull'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gc='git clone'

# ==============================================================
# Applications shortcuts
# ==============================================================
alias myip='curl -s https://ipleak.net/json/'
alias n='note'
alias z='zathura --fork'
alias e='nvim'
alias fl='feh -g 640x480 --scale-down -d -S filename'
alias ytmp3="yt-dlp --config-location ~/.config/yt-dlp/config"
alias gu='gitupdate'
alias cl='bleachbit -c --preset'
alias w3m='w3m https://duckduckgo.com'
alias sv='sudo virsh'


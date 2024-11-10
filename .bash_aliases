# ==============================================================
#
# $HOME/.bash_aliases FILE
# By brainf+ck
#
# Last modified: 2024/11/09
# ==============================================================

# ==============================================================
# Common commands
# ==============================================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias lm='ls | more'
alias ll='ls -lFh --group-directories-first'
alias la='ls -alFh --group-directories-first'
alias l1='ls -1F --group-directories-first'
alias l1m='ls -1F --group-directories-first | more'
alias lh='ls -ld .??*'
alias lsn='ls | cat -n'
alias mkdir='mkdir -pv'
alias cp='cp --preserve=all'
alias cpv='cp --preserve=all -v'
alias cpr='cp --preserve=all -R'
alias cpp='rsync -ahzXW --info=progress2'
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
alias pd='poweroff_dev'
alias lkf='lsblk -f'

# ==============================================================
# Directories shortcuts
# ==============================================================
alias ccd='cd ~/code/dev'
alias ccg='cd ~/code/git'
alias cdc='cd ~/documents'
alias cdl='cd ~/downloads'
alias cdm='cd ~/media/'
alias cds='cd ~/study'
alias cex='cd /mnt && ls -1'
alias ccf='cd ~/.config'

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
alias bc='bc -l'
alias cl='bleachbit -c --preset'
alias e='nvim'
alias fl='feh -g 640x480 --scale-down -d -S filename'
alias gu='gitupdate'
alias myip='curl https://ipapi.co/json'
alias n='note'
alias nb='newsboat'
alias ytmp3="yt-dlp --config-location ~/.config/yt-dlp/config"
alias w3m='w3m https://duckduckgo.com'
alias z='zathura --fork'
alias sv='sudo virsh'

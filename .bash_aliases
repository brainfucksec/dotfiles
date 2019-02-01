# =========================================================
# => bash aliases
#
# => AUthor: Brainfuck
# =========================================================


# =========================================================
# => Common commands
# =========================================================
alias ll='ls -lFh'
alias la='ls -alFh'
alias l1='ls -1F'
alias l1m='ls -1 | more'
alias lm='ls | more'
alias lsn='ls | cat -n'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd-='cd -'
alias mkdir='mkdir -p -v'
alias cp='cp -v'
alias cpr='cp -Rv'
alias cprs='rsync -ahv --info=progress2'
alias cs='printf "\033c"'
alias src='source ~/.bashrc'


# =========================================================
# => System administration commands
# =========================================================
# systemd service
alias sc='systemctl'
alias scr='systemctl daemon-reload'
alias scs='systemctl -t service -a --state running --no-page --no-legend'
alias scf='systemctl --failed | head -n -6 | tail -n -1'

# memory/cpu
alias df='df -Tha --total'
alias free='free -mt'
alias ps='ps auxf'
alias ht='htop'
alias cputemp='sensors | grep Core'

# network
alias showrepo='sudo cat /etc/pacman.d/mirrorlist'
alias updaterepo='sudo reflector --verbose -c Germany -c Sweden -c France --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias myip='curl http://ip-api.com'

# volumes management
alias ex='extract'
alias m='mountdev'
alias u='unmountdev'


# =========================================================
# Directories shortcuts
# =========================================================
alias h='cd ~/'
alias a='cd ~/archive'
alias dc='cd ~/documents'
alias dk='cd ~/Desktop'
alias dl='cd ~/downloads'
alias p='cd ~/programming'
alias pd='cd ~/programming/dev'
alias pg='cd ~/programming/git'
alias t='cd ~/tmp'
alias v='cd /opt/vpn/config'
alias vp='cd ~/.vim/pack/plugins/start'


# =========================================================
# Applications
# =========================================================
alias ytmp3="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 -o '%(title)s.%(ext)s'"
alias sp='strongpass'
alias r='ranger'
alias f='feh -g 640x480 -d -S filename'
alias bb='bleachbit -c --preset'


# =========================================================
# Functions
# =========================================================

# Function extract for common archive formats
extract() {
    if [[ -z "$1" ]]; then
        # display usage if no parameters given
        echo "Usage: extract <archive file>"
        return 1
    else
        for n in "$@"; do
            if [[ -f "$n" ]]; then
                case "${n%,}" in
                    *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                                tar xvf "$n"       ;;
                    *.lzma)     unlzma ./"$n"      ;;
                    *.bz2)      bunzip2 ./"$n"     ;;
                    *.rar)      unrar x -ad ./"$n" ;;
                    *.gz)       gunzip ./"$n"      ;;
                    *.zip)      unzip ./"$n"       ;;
                    *.z)        uncompress ./"$n"  ;;
                    *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                                7z x ./"$n"        ;;
                    *.xz)       unxz ./"$n"        ;;
                    *.exe)      cabextract ./"$n"  ;;
                    *)
                echo "extract: '$n' - unknown archive format"
                return 1
                esac
            else
                echo "'$n' - file does not exist"
                return 1
            fi
        done
    fi
}


# Mount device with udisksctl
mountdev() {
    if [[ -z "$1" ]]; then
        echo "Usage: mountdev <sdxX>"
        echo "Example: mountdev sdc1"
        return 1
    else
        udisksctl mount -b "/dev/$1"
    fi
}


# Unmount and eject device
unmountdev() {
    if [[ -z "$1" ]]; then
        echo "Usage: unmountdev <sdxX>"
        echo "Example: unmountdev sdc1"
        return 1
    else
        udisksctl unmount -b "/dev/$1"
        sleep 1
        udisksctl power-off -b "/dev/$1"
        echo "Ejected /dev/$1."
    fi
}

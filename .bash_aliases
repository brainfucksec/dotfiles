# basic shortcuts
alias ll='ls -lFh'
alias la='ls -alFh'
alias l1='ls -1F'
alias l1m='ls -1 | more'
alias lm='ls | more'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd-='cd -'
alias mkdir='mkdir -p -v'
alias cpr='cp -Rv'
alias cprs='rsync -ahv --info=progress2'
alias cs='printf "\033c"'
alias src='source ~/.bashrc'
alias ex='extract'


# system administration
alias scstart='sudo systemctl start'
alias scstop='sudo systemctl stop'
alias scstatus='sudo systemctl status'
alias screstart='sudo systemctl restart'
alias scrun='sudo systemctl -t service -a --state running --no-page --no-legend'
alias scfailed='sudo systemctl --failed | head -n -6 | tail -n -1'
alias free='free -mt'
alias ps='ps auxf'
alias ht='htop'
alias cputemp='sensors | grep Core'
alias showrepo='sudo cat /etc/pacman.d/mirrorlist'
alias updaterepo='sudo reflector --verbose -c Germany -c Netherlands -c Sweden --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'


# directories
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
alias fm="thunar '$PWD'"


# applications
alias ytmp3="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 -o '%(title)s.%(ext)s'"
alias sp="strongpass"


# function extract for common archive formats
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


# function for upload files on https://transfer.sh
upload() {
    if [ "$#" -eq 0 ]; then
        echo -e "No arguments specified."
        echo "Usage: upload <filename>"
        return 1
    fi

    local tmpfile=$(mktemp -t transferXXX)
    if tty -s; then
        local basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
        curl -H "Max-Days: 1" --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> "$tmpfile"
    else
        curl -H "Max-Days: 1" --progress-bar --upload-file "-" "https://transfer.sh/$1" >> "$tmpfile"
    fi
    echo -e ''
    less -FX "$tmpfile"
    rm -f "$tmpfile"
}

# basic shortcuts
alias ll='ls -lFh'
alias la='ls -alFh'
alias l1='ls -1F'
alias l1m='ls -1 | more'
alias lm='ls | more'
alias cat='ccat'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd-='cd -'
alias mkdir='mkdir -p -v'
alias cpr='cp -Rv'
alias cpinfo='rsync -r --info=progress2'
alias ch='printf "\033c"'
alias src='source ~/.bashrc'
alias ex='extract'


# system administration
alias free='free -mt'
alias ps='ps auxf'
alias ht='htop'
alias cputemp='sensors | grep Core'
alias show-repo='sudo cat /etc/pacman.d/mirrorlist'
alias update-repo='sudo reflector --verbose -c Germany -c Italy -c France --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias tor-start='sudo systemctl start tor.service'
alias tor-status='sudo systemctl status tor.service'
alias tor-restart='sudo systemctl restart tor.service'
alias tor-stop='sudo systemctl stop tor.service'
alias vpn-conf='sudo openvpn --config'


# directories
alias h='cd ~/'
alias desk='cd ~/Desktop'
alias dl='cd ~/downloads'
alias p='cd ~/programming'
alias pr='cd ~/programming/projects'
alias g='cd ~/programming/git'
alias v='cd /opt/vpn/'
alias fm='thunar $PWD'


# applications
alias ytmp3="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 -o '%(title)s.%(ext)s'"
alias st='/usr/bin/subl'
alias eq='pulseaudio-equalizer-gtk'


# function Extract for common file formats
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

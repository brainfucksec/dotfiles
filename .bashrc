# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


export white=$'\e[1;97m'
export red=$'\e[1;91m'
export green=$'\e[1;92m'
export blue=$'\e[1;94m'
export endc=$'\e[0m'


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# default prompt
#PS1='[\u@\h \W]\$ '
PS1='┌──[${white}\u${endc}]───[${white}\h${endc}] ${blue}[\w]${endc}
└───${white}>> ${endc}'


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi


# Custom Functions:
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
        udisksctl unmount -b "/dev/$1" &&
        udisksctl power-off -b "/dev/$1"
        echo "Ejected /dev/$1."
    fi
}


# Update git packages
gitupdate() {
    if [[ -z "$1" ]]; then
        echo "Usage: gitupdate <directory path>"
        return 1
    else
        local cwd="$1"
        if [[ -d "$cwd" ]]; then
            echo "[i] Updating git packages, it may take some time..."
            cd "$cwd"
            for i in $(find . -maxdepth 3 -name ".git" | cut -c 3-); do
                echo ""
                echo "${i}" | sed -e 's/.git//g'
                cd "$i"
                cd ..
                git pull
                cd "$cwd"
            done
            cd "$HOME"
        else
            echo "[Error] there are no git repositories here :("
            return 1
        fi
    fi
}


# Import colorscheme from 'wal' asynchronously
(cat ~/.cache/wal/sequences &)

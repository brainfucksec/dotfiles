# ==============================================================
#
# $HOME/.bashrc FILE
# By Brainfuck
#
# Last modified: Mon Mar  9 15:17:11 CET 2020
# ==============================================================


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# ==============================================================
# Default prompt
# ==============================================================

# define colors
export red=$'\e[1;91m'
export green=$'\e[1;92m'
export white=$'\e[1;97m'
export cyan=$'\e[1;96m'
export blue=$'\e[1;94m'
export endc=$'\e[0m'

# set color for current user
if [[ "$UID" -eq 0 ]]; then
    usercolor="${red}"
else
    usercolor="${white}"
fi

#PS1='[\u@\h \W]\$ '
PS1='┌──[\[${usercolor}\]\u\[${endc}\]]───[\[${usercolor}\]\h\[${endc}\]] \[${blue}[\w]\[${endc}\]
└───╼ \[${usercolor}\]\$\[${endc}\] '

# ==============================================================
# Colors
# ==============================================================

# enable color support of ls and grep and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# ==============================================================
# Alias definitions:
#
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
# ==============================================================
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# ==============================================================
# Functions:
#
# If you want to make this file smaller, these functions can
# be converted into scripts and removed from here (i.e. ~/bin
# folder).
# ==============================================================

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
        echo "mountdev: No argument supplied"
        echo "Usage: mountdev <sdxX>"
        echo "Example: mountdev sdc1"
        return 1
    else
        udisksctl mount -b "/dev/$1"
    fi
}

# Unmount and eject device with udisksctl
unmountdev() {
    if [[ -z "$1" ]]; then
        echo "unmountdev: No argument supplied"
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
        echo "gitupdate: Argument required"
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

# nnn file manager
f ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}


# Import colorscheme from 'wal' asynchronously
(cat ~/.cache/wal/sequences &)

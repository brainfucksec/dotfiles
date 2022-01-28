#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Add directories to $PATH variable
export PATH="$PATH:$HOME/bin"

# `grep default` highlight color
export GREP_COLOR="1;32"

# EDITOR
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export VISUAL="nvim"

# Colored man
export MANPAGER="less -R --use-color -Dd+g -Du+b"

# Appearance of QT5 applications
#QT_QPA_PLATFORMTHEME="gtk2"

# pfetch:
# Which information to display.
# NOTE: If 'ascii' will be used, it must come first.
# Default: "ascii title os host kernel uptime pkgs memory"
# Valid: space separated string
#
# OFF by default: shell editor wm de palette
export PF_INFO="ascii os kernel uptime pkgs shell editor wm palette"


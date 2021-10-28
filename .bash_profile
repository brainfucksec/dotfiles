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

#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Add directories to $PATH variable
export PATH="$PATH:$HOME/bin"

# `grep default` highlight color
export GREP_COLORS="mt=1;32"

# EDITOR
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export VISUAL="nvim"

# Colored man
export MANPAGER="less -R --use-color -Dd+g -Du+b"

# Override style of Qt applications
export QT_STYLE_OVERRIDE="kvantum"

# bat: set config file path
export BAT_CONFIG_PATH="/home/brainfuck/.config/bat/config"

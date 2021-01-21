#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# `grep default` highlight color
export GREP_COLOR="1;32"

# EDITOR
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export VISUAL="nvim"

# Add directories to $PATH variable
#export PATH="${PATH}:$(ruby -e 'puts Gem.user_dir')/bin"
export PATH="${PATH}:${HOME}/bin"

# Appearance of QT5 applications
export QT_STYLE_OVERRIDE="gtk2"

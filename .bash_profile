#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# add bin directory to the PATH for local usage
export PATH="${PATH}:/home/brainfuck/bin"

# EDITOR
export EDITOR=vim

# fix appearance of QT5 applications
export QT_QPA_PLATFORMTHEME=qt5ct

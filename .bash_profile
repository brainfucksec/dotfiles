#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# add $HOME/bin directory to the PATH for local usage
export PATH="${PATH}:/home/brainfuck/bin"

# grep default highlight color
export GREP_COLOR="1;32"

# EDITOR
export EDITOR=nvim

# SUDO_EDITOR, editor to use with `sudoedit` command
export SUDO_EDITOR=nvim

# fix appearance of QT5 applications
export QT_QPA_PLATFORMTHEME=qt5ct

# Go "GOPATH"
export GOPATH="/home/brainfuck/code/go"

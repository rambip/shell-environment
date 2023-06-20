#!/bin/bash

export CONFIG=$HOME/.config/shell
export INPUTRC="$CONFIG/inputrc"

## Check available editors:
# will take the first available in nvim, vim, vi
EDITOR="vi"
which vim > /dev/null && EDITOR="vim -u $CONFIG/vimrc"
which nvim > /dev/null && EDITOR="nvim -u $CONFIG/vimrc"
export EDITOR
echo "EDITOR is $EDITOR"
echo ""
pwd
ls


# TERMINAL COLOR AND PROMPT:
export TERM=xterm-256color

white='\001\e[0m\002'
black='\001\e[30m\002'
red='\001\e[31m\002'
green='\001\e[32m\002'
brown='\001\e[33m\002'
blue='\001\e[34m\002'
purple='\001\e[35m\002'
cyan='\001\e[36m\002'
gray='\001\e[37m\002'

export PS1="\$ "

# ALIASES AND TRICKS:
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias v=$EDITOR
shopt -s autocd

# HISTORY SETTINGS:
unset HISTSIZE 
unset HISTFILESIZE
shopt -s histappend



# CUSTOM FUNCTIONS:
H(){
    echo -en $blue
    whoami
    echo -en $white
    uname -no
    echo ""
}

P(){
    dir=$(match_project_name $1) || echo 'does not exist !!!'
    pushd "$PROJECT_DIR/$dir"
    ls -l
}

E(){
    pushd $CONFIG
    $EDITOR .
    source $CONFIG/bashrc
    popd
}

Update(){
    pushd $CONFIG
    git pull
    source bashrc
    popd
}

# pipe result into editor
vipe(){
    FILE=$(mktemp)
    cat > $FILE
    $EDITOR $FILE
    cat $FILE
}

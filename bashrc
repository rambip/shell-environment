export CONFIG=$HOME/.config/shell
EDITOR="vi"
# check editors available
vim --version > /dev/null && EDITOR="vim -u $CONFIG/vimmrc"
nvim --version > /dev/null && EDITOR="nvim -u $CONFIG/vimrc"

# input settings
export INPUTRC="$config/shell/inputrc"

# terminal colors
export TERM=xterm-256color

green='\001\e[32m\002'
red='\001\e[33m\002'
blue='\001\e[34m\002'
purple='\001\e[35m\002'
cyan='\001\e[36m\002'
white='\001\e[0m\002'

# GLOBAL SETTINGS:
PS1="[\h] $blue \W $white \$ "

alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias v=$EDITOR	

unset HISTSIZE 
unset HISTFILESIZE
shopt -s histappend


# find directory in CWD with name similar to argument
match_project_name(){
    # if no argument default to current pwd
    test -z "$PROJECT_DIR/$1" && echo . && return

    # find all matches with grep. if none, return an error
    poss=$(ls $PROJECT_DIR | grep -i $1) || return 1

    # if single match return it
    test $(echo $poss | wc -w) = "1" && echo "$poss" && return

    # else select it
    select dir in $poss
    do
        echo $dir
        return
    done
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
    #popd
}

save_conf(){
    cd $CONFIG
    echo "I will create a patch file with the modified config"
    patch=$(mktemp)
    git diff > $patch
    echo "saved in pastebin:"
    curl --upload-file $patch https://transfer.sh/shell.patch
    echo ""
}

Save(){
    echo $1 | grep '[^a-z]\?conf' && save_conf && return
    echo $1 | grep '[^a-z]\?proj' && save_project && return
    echo "nothing saved. chose 'config' or 'project'"
}

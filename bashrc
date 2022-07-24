export CONFIG=$HOME/.config/shell
export INPUTRC="$CONFIG/inputrc"

# CHECK EDITORS AVAILABLES:
# will take the first available in [nvim, vim, vi]
EDITOR="vi"
which vim && EDITOR="vim -u $CONFIG/vimrc"
which nvim && EDITOR="nvim -u $CONFIG/vimrc"
export EDITOR


# TERMINAL COLORS AND PROMPTS:
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

get_info(){
    # if variable `DISPLAY_INFO` is set, display user, hostname and pwd
    export PS1="\$ "
    test -n "$DISPLAY_INFO" && export PS1="[\u${gray}@${white}\h]${blue} \w \n ${white}\$ "
    export DISPLAY_INFO=""
}
DISPLAY_INFO=1
PROMPT_COMMAND="get_info"


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

# find directory in CWD with name similar to argument
match_project_name(){
    # if no argument default to current pwd
    test -z "$1" && echo . && return

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

# pipe result into editor
vipe(){
    FILE=$(mktemp)
    cat > $FILE
    $EDITOR $FILE
    cat $FILE
}

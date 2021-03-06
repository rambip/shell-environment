export TERM=xterm-256color
VIM_OR_NEOVIM="nvim"
nvim --version > /dev/null || VIM_OR_NEOVIM="vim"
vim --version > /dev/null || VIM_OR_NEOVIM="vi"
export EDITOR="$VIM_OR_NEOVIM -u ~/.config/shell/vimrc"
export INPUTRC="$HOME/.config/shell/inputrc"

config=$HOME/.config/shell
#cd $config && git pull

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
match_dir_name(){
    # if no argument default to current pwd
    test -z "$1" && echo . && return

    # find all matches with grep. if none, return an error
    poss=$(ls | grep -i $1) || return 1

    # if single match return it
    test $(echo $poss | wc -w) = "1" && cd $poss && echo "$poss" && return

    # else select it
    select dir in $poss
    do
        echo $dir
        return
    done
}

P(){
    cd $PROJECT_DIR
    dir=$(match_dir_name $1) || echo 'does not exist !!!'
    cd ./$dir
    ls -l
}

E(){
    cd $config
    $EDITOR .
    source $config/bashrc
    cd $OLDPWD
}

Update(){
    cd $config
    git pull
    source bashrc
    cd $OLDPWD
}

# FIXME: 100% github ?
save_conf(){
    cd $config
    echo "I will create a patch file with the modified configuration"
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

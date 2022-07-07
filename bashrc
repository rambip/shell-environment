export TERM=xterm-256color
export EDITOR="vim -u ~/.config/shell/vimrc"
export INPUTRC="$HOME/.config/shell/inputrc"

config=$HOME/.config/shell
#cd $config && git pull

green='\001\e[32m\002'
red='\001\e[33m\002'
blue='\001\e[34m\002'
purple='\001\e[35m\002'
cyan='\001\e[36m\002'
white='\001\e[0m\002'

PS1="[\h] $blue \W $white \$ "



alias grep="grep --color=auto"
alias v="vim -u ~/.config/shell/vimrc"
alias E="$EDITOR $config && source $config/bashrc"

P(){
    cd $PROJECT_DIR
    dir=$(ls | grep $1 | head -1)
    cd $dir
    pwd
    ls -l
}

Update(){
    cd $config
    git pull
    cd $OLDPWD
}

save_conf(){
    cd $config
    echo "I will create a patch file with the modified configuration"
    git diff > /tmp/shell.patch
    echo "saved in pastebin:"
    curl --upload-file /tmp/shell.patch https://transfer.sh/shell.patch
    echo ""
}

Save(){
    echo $1 | grep '[^a-z]\?conf' && save_conf && return
    echo $1 | grep '[^a-z]\?proj' && save_project && return
    echo "nothing saved. chose 'config' or 'project'"
}

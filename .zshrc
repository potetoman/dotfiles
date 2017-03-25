if [[ -z $DOTPATH ]]; then
    _get_dotpath() {
        local d
        d="${0:A:h}"
        if [[ $d =~ dotfiles$ ]]; then
            echo "$d"
        else
            return 1
        fi
    }
    export DOTPATH="$(_get_dotpath)"
    unfunction _get_dotpath
fi

# iTerm2のタブ名を変更する
function title {
    echo -ne "\033]0;"$*"\007"
}

function loadlib() {
    lib=${1:?"You have to specify a library file"}
    if [ -f "$lib" ];then #ファイルの存在を確認
        . $lib
    fi
}

loadlib ${HOME}"/.zsh/functions/prompt.zsh"
loadlib ${HOME}"/.zsh/functions/aliase.zsh"
loadlib ${HOME}"/.zsh/functions/setopts.zsh"
loadlib ${HOME}"/.zsh/functions/exports.zsh"
loadlib ${HOME}"/.zsh/functions/misc.zsh"
loadlib ${HOME}"/.zsh/functions/func.zsh"

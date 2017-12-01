# 補完候補をハイライトする
zstyle ':completion:*:default' menu select=2

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# pyenv setting
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# cdr settings
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi

# conda change
if [ $(hostname) = "gunfire" ]; then
    source ${PYENV_ROOT}/versions/anaconda-4.0.0/bin/activate chainer_gunfire3
    export PYTHONPATH=/home/shota-s/.pyenv/versions/anaconda-4.0.0/envs/chainer_gunfire3/lib/python3.5/site-packages
elif [ $(hostname) = "maitai" ]; then
    source ${PYENV_ROOT}/versions/anaconda-4.0.0/bin/activate chainer_maitai3
    export PYTHONPATH=/home/shota-s/.pyenv/versions/anaconda-4.0.0/envs/chainer_maitai3/lib/python3.5/site-packages
else
fi

# cdr settings
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi

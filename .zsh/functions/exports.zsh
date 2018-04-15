# vim path
export PATH=/usr/local/bin:$PATH

# tex path
export PATH=/Library/Tex/texbin/:$PATH

# go path
export PATH=${GOPATH}/bin:$PATH


# coreutils and gnu-sed path !MAC only
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true

# neovim home_path
export XDG_CONFIG_HOME=$HOME/.config

# GO settings
export GOPATH=$HOME/.go

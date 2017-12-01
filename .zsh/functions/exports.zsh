# vim path
export PATH="$PATH:/usr/local/bin"

# server mecab path
export PATH="$PATH:/opt/local/bin:/opt/local/lib"
export MECAB_PATH=/opt/local/lib/libmecab.so.2
export LD_LIBRARY_PATH=/opt/local/lib/:$LD_LIBRARY_PATH

# cuda path
export PATH=/usr/local/cuda/bin:$PATH
export CUDA_PATH=/usr/local/cuda
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# server mecab path
export PATH="$PATH:/opt/local/bin:/opt/local/lib"
#
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true

# neovim home_path
export XDG_CONFIG_HOME=$HOME/.config

# server user's usr path
export PATH="${HOME}/usr/bin:$PATH"

# server user's neovim path
export PATH="${HOME}/usr/local/neovim/bin:$PATH"

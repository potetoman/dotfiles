# profiling
# zmodload zsh/zprof && zprof

# autoload
autoload -U colors; colors
autoload -U compinit; compinit

# LANGUAGE must be set by en_US
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

setopt no_global_rcs
# Add ~/bin to PATH
export PATH=~/bin:"$PATH"

# History file and its size
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

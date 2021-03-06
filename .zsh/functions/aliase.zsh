# Common aliases
alias ..='cd ..'
alias ls='ls --color'
alias ld='ls -ld'          # Show info about the directory
alias lla='ls -lAF'        # Show hidden all files
alias ll='ls -lF'          # Show long file information
alias la='ls -AF'          # Show hidden files
alias lx='ls -lXB'         # Sort by extension
alias lk='ls -lSr'         # Sort by size, biggest last
alias lc='ls -ltcr'        # Sort by and show change time, most recent last
alias lu='ls -ltur'        # Sort by and show access time, most recent last
alias lt='ls -ltr'         # Sort by date, most recent last
alias lr='ls -lR'          # Recursive ls
alias shuf='gshuf'
alias diff='diff -u'
alias cnt='LC_ALL=C.UTF-8 sort | LC_ALL=C.UTF-8 uniq -c | LC_ALL=C.UTF-8 sort -rn' 

# Global aliases
# alias -g ls='ls --color'
alias -g cd=cdr
alias -g cd=cdr "$@" && ls
alias -g N=" >/dev/null 2>&1"
alias -g N1=" >/dev/null"
alias -g N2=" 2>/dev/null"

# User aliases
alias tmux="TERM=xterm-256color tmux"
alias neomecab="mecab -d /usr/local/lib/mecab/dic/mecab-ipadic-neologd/"

# custom
function cdls() {
    # cdがaliasでループするので\をつける
    \cd $1;
    ls;
}
alias cd=cdls

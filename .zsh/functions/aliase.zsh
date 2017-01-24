# Common aliases
alias ..='cd ..'
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

alias vi="vim"

# Global aliases
alias -g sort="LC_ALL=C.UTF-8 sort"
alias -g uniq="LC_ALL=C.UTF-8 uniq"
alias -g cd=cdr
alias -g cd=cdr "$@" && ls
alias -g N=" >/dev/null 2>&1"
alias -g N1=" >/dev/null"
alias -g N2=" 2>/dev/null"

# User aliases
alias tmux="TERM=xterm-256color tmux"
alias 2server="ssh -p 2022 shota-s@cocoa.cl.ecei.tohoku.ac.jp"
alias build_ipython_martini01="autossh -M 20012 -p 2022 shota-s@cocoa.cl.ecei.tohoku.ac.jp -L 12000:192.168.100.159:8282 -f -N &"
alias build_ipython_martini02="autossh -M 20012 -p 2022 shota-s@cocoa.cl.ecei.tohoku.ac.jp -L 12000:192.168.100.160:8282 -f -N &"
alias neomecab="mecab -d /usr/local/lib/mecab/dic/mecab-ipadic-neologd/"
alias corenlp="java -cp '/home/shota-s/utils/stanford-corenlp-full-2015-12-09/*' -Xmx4g edu.stanford.nlp.pipeline.StanfordCoreNLP -annotators tokenize,ssplit,pos,lemma,ner,parse"

# custom
function cdls() {
    # cdがaliasでループするので\をつける
    \cd $1;
    ls;
}
alias cd=cdls


function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

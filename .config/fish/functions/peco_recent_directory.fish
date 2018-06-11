function peco_recent_directory
    z -tl | awk '{ print $2}' | peco | read dst
    if test $status -eq 0
        commandline "cd $dst "
        commandline -f execute
    else 
        commandline -f repaint
    end
end

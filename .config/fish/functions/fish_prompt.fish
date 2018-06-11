function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

    # Set blank line
    echo ""

    echo -n '['

    # User
    set_color $fish_color_user
    echo -n (whoami)
    set_color normal

    echo -n '@'

    # Host
    set_color $fish_color_host
    echo -n (prompt_hostname)
    set_color normal

    echo -n '] '

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    if test $last_status -eq 0
        set status_face (set_color green)"(๑˃̵ᴗ˂̵)ﻭ < "
    else 
        set status_face (set_color blue)"(*;-;%)? < "
    end
    echo -n $status_face
    set_color normal
end

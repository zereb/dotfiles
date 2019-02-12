#!/usr/bin/fish
set -x PATH $PATH ~/.config/scripts/ ~/dotfiles/scripts/ ~/Android/Sdk/platform-tools/
set -x EDITOR "nvim"
set -x TERMINAL "xfce4-stable"
set -x BROWSER "qutebrowser"
set -x _JAVA_OPTIONS 'Dawt.useSystemAAFontSettings=lcd'
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end
alias vim "nvim"
alias todo "vim ~/Documents/misc/todo"

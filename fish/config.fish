#!/usr/bin/fish
set -xU PATH $PATH ~/.config/scripts/ ~/dotfiles/scripts/ ~/Android/Sdk/platform-tools/
set -xU EDITOR "nvim"
set -xU TERMINAL "xfce4-stable"
set -xU BROWSER "qutebrowser"
set -xU _JAVA_OPTIONS "-Dawt.useSystemAAFontSettings=lcd"
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end
alias vim "nvim"
alias todo "vim ~/Documents/misc/todo"

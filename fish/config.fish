#!/usr/bin/fish
env -i HOME=$HOME dash -l -c printenv | sed -e '/PATH/s/:/ /g;s/=/ /;s/^/set -x /' | source
set -gx PATH ~/.config/scripts/ ~/dotfiles/scripts/ ~/Android/Sdk/platform-tools ~/Programms ~/.emacs.d/bin/ $PATH
set -xU EDITOR "nvim"
set -xU TERMINAL "alacritty"
set -xU FILE "ranger"
set -xU BROWSER "qutebrowser"
set -xU _JAVA_OPTIONS "-Dawt.useSystemAAFontSettings=lcd"
set -xU PATH_TO_FX "~/Documents/.SDK/javafx-sdk-12.0.1/"
set -xU ANDROID_HOME "~/Android/Sdk"
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end
alias vim "nvim"
alias cat "bat"
alias todo "vim ~/Documents/misc/todo"
alias vimrc "vim ~/dotfiles/nvim/init.vim"
alias fishrc "vim ~/dotfiles/fish/config.fish"
alias i3rc "vim ~/dotfiles/i3/config"

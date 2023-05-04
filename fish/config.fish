#!/usr/bin/fish
set -gx PATH ~/.config/scripts/ ~/dotfiles/scripts/ ~/Android/Sdk/platform-tools ~/Programms ~/.emacs.d/bin/ ~/.local/bin ~/.local/share/npm/bin /usr/lib/jvm/default/bin/ $PATH
set -xg EDITOR "emacsclient -n"
set -xg TERMINAL "alacritty"
set -xg FILE "ranger"
# set -xg BROWSER "/usr/bin/qutebrowser"
set -xg BROWSER "/usr/bin/brave"
set -xg _JAVA_OPTIONS "-Dawt.useSystemAAFontSettings=lcd"
set -xg ANDROID_HOME "/home/oleg/Android/Sdk"

##### CLEANUP #####
set -xg XDG_CONFIG_HOME $HOME/.config
set -xg XDG_CACHE_HOME $HOME/.cache
set -xg XDG_DATA_HOME $HOME/.local/share
set -xg XDG_STATE_HOME $HOME/.local/state
set -xg XDG_RUNTIME_DIR $HOME/.config/.runtime

set -xg GRADLE_USER_HOME $XDG_DATA_HOME/gradle
set -xg GRADLE_USER_HOME $XDG_DATA_HOME/gradle

set -xg GNUPGHOME $XDG_CONFIG_HOME/gnupg
set -xg ICEAUTHORITY $XDG_CACHE_HOME/ICEauthority
set -xg HTTPIE_CONFIG_DIR $XDG_CONFIG_HOME/httpie
set -xg CARGO_HOME $XDG_DATA_HOME/cargo
set -xg GRADLE_USER_HOME $XDG_CONFIG_HOME/gradle
set -xg DOOMDIR "~/.config/doom"
set -xg WINEPREFIX /home/oleg/SSDrive/Games/!Wine64
set -xg WINEARCH win64
set -xg XAUTHORITY $XDG_RUNTIME_DIR/Xauthority
set -xg GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -xg NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -xg PARALLEL_HOME $XDG_CONFIG_HOME/parallel
set -xg NPM_CONFIG_PREFIX $XDG_DATA_HOME/npm

# xdg-mime default org.qutebrowser.qutebrowser.desktop x-scheme-handler/http
# xdg-mime default org.qutebrowser.qutebrowser.desktop x-scheme-handler/https

if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end

alias vim "nvim"
alias nvim "nvim"
alias vi "nvim"
#alias todo "vim ~/Documents/misc/todo"
alias todo "emacs ~/Documents/misc/todo.org"
alias vimrc "vim ~/dotfiles/nvim/init.vim"
alias home "vim ~/dotfiles/homepage/homepage.html"
alias fishrc "vim ~/dotfiles/fish/config.fish"
alias i3rc "vim ~/dotfiles/i3/config"
alias emacsrc "emacs ~/dotfiles/emacs/init.el"
alias scriptch "chmod -R -v 755 ~/dotfiles/config/scripts/"
alias freej2me "cd /home/oleg/Programms/games/java/ && java -jar freej2me.jar"
alias hiero "/usr/lib/jvm/java-8-openjdk/bin/java -jar ~/Programms/runnable-hiero.jar"
alias 2d-particle "/usr/lib/jvm/java-8-openjdk/bin/java -jar ~/Programms/runnable-2D-particles.jar"
alias psqlstart "sudo systemctl start postgresql.service"
alias psqlstop "sudo systemctl stop postgresql.service"
alias mariastart "sudo systemctl start mariadb.service"
alias mariastop "sudo systemctl stop mariadb.service"
alias game_mode "xrandr --output HDMI-0 --mode 1280x720 && xinput --set-prop 11 'libinput Accel Speed' -0.5 && polybar_launch && killall compton && echo 'done'"
alias normal_mode "xrandr --output HDMI-0 --auto && xinput --set-prop 11 'libinput Accel Speed' 0 && polybar_launch && compton &"
alias pacman-r-orphans "sudo pacman -Qtdq | sudo pacman -Rns -"
alias pacman-r-aur "sudo pacman -Qm | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(sudo pacman -Rsn {})'"
alias pacman-r "sudo pacman -Qe | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(sudo pacman -Rsn {})'"
alias pacman-r-unneeded "pacman -Qqd | pacman -Rsu -" 

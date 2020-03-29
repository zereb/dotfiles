#!/usr/bin/fish
set -gx PATH ~/.config/scripts/ ~/dotfiles/scripts/ ~/Android/Sdk/platform-tools ~/Programms ~/.emacs.d/bin/ $PATH
set -xg EDITOR "nvim"
set -xg TERMINAL "alacritty"
set -xg FILE "ranger"
set -xg BROWSER "/usr/bin/qutebrowser"
set -xg _JAVA_OPTIONS "-Dawt.useSystemAAFontSettings=lcd"
set -xg ANDROID_HOME "~/Android/Sdk"

##### CLEANUP #####
set -xg XDG_CONFIG_HOME $HOME/.config
set -xg XDG_CACHE_HOME $HOME/.cahe
set -xg GNUPGHOME $XDG_CONFIG_HOME/gnupg
set -xg ICEAUTHORITY $XDG_CACHE_HOME/ICEauthority
set -xg HTTPIE_CONFIG_DIR $XDG_CONFIG_HOME/httpie
set -xg CARGO_HOME $XDG_DATA_HOME/cargo
set -xg GRADLE_USER_HOME $XDG_CONFIG_HOME/gradle
set -xg DOOMDIR "~/.config/doom"
set -xg WINEPREFIX /home/oleg/HDrive/Games/wine
set -xg WINEARCH win32
set -xg XAUTHORITY $XDG_RUNTIME_DIR/Xauthority
set -xg GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -xg NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc

xdg-mime default org.qutebrowser.qutebrowser.desktop x-scheme-handler/http
xdg-mime default org.qutebrowser.qutebrowser.desktop x-scheme-handler/https

if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end
alias vim "nvim"
#alias todo "vim ~/Documents/misc/todo"
alias todo "emacs ~/Documents/misc/todo.org"
alias vimrc "vim ~/dotfiles/nvim/init.vim"
alias fishrc "vim ~/dotfiles/fish/config.fish"
alias i3rc "vim ~/dotfiles/i3/config"
alias scriptch "chmod -R -v 755 ~/dotfiles/config/scripts/"
alias pswd "java -jar /home/oleg/Programms/pswd.jar"
alias j2me "cd /home/oleg/Programms/games/java/ && java -jar freej2me.jar"
alias psqlstart "sudo systemctl start postgresql.service"
alias psqlstop "sudo systemctl stop postgresql.service"

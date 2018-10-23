#
# ~/.bash_profile
#

export PATH=${PATH}:$HOME/.config/scripts
export EDITOR="vim"
export TERMINAL="termite"
export BROWSER="chromium"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'
#export _JAVA_OPTIONS='-Dsun.java2d.opengl=true'
#export _JAVA_AWT_WM_NONREPARENTING=1

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ $(tty)="/dev/tty1" ]; then 
    
#   export _JAVA_AWT_WM_NONREPARENTING=1
	export XKB_DEFAULT_LAYOUT=us,ru
	export XKB_DEFAULT_OPTIONS=grp:alt_shift_toggle
#   export XKB_DEFAULT_OPTIONS=caps:escape
#	sway
    startx
fi


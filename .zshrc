#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

export EDITOR="/bin/vim"
source "$HOME/.local/share/miniplug.zsh"

source "$HOME/.alias"

export PATH="$PATH:$HOME/.go/bin:/usr/local/go/bin:$HOME/.local/bin"
export GOPATH="$HOME/.go"
export PF_INFO="ascii title os kernel wm editor shell uptime pkgs memory palette"
export MINIPLUG_HOME="$HOME/.zsh"

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/histfile
HISTSIZE=1000
SAVEHIST=100000
bindkey -v

# End of lines configured by zsh-newuser-install
#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

## never ever beep ever
setopt NO_BEEP

# miniplug
source "$HOME/.zsh/theme.zsh"
source "$HOME/.zsh/git.zsh"

source "$HOME/.zsh/zshfish.zsh-theme"
miniplug plugin 'zsh-users/zsh-syntax-highlighting'
miniplug plugin 'olets/zsh-window-title'

miniplug load

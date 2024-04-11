# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$ZDOTDIR/ohmyzsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions docker)

source $ZSH/oh-my-zsh.sh

source "$ZDOTDIR/env.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/init.zsh"


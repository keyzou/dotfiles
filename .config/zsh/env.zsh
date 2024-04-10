#!/usr/bin/env zsh

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
. "$HOME/.asdf/asdf.sh"
eval $(ssh-agent -s) 1> /dev/null
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
fpath=(${ASDF_DIR}/completions $fpath)
export GOROOT=/usr/local/go
export GOPATH=$HOME/dev/go

export PATH="$PATH:$HOME/.local/bin:$GOPATH/bin:$GOROOT/bin"

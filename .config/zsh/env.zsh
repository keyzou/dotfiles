#!/usr/bin/env zsh

export GOROOT=/usr/local/go
export GOPATH=$HOME/dev/go
export PATH="$PATH:$HOME/.local/bin:$GOPATH/bin:$GOROOT/bin"
GPG_TTY=$(tty)
export GPG_TTY

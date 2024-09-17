#!/usr/bin/env zsh

export GOPATH=$HOME/dev/go
export CGO_ENABLED=1

export PATH="$PATH:$HOME/.local/bin:$GOPATH/bin:$GOROOT/bin"
export PATH="$PATH:$(yarn global bin)"
GPG_TTY=$(tty)
export GPG_TTY


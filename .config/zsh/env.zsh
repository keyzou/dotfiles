#!/usr/bin/env zsh

export GOROOT=/usr/local/go
export GOPATH=$HOME/dev/go
export CGO_ENABLED=1

export TERM="wezterm"

export PATH="$PATH:$HOME/.local/bin:$GOPATH/bin:$GOROOT/bin"
GPG_TTY=$(tty)
export GPG_TTY

#!/usr/bin/env zsh

eval "$(/home/keyzou/.local/bin/mise activate zsh)"
eval $(ssh-agent -s) 1> /dev/null

export PATH="$PATH:$(yarn global bin)"

eval "$(zoxide init --cmd cd zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
eval "$(starship init zsh)"

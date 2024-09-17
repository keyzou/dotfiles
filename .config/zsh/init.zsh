#!/usr/bin/env zsh

eval $(ssh-agent -s) 1> /dev/null
if [[ -v ENABLE_HOMEBREW && $ENABLE_HOMEBREW = "on" ]]; then 
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 
fi

eval "$(zoxide init --cmd cd zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(starship init zsh)"

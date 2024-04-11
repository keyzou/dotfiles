#!/usr/bin/env zsh

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
. "$HOME/.asdf/asdf.sh"
eval $(ssh-agent -s) 1> /dev/null
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
fpath=(${ASDF_DIR}/completions $fpath)

eval "$(zoxide init --cmd cd zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
export PNPM_HOME="/home/keyzou/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(starship init zsh)"

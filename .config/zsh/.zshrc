
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit wait lucid for \
        OMZL::git.zsh \
        OMZP::git

zinit wait lucid for \
  atinit"zicompinit; zicdreplay"  \
        zdharma-continuum/fast-syntax-highlighting \
      OMZP::colored-man-pages \
  as"completion" is-snippet \
    OMZP::docker/completions/_docker

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

autoload -U zicompinit && zicompinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

setopt promptsubst
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always --group-directories-first --icons $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color=always --group-directories-first --icons $realpath'

source ~/.config/zsh/options.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/env.zsh
source ~/.config/zsh/init.zsh
[ -f ~/.config/zsh/secrets.zsh ] && source ~/.config/zsh/secrets.zsh
# Computer / env specific configuration
[ -f ~/.config/zsh/custom.zsh ] && source ~/.config/zsh/custom.zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions

# pnpm
export PNPM_HOME="/home/keyzou/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

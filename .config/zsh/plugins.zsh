#!/usr/bin/env zsh

# Starship
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# completions, hightlighting & suggestions
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
	zdharma-continuum/history-search-multi-word \
	atload"bindkey '^[[A' history-substring-search-up; \
			bindkey '^[[B' history-substring-search-down" \
		zsh-users/zsh-history-substring-search \

zinit light-mode depth=1 for \
  	OMZL::history.zsh \
  	blockf OMZL::completion.zsh \


zi snippet OMZP::git

zi ice as"completion"
zi snippet OMZP::docker

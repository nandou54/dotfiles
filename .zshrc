ZDOTDIR=~/dotfiles

# ================= FEATURES =================
DISABLE_ALIASES=false
DISABLE_PROMPT=false
DISABLE_PLUGINS=false
DISABLE_PRINT_ALIAS_COMPLETION=false
DISABLE_EXPAND_ALIAS=true

# ALIASES: Source aliases definition
if [[ $DISABLE_ALIASES != true ]]; then
  source $ZDOTDIR/features/aliases.zsh
fi

# PROMPT: Powerlevel10k
if [[ $DISABLE_PROMPT != true ]]; then
  source $ZDOTDIR/features/prompt.zsh
fi

# PlUGINS: Antibody
if [[ $DISABLE_PLUGINS != true ]]; then
  source $ZDOTDIR/features/plugins.zsh
fi

# PRINT ALIAS COMPLETION
if [[ $DISABLE_PRINT_ALIAS_COMPLETION != true ]]; then
  source $ZDOTDIR/features/print-alias-completion.zsh
fi

# EXPAND ALIAS
if [[ $DISABLE_EXPAND_ALIAS != true ]]; then
  source $ZDOTDIR/features/expand-alias.zsh
fi


# ================= CONFIGURATION =================
# Enable command auto-correction
ENABLE_CORRECTION="true"

# Loading fzf
[ -f $ZDOTDIR/.fzf.zsh ] && source $ZDOTDIR/.fzf.zsh

#Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# Optimizing auto-completion
autoload -Uz compinit
for dump in $ZDOTDIR/.zcompdump(N.mh+24); do
  compinit
done



# Change dotfiles location
ZDOTDIR=~/dotfiles

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Update automatically
# DISABLE_UPDATE_PROMPT=true

# PATH
export JAVA_HOME=/usr
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/go/bin

# Aliases definition
source $ZDOTDIR/.aliases

# Move prompt to bottom
cls

# P10k prompt
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Load zsh plugins with Antibody
source $ZDOTDIR/.zsh_plugins.sh

# Loading fzf
[ -f $ZDOTDIR/.fzf.zsh ]&& source $ZDOTDIR/.fzf.zsh

# Customizing plugins
# Trigger globalias on enter
globalias_accept(){
  local word=${${(Az)LBUFFER}[-1]}
    zle _expand_alias
    zle expand-word
  zle accept-line
  print ""
}
zle -N globalias_accept
bindkey "^M" globalias_accept

# Vs code integration
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  POWERLEVEL9K_TERM_SHELL_INTEGRATION=true
fi

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

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Move the prompt to the bottom of the screen
# printf '\n%.0s' {1..22}

# Enable command auto-correction.
#ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion (bug)
#COMPLETION_WAITING_DOTS="true"

# Update automatically
DISABLE_UPDATE_PROMPT=true

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Optimizing auto-completion
autoload -Uz compinit
for dump in $ZDOTDIR/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# Load zsh plugins with Antibody
source $ZDOTDIR/.zsh_plugins.sh

# Customizing plugins
# Trigger globalias on enter
globalias_accept(){
  local word=${${(Az)LBUFFER}[-1]}

  if ! [[ $word =~ '".*' || $word =~ "'.*" ]]; then
    zle _expand_alias
    zle expand-word
  fi
  zle accept-line
}
zle -N globalias_accept
bindkey "^M" globalias_accept

# Loading fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases definition
source $ZDOTDIR/.aliases

# P10k prompt
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

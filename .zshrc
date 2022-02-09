# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Move the prompt to the bottom of the screen.
# printf '\n%.0s' {1..22}

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ENV
export DENO_INSTALL=/home/pablo/.deno
export EDITOR=nano
export FONTCONFIG_PATH=/etc/fonts
export JAVA_HOME=/usr
export LD_LIBRARY_PATH=/home/pablo/InstantClient
export MANPATH=$MANPATH:/usr/local/man
export QT_QPA_PLATFORMTHEME=qt5ct
export TNS_ADMIN=/home/pablo/Oracle/Credentials

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/lib/python3.8/dist-packages
export PATH=$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$DENO_INSTALL/bin
export PATH=$PATH:$LD_LIBRARY_PATH
export PATH=$PATH:$HOME/adb

fpath+=$HOME/.zsh/pure

# ALIAS
# For a full list of active aliases, run `alias`.
alias zsh-config="nano ~/.zshrc && source ~/.zshrc"
alias zsh-plugins="nano ~/.zsh_plugins.txt && antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh && source ~/.zshrc"
alias open=xdg-open
alias sql="$HOME/sqlcl/bin/sql"
alias lc="colorls --sd -A"
alias cls="clear"
alias cz="cd -"
alias cx="cd .."
alias dev="cd ~/dev"
alias c="code -r"

alias vmo="ssh ubuntu@158.101.22.92"
alias vmg="ssh usr_3091865790609_ingenieria_usa@34.82.25.144"
alias vma="ssh ec2-user@18.222.121.27 "

alias ni="npm install"
alias nd="npm run dev"
alias nb="npm run build"
alias ns="npm run start"

alias yi="yarn install"
alias yd="yarn dev"
alias yb="yarn build"
alias ys="yarn start"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/pablo/google-cloud-sdk/path.zsh.inc' ]; then . '/home/pablo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/pablo/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/pablo/google-cloud-sdk/completion.zsh.inc'; fi

# Optimizing completion init
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# Load zsh plugins with Antibody
source ~/.zsh_plugins.sh

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 4); do /usr/bin/time $shell -i -c exit; done
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/pabloc54/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/pabloc54/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/pabloc54/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/pabloc54/.fzf/shell/key-bindings.zsh"

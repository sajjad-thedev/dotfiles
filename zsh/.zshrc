# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

# Set Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Only disable flow control if this is an interactive terminal
if [[ -t 0 ]]; then
  stty -ixon
fi
# Enable Plugins (Order matters: syntax-highlighting must be last)
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User Aliases
alias update='sudo pacman -Syu'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias ls='exa --icons'
alias ll='exa -la --icons'
alias cat='bat'
alias ..='cd ..'
alias ...='cd ../..'
# Quick edit configs
alias zshrc='nvim ~/.zshrc && source ~/.zshrc'
alias tmuxconf='nvim ~/.config/tmux/tmux.conf'
# Fuzzy attach to session (or create new if none exist)
alias ts='tmux attach -t $(tmux ls | fzf | cut -d: -f1)'
# Kill a session by fuzzy picking it
alias tk='tmux kill-session -t $(tmux ls | fzf | cut -d: -f1)'
# New session — prompts you to type a name
alias tn='tmux new -s'
# List sessions quick
alias tl='tmux ls'
# Attach to last session (no picking)
alias ta='tmux attach'

eval "$(zoxide init zsh)"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey -v
# Language Server PATH configuration
export PATH="$HOME/.local/bin:$PATH"
export PATH="$(npm config get prefix)/bin:$PATH"
alias vim=nvim
alias code=nvim

export PATH=$PATH:/home/sajjadahmed/.spicetify

# direnv setup for python virtual environments
export DIRENV_LOG_FORMAT=""
eval "$(direnv hook zsh)" 2>/dev/null
# Wrap the hook to suppress output
_direnv_hook() {
  local previous_exit_status=$?
  eval "$(direnv export zsh 2>/dev/null)"
  return $previous_exit_status
}

. "$HOME/.local/share/../bin/env"
export JAVA_HOME=/usr/lib/jvm/default
export PATH=$JAVA_HOME/bin:$PATH

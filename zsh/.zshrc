# =============================================================================
# POWERLEVEL10K INSTANT PROMPT
# Must stay at the very top. Do not move.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# =============================================================================
# OH MY ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Order matters: syntax-highlighting must be last
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# =============================================================================
# HISTORY
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt SHARE_HISTORY


# =============================================================================
# NAVIGATION & DIRECTORY BEHAVIOR
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt CORRECT

[[ -t 0 ]] && stty -ixon     # disable Ctrl+S/Q flow control in interactive terminals


# =============================================================================
# PATH
# All PATH exports in one place for clarity and speed.
export JAVA_HOME=/usr/lib/jvm/default
export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$JAVA_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# =============================================================================
# ENVIRONMENT
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"  # bat-powered man pages
export DIRENV_LOG_FORMAT=" "


# =============================================================================
# VI MODE
bindkey -v
export KEYTIMEOUT=1           # faster mode switching (0.1s instead of 0.4s)

# Restore useful emacs bindings that vi mode removes
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^R' history-incremental-search-backward
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history
bindkey '^W' backward-kill-word
bindkey '^U' kill-whole-line


# =============================================================================
# ALIASES — SYSTEM
alias update='sudo pacman -Syu'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias mirrors='sudo reflector --country Singapore,India --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias orphans='pacman -Qtdq'
alias pkgsize='expac -H M "%011m\t%-20n\t%10d" | sort -n' # packages by size

# ALIASES — NAVIGATION
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias d='dirs -v'             # show directory stack (pairs with AUTO_PUSHD)
alias 1='cd -1'               # jump to previous dir
alias 2='cd -2'
alias 3='cd -3'

# ALIASES — FILES
alias ls='exa --icons'
alias ll='exa -la --icons'
alias lt='exa --tree --icons --level=2'        # tree view, 2 levels deep
alias lta='exa --tree --icons --level=2 -a'   # tree view including hidden files
alias lg='exa -la --icons --git'              # show git status next to each file
alias cat='bat'
alias grep='grep --color=auto'
alias cp='cp -iv'             # confirm before overwriting, verbose
alias mv='mv -iv'             # confirm before overwriting, verbose
alias rm='rm -Iv'             # confirm before bulk deletes, verbose
alias mkdir='mkdir -pv'       # make parent dirs automatically, verbose

# ALIASES — EDITORS & CONFIGS
# alias vim=nvim
alias code=nvim
alias zshrc='nvim ~/.zshrc && source ~/.zshrc'
alias srcz='source ~/.zshrc'
alias dotconf='nvim ~/dotfiles/'

# ALIASES — GIT
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gca='git commit --amend'         # amend last commit
alias gp='git push'
alias gpf='git push --force-with-lease' # safer force push
alias gpl='git pull'
alias glog='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias gds='git diff --staged'          # diff what's already staged
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'              # all branches including remote
alias gundo='git reset --soft HEAD~1'  # undo last commit, keep changes staged
alias gnuke='git reset --hard HEAD'    # discard ALL uncommitted changes
alias gstash='git stash'
alias gpop='git stash pop'
alias gtag='git tag'

# ALIASES — PYTHON / FLASK
alias venv='source .venv/bin/activate'
alias venvcreate='python -m venv .venv && source .venv/bin/activate'
alias fr='flask run'
alias frd='flask run --debug'
alias pipi='pip install'
alias pipf='pip freeze > requirements.txt'
alias pipr='pip install -r requirements.txt'
alias py='python'
alias py3='python3'

# ALIASES — TMUX
alias ts='tmux attach -t $(tmux ls | fzf | cut -d: -f1)'   # fuzzy attach
alias tk='tmux kill-session -t $(tmux ls | fzf | cut -d: -f1)' # fuzzy kill
alias tn='tmux new -s'        # new named session
alias tl='tmux ls'            # list sessions
alias ta='tmux attach'        # attach to last session

# ALIASES — NETWORKING / PROCESSES
alias ports='ss -tlnp'                 # show all listening ports
alias myip='curl ifconfig.me'          # your public IP
alias localip='ip -brief address'      # local network IPs


# =============================================================================
# FUNCTIONS
# Make a directory and cd into it immediately
mkcd() { mkdir -p "$1" && cd "$1" }

# Extract any archive — just run: extract file.tar.gz
extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.gz|*.tgz) tar xzf "$1" ;;
      *.tar.bz2)       tar xjf "$1" ;;
      *.tar.xz)        tar xJf "$1" ;;
      *.tar)           tar xf  "$1" ;;
      *.zip)           unzip   "$1" ;;
      *.gz)            gunzip  "$1" ;;
      *.bz2)           bunzip2 "$1" ;;
      *.rar)           unrar x "$1" ;;
      *.7z)            7z x    "$1" ;;
      *)               echo "Unknown format: $1" ;;
    esac
  else
    echo "File not found: $1"
  fi
}

# Fuzzy search command history (better than Ctrl+R alone)
h() { history | grep "$1" }

# Quick local HTTP server in current directory
# Usage: serve        → port 8000
# Usage: serve 5000   → port 5000
serve() { python -m http.server "${1:-8000}" }

# Show what process is listening on a port
# Usage: listening 5000
listening() { ss -tlnp | grep ":${1}" }

# Kill whatever is running on a port
# Usage: killport 5000
killport() { kill -9 $(lsof -ti:"$1") && echo "Killed process on port $1" }

# Quick scratch notes saved to ~/notes.md
# Usage: note this is a reminder
# Usage: notes  (to view all)
note()  { echo "$(date '+%Y-%m-%d %H:%M'): $*" >> ~/notes.md }
notes() { [[ -f ~/notes.md ]] && bat ~/notes.md || echo "No notes yet." }

# Copy file contents to clipboard
# Usage: copy file.txt
copy() { cat "$1" | xclip -selection clipboard && echo "Copied to clipboard." }

# Create a .gitignore for a given language via gitignore.io
# Usage: gitignore python
# Usage: gitignore python,flask,venv
gitignore() { curl -sL "https://www.toptal.com/developers/gitignore/api/$1" > .gitignore && echo "Created .gitignore for: $1" }

# Show disk usage of items in current dir, sorted by size
ducks() { du -sh ./* | sort -rh | head -20 }

# Reload shell completely (useful after major config changes)
reload() { exec zsh }


# FZF — FUZZY FINDER
# Enables: Ctrl+R (history), Ctrl+T (files), Alt+C (cd into dir)
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh   ]] && source /usr/share/fzf/completion.zsh

# Use fd as fzf backend: faster, respects .gitignore, shows hidden files
if command -v fd &>/dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi


# ZOXIDE — SMART CD (cached for speed)
# Use 'z dirname' to jump to any recently visited directory
if command -v zoxide &>/dev/null; then
  if [[ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/zoxide-init.zsh" ]]; then
    zoxide init zsh > "${XDG_CACHE_HOME:-$HOME/.cache}/zoxide-init.zsh"
  fi
  source "${XDG_CACHE_HOME:-$HOME/.cache}/zoxide-init.zsh"
fi


# DIRENV — AUTO VENV ACTIVATION (cached for speed)
# Drop a .envrc into any project dir for automatic venv activation
if command -v direnv &>/dev/null; then
  if [[ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/direnv-init.zsh" ]]; then
    direnv hook zsh > "${XDG_CACHE_HOME:-$HOME/.cache}/direnv-init.zsh"
  fi
  source "${XDG_CACHE_HOME:-$HOME/.cache}/direnv-init.zsh"

  # Override the hook AFTER sourcing to silence ALL direnv output (loading, export, unloading).
  _direnv_hook() {
    local previous_exit_status=$?
    eval "$(direnv export zsh 2>/dev/null)"
    return $previous_exit_status
  }
fi


# OPTIONAL TOOLCHAIN ENV (rustup / uv / pipx — safe if missing)
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"


# POWERLEVEL10K CONFIG
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

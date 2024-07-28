# confirmations, etc.) must go above this block; everything else may go below.

# case-insensitive completions
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

ENABLE_CORRECTION="true"

HISTSIZE=1000000
HISTFILE=~/.zsh_history
SAVEHIST=1000000
setopt appendhistory
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space

# gh
autoload -U compinit
compinit -i

# Aliases
alias l='eza -lh  --icons=auto --color=never'
alias ls="eza --icons=auto --color=never " # "exa -1 --icons=auto" # "ls --color=auto"
alias lt="eza --tree --level=2 --long --icons --git"
alias ll='eza -lha --icons=auto --sort=name --group-directories-first --color=never' # long list all
alias cl='clear'
alias ..='cd ..'
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias v="nvim"
alias rns="systemctl --type=service --state=running"
alias lsc='ls -l | wc -l' # count files in dir
alias note="$EDITOR ~/Documents/notion/note.md"
alias cache="du -sh /home/li/.cache && du -sh /var/cache/pacman/pkg"
alias zconf="nvim ~/.zshrc"
alias fzf="fzf --preview 'bat --style=numbers --color=always {}' | xargs -n 1 nvim"

alias copy="pbcopy"
alias past="pbpaste"

alias bsl="brew services list"
alias bup="brew update && brew upgrade && brew cleanup"
alias bstart="brew services start"
alias bstop="brew services stop"

alias grep="grep --color=auto"
alias cat="bat"
alias o="open ." # open current dir in file manager
alias man="tldr"
alias task="taskell ~/Documents/"

# docker
alias ddd="ddev drush"
alias dlz="lazydocker"

# Postgres
alias pg="/Applications/Postgres.app/Contents/Versions/16/bin/psql" -p5432

# GIT
alias ga="git add"
alias gl="git pull"
alias gp="git push"
alias gc="git commit"
alias gf="git diff"
alias gm="git checkout main"
alias gd="git checkout dev"
alias gst="git status"
alias glo="git log --graph --oneline --decorate"
alias gla="git log --all --graph"
alias glz="lazygit"

# tmux
alias tn="tmux new -s"
alias ta="tmux a -t"

# Zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"

# Atuin
eval "$(atuin init zsh --disable-up-arrow)"

source ~/.bash_profile
source /opt/homebrew/opt/fzf/shell/completion.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /opt/homebrew/opt/fzf/shell/key-bindings.zsh # use atuin instead

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]] || [[ $KEYMAP = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Start with beam shape cursor on zsh startup and after every command.
zle-line-init() { zle-keymap-select 'beam'}

# pnpm
export PNPM_HOME="/Users/mohammedbabai/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# default
export LANG=en_US.UTF-8
export EDITOR='nvim'

# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Bat
export BAT_THEME=gruvbox-dark

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fzf
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --no-ignore --strip-cwd-prefix --exclude .git "
export FZF_COMPLETION_OPTS='--border --info=inline'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

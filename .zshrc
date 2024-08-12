# confirmations, etc.) must go above this block; everything else may go below.

. "$HOME/.cargo/env"
. "$HOME/Library/Application Support/org.dfinity.dfx/env"

# case-insensitive completions
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

ENABLE_CORRECTION="true"

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups

# Aliases
alias l='eza -lh  --icons=auto --color=never'
alias ls="eza --icons=auto --color=never " # "exa -1 --icons=auto" # "ls --color=auto"
alias lt="eza --tree --level=2 --long --icons --git"
alias ll='eza -lha --icons=auto --sort=name --group-directories-first --color=never' # long list all
alias ..='cd ..'
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias v="nvim"
alias rns="systemctl --type=service --state=running"
alias lsc='ls -l | wc -l' # count files in dir
alias note="$EDITOR ~/Documents/notion/note.md"
alias cache="du -sh /home/li/.cache && du -sh /var/cache/pacman/pkg"
alias zconf="nvim ~/.zshrc"
alias fzf="fzf --preview 'cat -n {}' | xargs -n 1 nvim"

alias copy="pbcopy"
alias past="pbpaste"

alias bsl="brew services list"
alias bup="brew update && brew upgrade && brew cleanup"
alias bstart="brew services start"
alias bstop="brew services stop"

alias grep="grep --color=auto"
alias o="open ." # open current dir in file manager
alias man="tldr"

alias m="make"

# docker
alias dps="docker ps"
alias dimg="docker images"
alias ddd="ddev drush"
alias dlz="lazydocker"

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

source /opt/homebrew/opt/fzf/shell/completion.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# default
export LANG=en_US.UTF-8
export EDITOR='nvim'

# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# fzf
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --no-ignore --strip-cwd-prefix --exclude .git "
export FZF_COMPLETION_OPTS='--border --info=inline'

# docker-completions
fpath=(~/.docker/completions \/usr/local/share/zsh/site-functions /usr/share/zsh/site-functions /usr/share/zsh/5.9/functions)
autoload -Uz compinit
compinit

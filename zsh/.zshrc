# confirmations, etc.) must go above this block; everything else may go below.

export ZSH="$HOME/.oh-my-zsh"
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_THEME="robbyrussell"

ENABLE_CORRECTION="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh
source ~/.bash_profile

export LANG=en_US.UTF-8

# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='nvim'
# else
#   export EDITOR='vim'
# fi

# Aliases
alias l='eza -lh  --icons=auto'
alias ls="eza" # "exa -1 --icons=auto" # "ls --color=auto"
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias cl='clear'
alias ..='cd ..'
alias cd..='cd ..'
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias v="nvim"
alias rns="systemctl --type=service --state=running"
alias lsc='ls -l | wc -l' # count files in dir
alias note="$EDITOR ~/Documents/notion/note.md"
alias cache="du -sh /home/li/.cache && du -sh /var/cache/pacman/pkg"
alias zconf="nvim ~/.zshrc"
alias co="cd ~/Code/"
alias fzf="fzf --preview 'bat --style=numbers --color=always {}' | xargs -n 1 nvim"

alias bsl="brew services list"
alias brewup="brew update && brew upgrade && brew cleanup"
alias brewstart="brew services start"
alias brewstop="brew services stop"

alias grep="grep --color=auto"
alias cat="bat"
alias o="open ." # open current dir in file manager
alias man="tldr"

# rm trash
#alias rm="rmtrash"
#alias rmdir="rmdirtrash"

# GIT
alias ga="git add"
alias gl="git pull"
alias gp="git push"
alias gc="git commit"
alias gf="git diff"
alias gm="git checkout main"
alias gd="git checkout dev"
alias gst="git status"
alias glo="git log --oneline"
alias gla="git log --all --graph"
alias glz="lazygit"

# tmux
alias tn="tmux new -s"
alias ta="tmux a -t"

# history
alias hz="bat .zsh_history"
alias hb="bat .bash_history"

#source /usr/share/doc/pkgfile/command-not-found.zsh
#source /usr/share/fzf/key-bindings.zsh
#source /usr/share/fzf/completion.zsh

# bun completions
[ -s "/home/li/.bun/_bun" ] && source "/home/li/.bun/_bun"

eval $(thefuck --alias)

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

eval "$(atuin init zsh)"

# fzf
# eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

# pnpm
export PNPM_HOME="/Users/mohammedbabai/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

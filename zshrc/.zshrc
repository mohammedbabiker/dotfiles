export ZSH="$HOME/.oh-my-zsh"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_THEME="robbyrussell"

ENABLE_CORRECTION="true"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Aliases
alias l='eza -lh  --icons=auto'
alias ls="exa" # "eza -1 --icons=auto" # "ls --color=auto"
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias ..='cd ..'
alias cd..='cd ..'
alias v="nvim"
alias n="neofetch"
alias t="timedatectl"
alias rns="systemctl --type=service --state=running"
alias lsc='ls -l | wc -l' # count files in dir
alias grep="grep --color=auto"
alias note="$EDITOR ~/xpad.txt"
alias cache="du -sh /home/li/.cache && du -sh /var/cache/pacman/pkg"
alias zconf="nvim ~/.zshrc"

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
alias glg="git log --graph"
alias glz="lazygit"

# history
alias hz="bat .zsh_history"
alias hb="bat .bash_history"

source /usr/share/doc/pkgfile/command-not-found.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# bun completions
[ -s "/home/li/.bun/_bun" ] && source "/home/li/.bun/_bun"

eval $(thefuck --alias)

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

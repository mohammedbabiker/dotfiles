# Backup existing dotfiles

datets=$(date '+%Y-%m\%d-%H:%M:%S')
if [ -d ~/dotfiles ] || [ -f ~/.zshrc ]; then
  figlet "backup"
  if [ -d ~/dotfiles ]; then
        echo "The script has detected an existing dotfiles folder and will try to create a backup into the folder:"
        echo "~/dotfiles-backup/$datets"
    fi
    if [ ! -L ~/.zshrc ] && [ -f ~/.zshrc ]; then
        echo "The script has detected an existing .zshrc file and will try to create a backup to:" 
        echo "~/dotfiles-backup/$datets/.zshrc-old"
    fi
    if gum confirm "Do you want to create a backup?" ;then
        if [ ! -d ~/dotfiles-backup ]; then
            mkdir ~/dotfiles-backup
            echo "~/dotfiles-backup created."
        fi
        if [ ! -d ~/dotfiles-backup/$datets ]; then
            mkdir ~/dotfiles-backup/$datets
            echo "~/dotfiles-backup/$datets created"
        fi
        if [ -d ~/dotfiles ]; then
            rsync -a ~/dotfiles/ ~/dotfiles-backup/$datets/
            echo "Backup of your current files in ~/dotfiles-backup/$datets created."
        fi
        if [ -f ~/.zshrc ]; then
            cp ~/.zshrc ~/dotfiles-backup/$datets/.zshrc-old
            echo "Existing .zshrc file found in homefolder. .zshrc-old created"
        fi
    elif [ $? -eq 130 ]; then
        exit 130
    else
        echo "Backup skipped."
    fi
    echo ""
fi


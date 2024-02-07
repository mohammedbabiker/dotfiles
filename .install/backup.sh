# Backup existing dotfiles

datets=$(date '+%Y-%m\%d-%H:%M:%S')
if [ -d ~/mohmd-Hyprland-Dotfile ] || [ -f ~/.zshrc ]; then
  figlet "backup"
  if [ -d ~/mohmd-Hyprland-Dotfile ]; then
        echo "The script has detected an existing dotfiles folder and will try to create a backup into the folder:"
        echo "~/mohmd-Hyprland-Dotfile-backup/$datets"
    fi
    if [ ! -L ~/.zshrc ] && [ -f ~/.zshrc ]; then
        echo "The script has detected an existing .zshrc file and will try to create a backup to:" 
        echo "~/mohmd-Hyprland-Dotfile-backup/$datets/.zshrc-old"
    fi
    if gum confirm "Do you want to create a backup?" ;then
        if [ ! -d ~/mohmd-Hyprland-Dotfile-backup ]; then
            mkdir ~/mohmd-Hyprland-Dotfile-backup
            echo "~/mohmd-Hyprland-Dotfile-backup created."
        fi
        if [ ! -d ~/mohmd-Hyprland-Dotfile-backup/$datets ]; then
            mkdir ~/mohmd-Hyprland-Dotfile-backup/$datets
            echo "~/mohmd-Hyprland-Dotfile-backup/$datets created"
        fi
        if [ -d ~/mohmd-Hyprland-Dotfile ]; then
            rsync -a ~/mohmd-Hyprland-Dotfile/ ~/mohmd-Hyprland-Dotfile-backup/$datets/
            echo "Backup of your current files in ~/mohmd-Hyprland-Dotfile-backup/$datets created."
        fi
        if [ -f ~/.zshrc ]; then
            cp ~/.zshrc ~/mohmd-Hyprland-Dotfile-backup/$datets/.zshrc-old
            echo "Existing .zshrc file found in homefolder. .zshrc-old created"
        fi
    elif [ $? -eq 130 ]; then
        exit 130
    else
        echo "Backup skipped."
    fi
    echo ""
fi


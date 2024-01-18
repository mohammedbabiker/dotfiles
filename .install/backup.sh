# Backup existing dotfiles

datets=$(date '+%Y%m%d%H%M%S')
if [ -d ~/mohmd-Hyprland-Dotfile ] || [ -f ~/.bashrc ]; then
echo "backup"
  if [ -d ~/mohmd-Hyprland-Dotfile ]; then
        echo "The script has detected an existing dotfiles folder and will try to create a backup into the folder:"
        echo "~/mohmd-Hyprland-Dotfile-backup/backups/$datets"
    fi
    if [ ! -L ~/.bashrc ] && [ -f ~/.bashrc ]; then
        echo "The script has detected an existing .bashrc file and will try to create a backup to:" 
        echo "~/mohmd-Hyprland-Dotfile-backup/backups/$datets/.bashrc-old"
    fi
    if gum confirm "Do you want to create a backup?" ;then
        if [ ! -d ~/mohmd-Hyprland-Dotfile-backup ]; then
            mkdir ~/mohmd-Hyprland-Dotfile-backup
            echo "~/mohmd-Hyprland-Dotfile-backup created."
        fi
        if [ ! -d ~/mohmd-Hyprland-Dotfile-backup/backups ]; then
            mkdir ~/mohmd-Hyprland-Dotfile-backup/backups
            echo "~/mohmd-Hyprland-Dotfile-backup/backups created"
        fi
        if [ ! -d ~/mohmd-Hyprland-Dotfile-backup/backups/$datets ]; then
            mkdir ~/mohmd-Hyprland-Dotfile-backup/backups/$datets
            echo "~/mohmd-Hyprland-Dotfile-backup/backups/$datets created"
        fi
        if [ -d ~/dotfiles ]; then
            rsync -a ~/mohmd-Hyprland-Dotfile/ ~/mohmd-Hyprland-Dotfile-backup/backups/$datets/
            echo "Backup of your current dotfiles in ~/mohmd-Hyprland-Dotfile-backup/backups/$datets created."
        fi
        if [ -f ~/.bashrc ]; then
            cp ~/.bashrc ~/mohmd-Hyprland-Dotfile-backup/backups/$datets/.bashrc-old
            echo "Existing .bashrc file found in homefolder. .bashrc-old created"
        fi
    elif [ $? -eq 130 ]; then
        exit 130
    else
        echo "Backup skipped."
    fi
    echo ""
fi


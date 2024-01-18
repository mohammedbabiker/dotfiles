# Copy mohmd-Hyprland-Dotfile

if [ ! -d ~/mohmd-Hyprland-Dotfile ]; then
echo ""
fi

if [ ! -d ~/mohmd-Hyprland-Dotfile ]; then
echo "The script will now remove existing directories and files from ~/.config/"
echo ""
echo "Symbolic links will then be created from ~/mohmd-Hyprland-Dotfile into your ~/.config/ directory."
echo ""
fi
if [[ ! $(tty) == *"pts"* ]] && [ -d ~/mohmd-Hyprland-Dotfile ]; then
    echo "You're running the script in tty. You can delete the existing ~/dotfiles folder now for a clean installation."
    echo "If not, the script will overwrite existing files but will not remove additional files or folders of your custom configuration."
    echo ""
else
    if [ -d ~/mohmd-Hyprland-Dotfile ]; then
        echo "The script will overwrite existing files but will not remove additional files or folders of your custom configuration."
    fi
fi
if [ ! -d ~/mohmd-Hyprland-Dotfile ]; then
    echo "PLEASE BACKUP YOUR EXISTING CONFIGURATIONS in .config IF NEEDED!"
    echo ""
fi

if gum confirm "Do you want to install the prepared files now?" ;then
    if [ ! $mode == "dev" ]; then
        echo "Copy started"
        if [ ! -d ~/mohmd-Hyprland-Dotfile ]; then
            mkdir ~/mohmd-Hyprland-Dotfile
            echo "~/mohmd-Hyprland-dotfile folder created."
        fi   
        rsync -avhp -I ~/mohmd-Hyprland-Dotfile/ ~/mohmd-Hyprland-Dotfile/
        if [[ $(_isFolderEmpty ~/mohmd-Hyprland-Dotfile/) == 0 ]] ;then
            echo "AN ERROR HAS OCCURED. Copy prepared dofiles from ~/mohmd-Hyprland-Dotfile/ to ~/mohmd-Hyprland-Dotfile/ failed" 
            echo "Please check that rsync is installad on your system."
            echo "Execution of rsync -a -I ~/mohmd-Hyprland-Dotfile/ ~/mohmd-Hyprland-Dotfile/ is required."
            exit
        fi
        echo "All files from ~/mohmd-Hyprland-Dotfile/ to ~/mohmd-Hyprland-Dofile/ copied."
    else
        echo "Skipped: DEV MODE!"
    fi
elif [ $? -eq 130 ]; then
        exit 130
else
    exit
fi
echo ""


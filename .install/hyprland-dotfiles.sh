# Install dotfiles

if [ ! $mode == "dev" ]; then
    if [ -d ~/dotfiles/vim ]; then
        _installSymLink vim ~/.config/vim ~/dotfiles/vim/ ~/.config
    fi
    if [ -d ~/dotfiles/nvim ]; then
        _installSymLink nvim ~/.config/nvim ~/dotfiles/nvim/ ~/.config
    fi
    if [ -d ~/dotfiles/btop ]; then
        _installSymLink btop ~/.config/btop ~/dotfiles/btop/ ~/.config
    fi
    if [ -d ~/dotfiles/rofi ]; then
        _installSymLink rofi ~/.config/rofi ~/dotfiles/rofi/ ~/.config
    fi
    if [ -d ~/dotfiles/dunst ]; then
        _installSymLink dunst ~/.config/dunst ~/dotfiles/dunst/ ~/.config
    fi
    if [ -d ~/dotfiles/hypr ]; then
        _installSymLink hypr ~/.config/hypr ~/dotfiles/hypr/ ~/.config
    fi
    if [ -d ~/dotfiles/waybar ]; then
        _installSymLink waybar ~/.config/waybar ~/dotfiles/waybar/ ~/.config
    fi
    if [ -d ~/dotfiles/swaylock ]; then
        _installSymLink swaylock ~/.config/swaylock ~/dotfiles/swaylock/ ~/.config
    fi
    if [ -d ~/dotfiles/wlogout ]; then
        _installSymLink wlogout ~/.config/wlogout ~/dotfiles/wlogout/ ~/.config
    fi
    if [ -d ~/dotfiles/gtk-3.0 ]; then
        _installSymLink gtk-3.0 ~/.config/gtk-3.0 ~/dotfiles/gtk-3.0/ ~/.config
    fi
    if [ -d ~/dotfiles/neofetch ]; then
        _installSymLink neofetch ~/.config/neofetch ~/dotfiles/neofetch/ ~/.config
    fi
    if [ -d ~/dotfiles/kitty ]; then
        _installSymLink kitty ~/.config/kitty ~/dotfiles/kitty/ ~/.config
    fi
    if [ -d ~/dotfiles/wofi ]; then
        _installSymLink wofi ~/.config/wofi ~/dotfiles/wofi/ ~.config
    fi
    
else
    echo "Skipped: DEV MODE!"
fi
echo "Symbolic links created."
echo ""

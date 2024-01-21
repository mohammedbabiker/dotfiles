# Install dotfiles

if [ ! $mode == "dev" ]; then
    if [ -d ~/mohmd-Hyprland-Dotfile/vim ]; then
        _installSymLink vim ~/.config/vim ~/mohmd-Hyprland-Dotfile/vim/ ~/.config
    fi
    if [ -d ~/mohmd-Hyprland-Dotfile/nvim ]; then
        _installSymLink nvim ~/.config/nvim ~/mohmd-Hyprland-Dotfile/nvim/ ~/.config
    fi
    if [ -d ~/mohmd-Hyprland-Dotfile/btop ]; then
        _installSymLink btop ~/.config/btop ~/mohmd-Hyprland-Dotfile/btop/ ~/.config
    fi
    if [ -d ~/mohmd-Hyprland-Dotfile/rofi ]; then
        _installSymLink rofi ~/.config/rofi ~/mohmd-Hyprland-Dotfile/rofi/ ~/.config
    fi
    if [ -d ~/mohmd-Hyprland-Dotfile/dunst ]; then
        _installSymLink dunst ~/.config/dunst ~/mohmd-Hyprland-Dotfile/dunst/ ~/.config
    fi
    if [ -d ~/mohmd-Hyprland-Dotfile/hypr ]; then
        _installSymLink hypr ~/.config/hypr ~/mohmd-Hyprland-Dotfile/hypr/ ~/.config
    fi
    if [ -d ~/mohmd-Hyprland-Dotfile/waybar ]; then
        _installSymLink waybar ~/.config/waybar ~/mohmd-Hyprland-Dotfile/waybar/ ~/.config
    fi
    if [ -d ~/mohmd-Hyprland-Dotfile/swaylock ]; then
        _installSymLink swaylock ~/.config/swaylock ~/mohmd-Hyprland-Dotfile/swaylock/ ~/.config
    fi
    if [ -d ~/mohmd-Hyprland-Dotfile/wlogout ]; then
        _installSymLink wlogout ~/.config/wlogout ~/mohmd-Hyprland-Dotfile/wlogout/ ~/.config
    fi
    if [ -d ~/mohmd-Hyprland-Dotfile/gtk-3.0 ]; then
        _installSymLink gtk-3.0 ~/.config/gtk-3.0 ~/mohmd-Hyprland-Dotfile/gtk-3.0/ ~/.config
    fi
    if [ -d ~/mohmd-Hyprland-Dotfile/neofetch ]; then
        _installSymLink neofetch ~/.config/neofetch ~/mohmd-Hyprland-Dotfile/neofetch/ ~/.config
    fi
    if [ -d ~/mohmd-Hyprland-Dotfile/kitty ]; then
        _installSymLink kitty ~/.config/kitty ~/mohmd-Hyprland-Dotfile/kitty/ ~/.config
    fi
    if [ -d ~/mohmd-Hyprland-Dotfile/wofi ]; then
        _installSymLink wofi ~/.config/wofi ~/mohmd-Hyprland-Dotfie/wofi/ ~.config
    fi
    
else
    echo "Skipped: DEV MODE!"
fi
echo "Symbolic links created."
echo ""

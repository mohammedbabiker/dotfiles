# dotfiles

> Open For Any Suggestions

### PLEASE NOTE: This branch is the rolling release of the dotfiles and includes the latest changes.

## Screenshot
![image](./assets/screenshot.png)

## Details
- **OS**: Arch Linux
- **Compositor**: [Hyprland](https://github.com/hyprwm/Hyprland)
- **Notifications**: [Dunst](https://github.com/dunst-project/dunst)
- **Wallpaper Loader**: [Hyprpaper](https://github.com/hyprwm/hyprpaper)
- **Terminal**: [Kitty](https://github.com/kovidgoyal/kitty)
- **Search menu**: [Rofi](https://github.com/davatorium/rofi)
- **Fetch script**: `Neofetch`
- **Browser**: Firefox
- **Editor**: NVIM
- **Icons**: Font Awesome
- **Font**: [Nerd Font](https://www.nerdfonts.com/)

## Supported platforms

This dotfiles are tested with the following Arch based distributions:

- Arch Linux (recommended)

But the installation should wor'gitsigns').setup()k on all Arch Linux based distributions as well.

## Dependencies & apps

```sh
yay --needed -S pacman-contrib hyprland-git bluez bluez-utils rofi dunst \ 
xfce4-power-manager thunar ttf-ms-fonts noto-fonts \ 
figlet vlc eza python-pip ttf-font-awesome \
python-psutil python-rich python-click pavucontrol xautolock blueman \
brightnessctl gum xdg-desktop-portal nm-connection-editor gvfs lazygit \
networkmanager network-manager-applet pamixer grim unzip \
rofi-emoji hyprpaper-git swaylock-effects dracula-icons-git\
ffmpegthumbnailer swayidle wlogout trizen bibata-cursor-theme waybar \
nmg-look xpad jq net-tools wlsunset delve swappy rsync
```
## Installations
```sh
git clone https://github.com/mohammedbabiker/dotfiles.git
cd dotfiles
cp -r ./* ~/.config/
```
## Keybinds
All keybinds can be found in the `hypr/keybindings.conf` config file
- `SUPER+SPACE`: Application Launcher (rofi)
- `SUPER+CTRL+M`: Quit Hyprland
- `SUPER+1,..9`: Switch workspace
- `SUPER+SHIFT+1,..9`: Move window to workspace
- `SUPER+Q`: Kitty
- `SUPER+ALT+X`: Firefox
- `SUPER+E`: Filemanager (thunar)
- `SUPER+PRINT`: Take a Screenshot

## Credits

Inspired by 
- [Stephan Raabe](https://gitlab.com/stephan-raabe/dotfiles)
- [Roshan Paudel](https://github.com/hyper-dot/Arch-Hyprland)
- [SolDoesTech](https://github.com/SolDoesTech/hyprland)
- [Chris Power](https://github.com/cpow/neovim-for-newbs) `nvim`

and many more...


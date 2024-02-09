#!/bin/bash
# ln -s ~/dotfiles/* ~/.config
source .install/library.sh
clear

# Set installation mode
mode="live"
if [ ! -z $1 ]; then
  mode="dev"
  echo "IMPORTANT: DEV MODE ACTIVATED."
  echo "Existing dotfiles folder will not be modified."
  echo "Symbolic link will not be created."
fi

echo "by Mohammed babiker"
echo ""
if [ -d ~/dotfiles ] ;then
  echo "Dotfile installation has been detected."
else
  echo "This script will giude you through installation process."
fi
echo ""
source .install/required.sh
source .install/confirm-start.sh
source .install/backup.sh
source .install/yay.sh
source .install/profile.sh
if [[ $profile == *"Hyprland"* ]]; then
  source .install/hyprland-version.sh
fi

source .install/installer.sh

source .install/general-packages.sh
source .install/install-packages.sh

if [[ $profile == *"Hyprland"* ]]; then
  source .install/hyprland-packages.sh
  source .install/install-packages.sh
fi

source .isntall/copy.sh
source .install/config-folder.sh

if [[ $profile == *"Hyprland"* ]]; then
  source .install/hyprland-dotfiles.sh
fi

source .install/cleanup.sh
source .install/done.sh

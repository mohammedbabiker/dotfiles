#!/bin/bash
# ln -s ~/mohmd-Hyprland-Dotfile/* ~/.config

# Set installation mode
mode="live"
if [ ! -z $1 ]; then
  mode="dev"
  echo "IMPORTANT: DEV MODE ACTIVATED."
  echo "Existing mohmd-Hyprland-Dotfile folder will not be modified."
  echo "Symbolic link will not be created."
fi1

echo "by Mohammed babiker"
echo ""
if [ -d ~/mohmd-Hyprland-Dotfile ] ;then
  echo "Dotfile installation has been detected."
else
  echo "This script will giude you through installation process."
fi
echo ""
source .install/required.sh
source .install/confirm-start.sh
source .install/backup.sh
source .install/yay.sh
source .install.profile.sh
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
if [[ $profile == *"Hyprland"* ]]; then
  source .install/hyprland-mohmd-Hyprland-Dotfile.sh
fi

source .install/cleanup.sh
source .install/done.sh

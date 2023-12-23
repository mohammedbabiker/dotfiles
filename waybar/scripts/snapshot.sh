#!/bin/bash

c=$(gum input --placeholder "Enter a comment for the snapshot...")
sudo timeshift --create --comments "$c"
sudo timeshift --list
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "DONE. Snapshot $c created!"

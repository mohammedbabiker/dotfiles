#!/bin/bash
sleep 1
clear

_isInstalledYay() {
    package="$1";
    check="$(yay -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

# Confirm Start

if gum confirm "DO YOU WANT TO START THE UPDATE NOW?" ;then
    echo "Update started."
elif [ $? -eq 130 ]; then
        exit 130
else
    echo "Update canceled."
    exit;
fi
echo ""

if [[ $(_isInstalledYay "Timeshift") == 1 ]] ;then
    if gum confirm "DO YOU WANT TO CREATE A SNAPSHOT?" ;then
        echo ""
        c=$(gum input --placeholder "Enter a comment for the snapshot...")
        sudo timeshift --create --comments "$c"
        sudo timeshift --list
        sudo grub-mkconfig -o /boot/grub/grub.cfg
        echo "DONE. Snapshot $c created!"
        echo ""
    elif [ $? -eq 130 ]; then
        echo "Snapshot canceled."
        exit 130
    else
        echo "Snapshot canceled."
    fi
    echo ""
fi

echo "Start update"
echo ""

yay

notify-send "Update complete"

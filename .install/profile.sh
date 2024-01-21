# Select installation profile

echo "SPACE = select/unselect a profile. RETURN = confirm. No selection = CANCEL"
profile=$(gum choose --no-limit --cursor-prefix "( ) " --selected-prefix "(x) " --unselected-prefix "( ) " "Hyprland")
if [ -z $profile ] ;then
    echo "No profile selected. Installation canceled."
    exit
else
    echo "Profile/s selected: $profile"
fi


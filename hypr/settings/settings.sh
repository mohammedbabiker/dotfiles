#!/bin/bash

_settingsCustom() {
    clear

    filevalue=$(gum write --show-line-numbers --height 15 --width 70 --value="$(cat ~/dotfiles/hypr/conf/custom.conf)")
    clear
   
    if gum confirm "Do you want to save your changes into ~/dotfiles/hypr/conf/custom.conf?" ;then
        echo "$filevalue" > ~/dotfiles/hypr/conf/custom.conf
    fi
    _settingsMenu
}

_settingsDecoration() {
    clear
                                 
    cur=$(cat ~/dotfiles/hypr/conf/decoration.conf)
    echo "In use: ${cur##*/}"
    echo ""
    echo "Select a file to load (RETURN = Confirm, ESC = Cancel/Back):"
    sel=$(gum file ~/dotfiles/hypr/conf/decorations/)
    if [ ! -z $sel ] ;then
        sel=$(echo "$sel" | sed "s+"\/home\/$USER"+~+")
        echo "source = $sel" > ~/dotfiles/hypr/conf/decoration.conf
        _settingsDecoration
    fi
    _settingsMenu
}

_settingsWindow() {
    clear
                                    
    cur=$(cat ~/dotfiles/hypr/conf/window.conf)
    echo "In use: ${cur##*/}"
    echo ""
    echo "Select a file to load (RETURN = Confirm, ESC = Cancel/Back):"
    sel=$(gum file ~/dotfiles/hypr/conf/windows/)
    if [ ! -z $sel ] ;then
        sel=$(echo "$sel" | sed "s+"\/home\/$USER"+~+")
        echo "source = $sel" > ~/dotfiles/hypr/conf/window.conf
        _settingsWindow
    fi
    _settingsMenu
}

_settingsAnimation() {
    clear
                                          
    cur=$(cat ~/dotfiles/hypr/conf/animation.conf)
    echo "In use: ${cur##*/}"
    echo ""
    echo "Select a file to load (RETURN = Confirm, ESC = Cancel/Back):"
    sel=$(gum file ~/dotfiles/hypr/conf/animations/)
    if [ ! -z $sel ] ;then
        sel=$(echo "$sel" | sed "s+"\/home\/$USER"+~+")
        echo "source = $sel" > ~/dotfiles/hypr/conf/animation.conf
        _settingsAnimation
    fi
    _settingsMenu
}

_settingsMonitor() {
    clear
                                   
    cur=$(cat ~/dotfiles/hypr/conf/monitor.conf)
    echo "In use: ${cur##*/}"
    echo ""
    echo "Select a file to load (RETURN = Confirm, ESC = Cancel/Back):"
    sel=$(gum file ~/dotfiles/hypr/conf/monitors/)
    if [ ! -z $sel ] ;then
        sel=$(echo "$sel" | sed "s+"\/home\/$USER"+~+")
        echo "source = $sel" > ~/dotfiles/hypr/conf/monitor.conf
    fi
    _settingsMenu
}

_settingsEnvironment() {
    clear
                                                       
    cur=$(cat ~/dotfiles/hypr/conf/environment.conf)
    echo "In use: ${cur##*/}"
    echo ""
    echo "Please restart Hyprland after changing the environment."
    echo "If you select KVM it's recommended to shutdown your system and start again."
    echo ""
    echo "Select a file to load (RETURN = Confirm, ESC = Cancel/Back):"
    sel=$(gum file ~/dotfiles/hypr/conf/environments/)
    if [ ! -z $sel ] ;then
        sel=$(echo "$sel" | sed "s+"\/home\/$USER"+~+")
        echo "source = $sel" > ~/dotfiles/hypr/conf/environment.conf
    fi
    _settingsMenu
}

_settingsKeybinding() {
    clear

    cur=$(cat ~/dotfiles/hypr/conf/keybinding.conf)
    echo "In use: ${cur##*/}"
    echo ""
    echo "Select a file to load (RETURN = Confirm, ESC = Cancel/Back):"
    sel=$(gum file ~/dotfiles/hypr/conf/keybindings/)
    if [ ! -z $sel ] ;then
        sel=$(echo "$sel" | sed "s+"\/home\/$USER"+~+")
        echo "source = $sel" > ~/dotfiles/hypr/conf/keybinding.conf
    fi
    _settingsMenu
}

_settingsWindowrule() {
    clear
                                                        
    cur=$(cat ~/dotfiles/hypr/conf/windowrule.conf)
    echo "In use: ${cur##*/}"
    echo ""
    echo "Select a file to load (RETURN = Confirm, ESC = Cancel/Back):"
    sel=$(gum file ~/dotfiles/hypr/conf/windowrules/)
    if [ ! -z $sel ] ;then
        sel=$(echo "$sel" | sed "s+"\/home\/$USER"+~+")
        echo "source = $sel" > ~/dotfiles/hypr/conf/windowrule.conf
    fi
    _settingsMenu
}

_settingsMenu() {
    clear
    if [ -f ~/dotfiles/version ] ;then
        echo "Version: $(cat ~/dotfiles/version)"
        echo ""
    fi
    menu=$(gum choose "Decorations" "Windows" "Animations" "Monitors" "Environments" "Keybindings" "Windowrules" "Custom" "EXIT")
    case $menu in
        Decorations)
            _settingsDecoration
        break;;
        Windows) 
            _settingsWindow
        break;;
        Animations) 
            _settingsAnimation
        break;;
        Monitors) 
            _settingsMonitor
        break;;
        Environments) 
            _settingsEnvironment
        break;;
        Keybindings) 
            _settingsKeybinding
        break;;
        Windowrules) 
            _settingsWindowrule
        break;;
        Custom) 
            _settingsCustom
        break;;
        * ) 
            exit
        ;;
    esac
}

_settingsMenu

# Check required packages for installation

sudo pacman -Sy
echo ""

# Check required package
echo ":: Checking that required packages for the installation are installed..."
_installPackagesPacman "rsync" "gum" "figlet";
echo ""

# Double check rsync
if ! command -v rsync &> /dev/null; then
    echo ":: Force rsync installation"
    sudo pacman -S rsync --noconfirm
else
    echo ":: rsync double checked"
fi
echo ""


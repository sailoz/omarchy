echo "Installing python-gobject"

if ! pacman -Q python-gobject &>/dev/null; then
  yay -S --noconfirm --needed python-gobject
fi

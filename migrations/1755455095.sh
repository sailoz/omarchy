echo "Installing python-poetry-core"

if ! pacman -Q python-poetry-core &>/dev/null; then
  yay -S --noconfirm --needed python-poetry-core
fi

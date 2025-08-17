#!/usr/bin/env bash
set -e

echo "--- Logging System State Before Installation ---"

# Install fastfetch if it's not present for a detailed report
if ! command -v fastfetch &>/dev/null; then
  echo "Info: fastfetch not found. Installing..."
  sudo pacman -S --noconfirm fastfetch
fi

# Capture system details
echo -e "\n--- fastfetch System Overview ---"
fastfetch

# Capture system logs for the current boot
echo -e "\n--- Journalctl (Current Boot) ---"
journalctl -b --no-pager

# Capture list of installed packages and their versions
echo -e "\n--- Pacman Packages (Before Installation) ---"
echo "Total packages installed: $(pacman -Q | wc -l)"
pacman -Q

#!/usr/bin/env bash
set -e

echo "--- Logging System State After Installation ---"

# Capture list and count of installed packages
echo -e "\n--- Pacman Packages (After Installation) ---"
echo "Total packages installed: $(pacman -Q | wc -l)"
pacman -Q

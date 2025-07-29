#!/bin/bash

# Install batsignal
if ! command -v batsignal &>/dev/null; then
  yay -S --noconfirm --needed batsignal
fi

# Enable Battery warning
# https://github.com/electrickite/batsignal
if [[ -f ~/.config/systemd/user/batsignal.service.d/options.conf ]]; then
  mkdir -p mkdir -p ~/.config/systemd/user/batsignal.service.d
  printf '[Service]\nExecStart=\nExecStart=batsignal -c 10 -w 30 -f 97' >~/.config/systemd/user/batsignal.service.d/options.conf
fi

if upower -e | grep BAT &>/dev/null; then
  if ! pidof -x batsignal &>/dev/null; then
    systemctl --user enable batsignal.service
    systemctl --user start batsignal.service
  fi
fi

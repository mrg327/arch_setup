#!/usr/bin/env bash

##
# MacBook Arch Workarounds Script
#

# Make sure we run as root (or comment out if you prefer manual sudo).
if [[ $EUID -ne 0 ]]; then
   echo "This script needs to be run as root (or with sudo)."
   exit 1
fi

##################################
# 1) MacBook audio workaround
##################################
read -p "Install macbook audio workaround (y/n)?: " audio
if [[ "$audio" == "y" ]]; then
  # Install dependencies if needed
  # pacman -S --needed git base-devel

  cd ~/Downloads || exit
  git clone https://github.com/davidjo/snd_hda_macbookpro.git
  cd snd_hda_macbookpro || exit

  # This script from the repo should compile & install the driver
  # Make sure it has +x permissions
  chmod +x install.cirrus.driver.sh
  ./install.cirrus.driver.sh

  cd ~ || exit
  echo "MacBook Cirrus audio driver installed."
fi

##################################
# 2) Install Neovim
##################################
read -p "Install Neovim 10.2 (y/n)?: " neovim
if [[ "$neovim" == "y" ]]; then
  # If your Neovim binary is in the current directory:
  # adjust $PWD or path to wherever your local nvim is
  if [[ -f "$PWD/nvim" ]]; then
    cp "$PWD/nvim" /usr/bin/nvim
    chmod +x /usr/bin/nvim
  else
    echo "Could not find $PWD/nvim. Adjust this path to your local binary."
  fi

  # Kickstart config (example)
  git clone git@github.com:mrg327/kickstart.nvim.git ~/.config/nvim
  echo "Neovim and kickstart.nvim installed."
fi

##################################
# 3) Bluetooth workaround
##################################
read -p "Install macbook bluetooth workaround (y/n)?: " bluetooth
if [[ "$bluetooth" == "y" ]]; then
  # pacman -S --needed git bluez bluez-utils bluez-hid2hci
  cd ~/Downloads || exit
  git clone https://github.com/leifliddy/macbook12-bluetooth-driver.git
  cd macbook12-bluetooth-driver || exit
  ./install.bluetooth.sh

  # In some cases, you might need to compile or add a DKMS module
  # For example, if there's a PKGBUILD, you'd do:
  # makepkg -si
  # Or if there's a script, run it similarly:
  # chmod +x some-script.sh
  # ./some-script.sh

  echo "Bluetooth driver workaround installed."
  echo "Remember to enable and start bluetooth service:"
  echo "  systemctl enable bluetooth"
  echo "  systemctl start bluetooth"
fi

echo "All done. Remember to address any additional steps as indicated."

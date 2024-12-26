# NOTE: This will get audio to work on Mac
# Download and install the cirrus audio drivers for Macbook

read -p "Install macbook audio workaround (y/n)?: " audio
if [[$audio == "y"]]; then
cd ~/Downloads
git clone https://github.com/davidjo/snd_hda_macbookpro.git ~/Downloads/snd_hda_macbookpro
cd ~/Downloads/snd_hda_macbookpro
./install.cirrus.driver.sh
cd ~
fi

read -p "Install Neovim 10.2 (y/n)?: " neovim
if [[$neovim == "y"]]; then
pacman -S neovim
fi

# NOTE: TO get bluetooth working
read -p "Install macbook bluetooth workaround (y/n)?: " bluetooth 
if [[$bluetooth == "y"]]; then
git clone https://github.com/leifliddy/macbook12-bluetooth-driver.git ~/Downloads/macbook12-bluetooth-driver/
cd ~/Downloads/macbook12-bluetooth-driver/ 
pacman -S bluez blues-utils bluez-hid2hci
fi

# TODO: Fix env issues with arch macbook
# [x] Get audio working
# [x] Get bluetooth working
# [ ] Make it so suspending the system does not require power off

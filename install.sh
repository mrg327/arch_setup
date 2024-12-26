# NOTE: This will get audio to work on Mac
# Download and install the cirrus audio drivers for Macbook
cd ~/Downloads
git clone https://github.com/davidjo/snd_hda_macbookpro.git ~/Downloads/snd_hda_macbookpro
cd ~/Downloads/snd_hda_macbookpro
./install.cirrus.driver.sh
cd ~

pacman -S gcc linux-headers make patch wget

pacman -S neovim

# NOTE: TO get bluetooth working
git clone https://github.com/leifliddy/macbook12-bluetooth-driver.git ~/Downloads/macbook12-bluetooth-driver/
cd ~/Downloads/macbook12-bluetooth-driver/
pacman -S bluez-hid2hci

# TODO: Fix env issues with arch macbook
# [x] Get audio working
# [x] Get bluetooth working
# [ ] Make it so suspending the system does not require power off

# NOTE: This will get audio to work on Mac
# Download and install the cirrus audio drivers for Macbook
cd ~/Downloads
git clone https://github.com/davidjo/snd_hda_macbookpro.git ~/Downloads/
cd ~/Downloads/snd_hda_macbookpro
./install.cirrus.driver.sh
cd ~

pacman -S gcc linux-headers make patch wget

pacman -S neovim

# TODO: Fix env issues with arch macbook
# [ ] Get bluetooth working
# [ ] Make it so suspending the system does not require power off

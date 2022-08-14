#mv /media/kenter/UNTITLED/* ./
#sudo sh xfcesetup.sh 

sudo apt -y update
sudo apt -y upgrade
sudo update-grub
sudo apt -y remove firefox

#install-----------------------------
sudo apt -y install default-jdk
sudo apt -y install ./first/zoom_amd64.deb 

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt -y update
sudo apt -y install brave-browser

#sudo sh first/VMware-Player-*.bundle
sudo apt -y install chrome-gnome-shell
sudo apt -y install ibus-mozc
sudo apt -y install mpg321
#sudo apt -y install imagemagick
sudo apt -y install r-base
#sudo apt -y install ./first/rstudio*.deb
sudo apt -y install fcitx fcitx-mozc --install-recommends
sudo apt -y install tree
sudo apt -y install x11vnc
sudo apt -y install vim
sudo apt -y install python3-django
sudo apt -y install python3-numpy

sudo apt-get -y autoremove
sudo apt -y clean

#edit & mv files-----------------------------
mv bashrc .bashrc
source ~/.bashrc
sudo apt -y install emacs-nox
mkdir .emacs.d
mv init.el .emacs.d/
mv user-dirs.dirs .config/
mv Desktop .Desktop
mv Downloads .Downloads
mv Public .Public
rm -r Templates Documents Music Pictures Videos
mkdir downloads
sudo mv main.conf /etc/bluetooth
mv terminalrc .config/xfce4/terminal/

#curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.vim ~/.vim/autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mv plug.vim ~/.vim/autoload
mv vimrc .vimrc
sudo mv grub /etc/default/
sudo update-grub

#configure system settings-----------------------------
xfconf-query -c xfce4-notifyd -p /do-not-disturb -s true
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'mozc-jp')]"
timedatectl set-timezone Asia/Tokyo
gsettings set org.gnome.desktop.background picture-options scaled
xfconf-query -c xfce4-session -p /general/SaveOnExit -s false
xfconf-query -c xsettings -p /Net/ThemeName -s Greybird-dark-mx
xfconf-query -c xsettings -p /Xft/DPI -s 120
xfconf-query -c xsettings -p /Gtk/KeyThemeName -s Emacs

sudo pm-powersave false
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.search-providers disable-external true
xfconf-query -c xfce4-desktop -np '/desktop-icons/style' -t 'int' -s '0'
conkytoggle.sh

sudo reboot
"""
settings
	keyboard shortcuts
		web browser
		settings
		hide all normal windows
		close window
		save a screenshot to kenter =shift ctrl 3

emacs
	M-x package install company

brave-browser
	bravepasswd from onedrive
  	remove all history & autofill form data on exit
	Don't allow sites to send notifications
	sync everything
	appearance=dark
		disable always show bookmarks
		hide brave rewards button
		disable show tab search button
	#enable speedreader
	enable
		https://extensions.gnome.org/extension/1131/
		https://extensions.gnome.org/extension/1471/
	new tab page -> new tabs page shows blank page

desk changer
	profiles -> location URI
		remove item /usr/share/*
		add folder ./pictures/wallpaper
	daemon 30 min interval

printer
	Ctrl+P on brave browser
	Destination=see more
	Manage > Add > network printer > find network printer
	choose epson > forward > apply

	#print system dialog (> page setup > paper > paper size >) print

univ wifi eduroam
	authentication PEAP
	No CA certificate is required
	静大ID@shizuoka.ac.jp
	静大ID password

zoom
	settings
		video
			turn off~
		audio
			automatically~
			mute~

fcitx configuration
	input method -> + button
	uncheck [only show current language] -> mozc

switch input method by C-space by default
	right click input method icon on desktop menu bar -> configure -> global config
	trigger input method= super + space
	
workspaces
	layout
		number of workspaces 1

disable etc/bluetooth/main.conf?
"""

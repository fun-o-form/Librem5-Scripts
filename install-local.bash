# Simple script to quickly setup a new OS installation on a Librem5 with apps
# and settings I find useful. Your mileage may vary.

#!/bin/bash
set -e

# Simple method to allow the user to opt out of some installs
yes_or_no() {
    while true; do
    	# print message in green high intensity console code
    	echo -n -e "\033[1;92m $* \033[0m"
        read -p " [y/n]: " yn
        case $yn in
            [Yy]* ) return 0 ;; # Return 0 (success) for yes/Y
            [Nn]* ) return 1 ;; # Return 1 (failure) for no/N
            * ) echo "Please answer yes or no." ;; # Prompt again for invalid input
        esac
    done
}

# Let's us check if an app is already installed
app_not_found() {
	if command -v "$1" &> /dev/null; then
		return 1 # Success: App is installed
	else
		return 0 # Failure: App is not installed
	fi
}

echo "Script is tested on a Librem5 running Postmarket OS edge (25.12+) with Phosh UI. Other devices/OS's/versions might still work."

############### Settings ###############
if yes_or_no "Apply quality of life settings for mobile?"; then
	echo "Don't require pin for 5 minutes after blanking screen via power button"
	gsettings set org.gnome.desktop.screensaver lock-delay 300
	
	echo "Allow volume up to 150%"
	# Just noting the necessary environment variable in case it isn't exported automatically 
	#export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/10000/bus
	gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
	newVal=$(gsettings get org.gnome.desktop.sound allow-volume-above-100-percent)
	if [[ "$newVal" != "true" ]]; then
		echo "Failed to enable over amplification"
	fi
fi

############### Desktop Files ###############
if yes_or_no "Install useful scripts?"; then
	echo "Installing useful scripts as apps via desktop files"

	# Install icons used by our desktop file
	mkdir -p ~/.local/share/icons
	cp ./icons/*.png ~/.local/share/icons

	# Install desktop files
	mkdir -p ~/.local/share/applications
	cp ./applications/*.desktop ~/.local/share/applications

	# Install scripts used by our desktop files
	cp ./applications/toggle-display-when-docked.sh ~/.local/bin/
	chmod +x ~/.local/bin/toggle-display-when-docked.sh
fi

############### MusicDirPlayer ###############
if yes_or_no "Do you want to install MusicDirPlayer?"; then
	if app_not_found "java"; then
		echo "Installing Java"
		sudo apk add openjdk25-jre --no-interactive
	else
		echo "Java found, skipping install"
	fi
	wget github.com/fun-o-form/music-dir-player-java/releases/latest/download/music-dir-player.zip
	unzip music-dir-player.zip -d music-dir-player
	music-dir-player/install.sh
fi

############### GPS Apps ###############
if yes_or_no "Do you want to install GPS related apps?"; then
	echo "PureMaps, OSMScoutServer, and Satelitte"
	sudo flatpak install -y io.github.rinigus.PureMaps io.github.rinigus.OSMScoutServer page.codeberg.tpikonen.satellite
	
	echo "Adding current user to geoclue group so Satellite works"
	curUser=$(whoami)
	sudo usermod -aG geoclue ${curUser}
	echo "IMPORTANT: Reboot for group changes to take effect"
fi

############### Nextcloud Apps ###############
if yes_or_no "Do you want to install Nextcloud-related apps?"; then
	echo "Installing Errands (tasks) and Iotas (notes)"
	sudo flatpak install -y io.github.mrvladus.List org.gnome.World.Iotas
fi

############### Other Apps ###############
if yes_or_no "Do you want to other useful apps?"; then
	echo "Installing Feeds, AudioTube, and KWeather"
	sudo flatpak install -y org.gabmus.gfeeds org.kde.audiotube org.kde.kweather
	
	echo "Installing xrandr for wayland, needed for docking station display script"
	sudo apk add wlr-randr --no-interactive
fi

echo -e "\033[1;92m All done \033[0m"

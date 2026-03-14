# Librem5 Scripts

Contains scripts that make daily driving the Librem5 phone easier.

**Warning**: This repo is tested on:
  * PostmarketOS, edge version
  * Running Phosh
  * On the Librem5
  
It may work on other phones and Linux mobile versions but your mileage may vary.

## install-local.bash
This is your one stop shop for configuring your fresh OS install on your Librem5 phone. This script installs useful apps, applies gnome config changes, and provides several scripts as runnable apps to overcome obstacles in daily driving the Librem 5.

### Usage
```
ssh <phone-ip>
sudo apk add git
git clone https://github.com/fun-o-form/Librem5-Scripts.git
cd Librem5-Scripts
./install-local.bash
```

A collection of scripts and utilities that have made my life easier in daily driving the Librem5 with Postmarket OS (Phosh) installed. Update the paths in the *.desktop files as needed for your home directory.

### What does it do?
The script performs the following tasks. Each task has a yes/no prompt so you can skip individual tasks as desired.

1. Quality of life settings
	* **5 minute lock delay** - No pin required when unlocking your phone within 5 minutes of pressing the power button
	* **Volume up to 150%** - Louder speaker phone and notifcations
2. Useful scripts
	* <img src="./icons/bt.png" alt="BT Reset" height="30"> **BT Reset** - Manually resets the bluetooth device when the OS no longer sees it.
  	* <img src="./icons/phone-monitor.png" alt="Docked Display" height="30"> **Docked Display** - Turns off the phone display when an external monitor is connected which makes the external monitor the primary display.
 	* <img src="./icons/gps.png" alt="GNSS Share" height="30"> **GNSS Share** - Runs gnss share in the foreground so one or more GPS applications get the GPS feed.
3. Music Dir Player
	* Installs our Librem5 optimized offline mp3 player. See the [repo](https://github.com/fun-o-form/music-dir-player-java). 
4. GPS Apps
	* **PureMaps** - The best navigation application I have found
	* **OSM Scout Server** - Enables offline maps and navigation in PureMaps
	* **Satellite** - Displays GPS satellite reception to help with troubleshooting. Makes it very clear when you have a lock.
5. Nextcloud Apps  
 	* **Errands** - Synchronize your tasks with your Nextcloud instance.
 	* **Iotas** - Add, edit, delete notes stored on your Nextcloud instance.
6. Other Useful Apps
 	* **AudioTube** - Play music streamed from Youtube. Does not require Youtube premium.
  	* **Feeds** - The best RSS reader I have found for Linux mobile.
  	* **KWeather** - The best weather app for I have used so far. Has an adaptive layout.
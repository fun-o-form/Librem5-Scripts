# Librem5 Scripts

Contains scripts that make daily driving the Librem5 phone easier.

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

### Scripts as Apps
The following scripts are installable above. Each script has a desktop entry so they appear like full applications easily launchable from the phone user interface.

| script | Description |
| -- | -- |
| bt.desktop | Postmarket OS has an issue where the bluetooth device drops out. The OS thinks it is on but the device does not work and toggling the hardware kill switch won't help. Click this icon to reload the bluetooth driver. |
| gnss.desktop | In order to use GPS you need to run GNSS to share the location data. For some reason this service isn't run automatically in the background on PostmarketOS. Click this icon to start the service. Kill the app when you are done with GPS.|
| mdp.desktop | Launches the Music Directory Player, one of our other apps. |
| toggle-display-when-docked.* | When connecting the Librem5 to a docking station, the external monitor pops on and defaults to a secondary display. The tiny built-in monitor remains the primary. This script and desktop icon will turn off the built-in display if there is another display connected, thus your external display becomes primary which is what you want when using a docking station. |

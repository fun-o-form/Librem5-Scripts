A collection of scripts and utilities that have made my life easier in daily driving the Librem5 with Postmarket OS (Phosh) installed. Update the paths in the *.desktop files as needed for your home directory.

| -- | -- |
| bt.desktop | Postmarket OS has an issue where the bluetooth device drops out. The OS thinks it is on but the device does not work and toggling the hardware kill switch won't help. Click this icon to reload the bluetooth driver. |
| gnss.desktop | In order to use GPS you need to run GNSS to share the location data. For some reason this service isn't run automatically in the background on PostmarketOS. Click this icon to start the service. Kill the app when you are done with GPS.|
| mdp.desktop | Launches the Music Directory Player, one of our other apps. |
| toggle-display-when-docked.* | When connecting the Librem5 to a docking station, the external monitor pops on and defaults to a secondary display. The tiny built-in monitor remains the primary. This script and desktop icon will turn off the built-in display if there is another display connected, thus your external display becomes primary which is what you want when using a docking station. |

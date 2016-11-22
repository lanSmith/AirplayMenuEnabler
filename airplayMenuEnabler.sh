#!/bin/bash 

########## CONFIG ##########
IP_address=<IP OF DEVICE ON SSID NETWORK>
WiFi_Displays_Menu=<SSID WHERE MENU IS ENABLED>


########## MAGIC ##########
sleep 5
IP_Valid=true
ping -c 2 $IP_address &> /dev/null && SSID="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk '/ SSID: / {print $2}')" || IP_Valid=false

if [ "$SSID" == $WiFi_Displays_Menu ] && [ "$IP_Valid" == true ]; then
	echo "$(defaults write com.apple.systemuiserver 'NSStatusItem Visible com.apple.menuextra.airplay' -int 1)"
	echo "$(defaults write com.apple.systemuiserver menuExtras -array-add '/System/Library/CoreServices/Menu Extras/Displays.menu')"
	echo "$(defaults write com.apple.airplay showInMenuBarIfPresent -int 1)"
	echo "$(killall -HUP SystemUIServer)"
else
	echo "$(defaults write com.apple.systemuiserver 'NSStatusItem Visible com.apple.menuextra.airplay' -int 0)"
	echo "$(defaults write com.apple.systemuiserver menuExtras -array '/System/Library/CoreServices/Menu Extras/User.menu' '/System/Library/CoreServices/Menu Extras/Clock.menu' '/System/Library/CoreServices/Menu Extras/Battery.menu' '/System/Library/CoreServices/Menu Extras/AirPort.menu' '/System/Library/CoreServices/Menu Extras/Bluetooth.menu')"
	echo "$(defaults write com.apple.airplay showInMenuBarIfPresent -int 0)"
	echo "$(killall -HUP SystemUIServer)"
fi
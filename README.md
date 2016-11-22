# AirplayMenuEnabler
Small scripts and plist file to config your macOS machine to disable the Displays / Airplay menu from your menu bar when not connected to particular WiFi. 

SETUP:
1. clone repo  
2. copy .sh files to perment location (ie. ~/.helpers)  
3. edit 'airplayMenuEnabler.sh' to look for choosen SSID and a local device with static ip on network to ping (ie. gateway / router)  
4. edit 'airplayMenuWatchdog.sh' file to point to 'airplayMenuEnabler.sh'  
5. edit 'com.user.airplayMenuEnabler.plist' file to point to 'airplayMenuWatchdog.sh'  
6. copy plist file to '~/Library/LaunchAgents'  
  
TO START ON LOGIN:  
In terminal 'launchctl load ~/Library/LaunchAgents/com.user.airplayMenuEnabler.plist', then logout & login  
  
TO START IMMEDIATELY:  
In terminal 'launchctl start ~/Library/LaunchAgents/com.user.airplayMenuEnabler.plist'  


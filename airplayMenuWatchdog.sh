#!/bin/bash 
(echo -e "n.add State:/Network/Global/IPv4\nn.watch" & cat) | scutil | awk '/notification/ {system("<LOCATION OF airplayMenuEnabler.sh>")}'
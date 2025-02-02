#!/bin/bash

declare -A machines

#######
# Things to do:
# 1. List out all the MAC address and their IP address you want to ping.
# 2. Check if the default absolute path to etherwake and ping commands are correct.
# 3. Define the ethernet interface to send WOL package.
# 4. Run `chmod +x run.sh` to make this script executable.
# 5. (Optional) Add this script to crontab to run it periodically.
# crontab eg. -> * * * * * /bin/bash /path/to/run.sh
#######

# You can add multiple machines.
# machines["MAC_ADDR"]="IP_ADDR"
#machines["aa:aa:aa:aa:aa:aa"]="192.168.1.2"
#machines["bb:bb:bb:bb:bb:bb"]="192.168.1.3"

# Define the ethernet interface to use
# Check with `ip a`
eth_interface="eth1"

# Define the absolute path to the etherwake and ping commands
# You can find it by `which foo`
etherwake="/usr/sbin/etherwake"
ping="/bin/ping"

for mac in "${!machines[@]}"; do
    if ! $ping -c 1 -W 1 "${machines[$mac]}" &> /dev/null; then
        echo "Ping to ${machines[$mac]} failed."
        echo "Waking up $mac"
        $etherwake -i $eth_interface "$mac"
    fi
done

exit 0

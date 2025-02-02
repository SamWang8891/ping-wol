# ping-wol
Ping down? Wake it online!

This is a simple script that wakes machine online using wake-on-line when ping it failed.


## OS Tested 
- Debian 11

## Extra Software Requirement
- etherwake

## Things to do (also written in the script comment section)

### Modifying scipt
- List out all the MAC addresses and their IP address you want to ping.
- Check if the default absolute path to etherwake and ping commands are correct.
- Define the ethernet interface to send WOL package.

### Extra steps
- Run ```chmod +x run.sh``` to make this script executable.
- (Optional) Add this script to crontab to run it periodically. Note that the machine might need root/sudo power to run etherwake, so better added in the cronjob of root
```sh
sudo crontab -e
```
```sh
* * * * * /bin/bash /path/to/run.sh
```

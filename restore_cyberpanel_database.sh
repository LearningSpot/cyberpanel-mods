#!/bin/bash
## Download core cyberpanel database
(curl https://raw.githubusercontent.com/LearningSpot/cyberpanel-mods/refs/heads/main/cyberpanel.sql -o cyberpanel.sql || wget -q https://raw.githubusercontent.com/LearningSpot/cyberpanel-mods/refs/heads/main/cyberpanel.sql)
#Read mysql password
mysql_password=$(cat /etc/cyberpanel/mysqlPassword)

#Creates empty cyberpanel database if doesn't already exist 
mysql -u root -p"$mysql_password" cyberpanel -e "CREATE DATABASE IF NOT EXISTS cyberpanel;"

#Populates cyberpanel database with core database 
mysql -u root -p"$mysql_password" cyberpanel < cyberpanel.sql

#Deletes cyberpanel.sql (optional)
#rm -f cyberpanel.sql

#Restart cyberpanel
systemctl restart lscpd

#Generate new random cyberpanel password
newPassword=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
adminPass "$newPassword"
echo "Your cyberpanel admin password is: $newPassword"

#!/bin/bash
# delete lines in default virtual host requiring all denied 
sudo chmod 754 /etc/apache2/sites-available/000-default.conf
sed '/Require all denied/ d' </etc/apache2/sites-available/000-default.conf
sudo service  apache2 restart
#check with curl
curl http://192.168.100.10/

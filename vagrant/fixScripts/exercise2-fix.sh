#!/bin/bash

#add fix to exercise2 here
sudo ed -s /etc/hosts <<< $'g/www.ascii-art.de/d\nw'

curl http://www.ascii-art.de/ascii/ab/007.txt

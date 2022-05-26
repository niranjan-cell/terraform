#!/bin/bash
apt update
apt install apache2 -y
cd /var/www/html
echo "Hey this is niranjan web page" > index.html
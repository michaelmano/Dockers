#!/bin/bash
/etc/init.d/php7.0-fpm restart
/etc/init.d/nginx restart
/etc/init.d/mysql restart
if [ ! -f "/var/www/index.php" ]; then
  curl -O https://wordpress.org/latest.zip && unzip ./latest.zip && mv ./wordpress/* ./ && rm -rf ./latest.zip ./wordpress
fi
while true; do sleep 1000; done
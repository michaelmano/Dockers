#!/bin/bash
startServices() {
    /etc/init.d/php7.0-fpm restart
    /etc/init.d/nginx restart
    /etc/init.d/mysql restart
    while true; do sleep 1000; done
}
if [ ! -d "/var/www/public" ]; then
    cp -r /laravel/. /var/www && \
    sed -ie 's/DB_DATABASE=homestead/DB_DATABASE=docker/g' /var/www/.env && \
    sed -ie 's/DB_USERNAME=homestead/DB_USERNAME=docker/g' /var/www/.env && \
    sed -ie 's/DB_PASSWORD=secret/DB_PASSWORD=docker/g' /var/www/.env && \
    php /composer.phar update && \
    startServices
else
    startServices
fi
#!/bin/bash
/etc/init.d/php7.0-fpm restart
/etc/init.d/nginx restart
/etc/init.d/mysql restart
while true; do sleep 1000; done
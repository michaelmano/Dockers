#!/bin/bash

startServices() {
  /etc/init.d/php7.2-fpm start
  /etc/init.d/nginx start
  /etc/init.d/mysql start

  # The sleep method will stop docker from
  # exiting the shell immediately.
  #
  # https://stackoverflow.com/questions/28212380/why-docker-container-exits-immediately
  while true; do sleep 10000; done
}

moveApplication()
{
  cp -r /laravel/. /var/www \
  && sed -ie 's/DB_DATABASE=homestead/DB_DATABASE=docker/g' /var/www/.env \
  && sed -ie 's/DB_USERNAME=homestead/DB_USERNAME=docker/g' /var/www/.env \
  && sed -ie 's/DB_PASSWORD=secret/DB_PASSWORD=docker/g' /var/www/.env \
  && cd /var/www/ \
  && php /composer.phar du \
  && startServices
}

checkStatus()
{
  echo "Checking if the application exists."

  if [[ -z "${APPLICATION_EXISTS}" ]];
  then
    if [ -d "/var/www/public" ];
    then
      exportVariable
    else
      echo "Application does not exist, Moving to the /var/www folder now." \
      && moveApplication & exportVariable
    fi
  else
    echo "Application exists, Starting Services."
    startServices
  fi
}

exportVariable()
{
  APPLICATION_EXISTS=true \
  && echo 'export APPLICATION_EXISTS=true'  >> ~/.bashrc \
  && . ~/.bashrc
}

checkStatus

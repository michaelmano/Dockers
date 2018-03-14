#!/bin/bash

startServices() {
  /etc/init.d/php7.2-fpm restart
  /etc/init.d/nginx restart
  /etc/init.d/mysql restart

  # The sleep method will stop docker from
  # exiting the shell immediately.
  #
  # https://stackoverflow.com/questions/28212380/why-docker-container-exits-immediately
  while true; do sleep 1000; done
}

startServices

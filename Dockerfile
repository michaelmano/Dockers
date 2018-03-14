FROM debian:jessie
LABEL MAINTAINER="Michael Mano <michael.mano26@gmail.com>"

# Don't ask questions.
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y curl apt-transport-https lsb-release ca-certificates \
  && curl https://packages.sury.org/php/apt.gpg | apt-key add - \
  && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' \
  && curl -sL https://deb.nodesource.com/setup_9.x | bash - \
  && apt-get update && apt-get install -y --force-yes \
    php7.2 \
    php7.2-cli \
    php7.2-fpm \
    php7.2-common \
    php7.2-mysql \
    php7.2-xml \
    php7.2-zip \
    php7.2-mbstring \
    php7.2-opcache \
    php7.2-json \
    php7.2-readline \
    php7.2-sqlite3 \
    libphp-phpmailer \
    zip \
    git \
    nginx \
    mysql-server \
  && apt-get remove apache2 -y && \
    apt-get autoremove -y && \
    apt-get purge -y \
  && rm -rf /var/lib/apt/lists/* \
    /usr/share/doc/* \
    /usr/share/groff/* \
    /usr/share/info/* \
    /usr/share/linda/* \
    /usr/share/lintian/* \
    /usr/share/locale/* \
    /usr/share/man/* \
    /etc/nginx/sites-available/default \
  && /etc/init.d/mysql start \
  && mysql -e "CREATE DATABASE IF NOT EXISTS docker CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" && \
    mysql -e "CREATE USER 'docker'@'localhost' IDENTIFIED BY 'docker';" && \
    mysql -e "GRANT ALL PRIVILEGES ON * . * TO 'docker'@'localhost';" && \
    mysql -e "FLUSH PRIVILEGES;" \
  && sed -ie 's/listen = \/run\/php\/php7\.2-fpm\.sock/listen = \/var\/run\/php7\.2-fpm\.sock/g' /etc/php/7.2/fpm/pool.d/www.conf && \
    sed -ie 's/;cgi\.fix_pathinfo=1/cgi\.fix_pathinfo=0/g' /etc/php/7.2/fpm/php.ini \
  && curl -O https://getcomposer.org/installer \
  && php installer && \
    php composer.phar global require "laravel/installer" && \
    php composer.phar create-project --prefer-dist laravel/laravel laravel \
  && echo 'alias composer="/composer.phar"' >> ~/.bashrc && \
    echo 'alias phpunit="/var/www/vendor/bin/phpunit"' >> ~/.bashrc \
  && . ~/.bashrc


# Configuration files.
COPY root /
RUN chmod +x entrypoint.sh
VOLUME /var/www
WORKDIR /var/www
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]

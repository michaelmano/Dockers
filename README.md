Jessaveller
===========
### Debian Jessie with php7.0, MySQL 5.7 and Nginx built for Laravel.

## Getting Started

**Requirements**
- Docker
- Composer

First you must have composer installed on your current machine and globally require laravel/installer like so: ```
composer global require "laravel/installer"
```
and now you can create a new project by typing the following 
```composer create-project --prefer-dist laravel/laravel /path/you/like
```
replace /path/you/like. Now you can get Jessaveller up and running with the command below.
```
docker run --name jessaveller -itd -v /path/you/like:/var/www -p 80:80 -P michaelmano/laravel
```
The command will spin up a new docker container running on port 80, You can change this if you have multiple projects by altering the -p 80:80 to -p 8888:80 (8888 to any port you prefer).

## MySQL Details

- dbname: docker
- user:   docker
- pass:   docker
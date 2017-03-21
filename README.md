Dockers: Laravel
===========
### Debian Jessie with php7.0, MySQL 5.7 and Nginx built for Laravel.

## Getting Started

**Requirements**
- Docker
- Composer

First you must have composer installed on your current machine and globally require laravel/installer like so: 

```
composer global require "laravel/installer"
```
and now you can create a new project by typing the following:
```
composer create-project --prefer-dist laravel/laravel /path/you/like
```
replace /path/you/like. Now you can get your project up and running with the command below.
```
docker run --name name-of-project -itd -v /path/you/like:/var/www -p 80:80 -P michaelmano/laravel
```
The command will spin up a new docker container named name-of-project running on port 80, You can change this if you have multiple projects by altering the -p 80:80 to -p 8888:80 (8888 to any port you prefer).

When you need to run an artisan command do so like this:

```
docker exec -it name-of-project /bin/bash -c "php artisan migrate"
```
but i generally just keep a console open in the containers bash.. 
```
docker exec -it name-of-project /bin/bash
```
## MySQL Details

- dbname: docker
- user:   docker
- pass:   docker

## TODO

I'm thinking about including composer and installing Laravel automatically if there are no files in your project folder however it makes the image larger and I prefer to run composer commands from my main machine. Also it takes a longer time to run on the docker container than if you ran it on your main machine.

Or I could install composer and Laravel on build of the image and just create a Laravel project and then on first time running it will move the files over to the project folder.

but then it would be a slightly out of date version of Laravel (I could set up a web hook to build each time there is an update to Laravel)

let me know your thoughts.

Dockers: Laravel
===========
### Debian Jessie with php7.0, MySQL 5.7 and Nginx built for Laravel.

## Getting Started
You do not require any files except Docker installed.

If you are starting a new project from scratch this container will create a Laravel project in the path you provide it, If you have an existing project and you provide it the path it will not install Laravel but instead use your project. It will also update the .env file with the dockers MySQL details.

If you destory your docker when you are finished the files will be left on your computer so you will not lose anything (except the database however if you are using migrations and seeders you should be fine - if you require the database I suggest you do a mysql dump before hand with the dockers exec command).

## Commands

**Creating a Container**
The command below will spin up a new docker container named my-project running on port 80, You can change this if you have multiple projects by altering the -p 80:80 to -p 8888:80 (8888 to any port you prefer).
```
docker run --name my-project -itd -v /path/of/project:/var/www -p 80:80 -P michaelmano/laravel
```
**Running Commands on the Container**
```
docker exec -it my-project /bin/bash -c "php artisan migrate"
```
or open a console in the container
```
docker exec -it my-project /bin/bash
```
**Destroying a Container**
This will leave the project folder it was using so all files will be safe.
```
docker rm my-project -f
```
**Checking the Container Status**
```
docker ps -a
```
This will show the containers you have running and on which port however you can use dockers Kitematic which is a visual interface for this also.

## MySQL Details

- dbname: docker
- user:   docker
- pass:   docker

## TODO

- ~~Automatic install of laravel~~
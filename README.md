Dockers: Laravel
===========
### Debian Jessie with php7.0, MySQL 5.7 and Nginx built for Laravel.

## Getting Started

If you already have a project set up and want to link the docker to it this can be done. However if there is no project folder or it does not have a public folder the docker will create a new laravel project in the folder path you provide. 

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

- ~~Automatic install of laravel~~
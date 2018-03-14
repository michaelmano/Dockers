# Dockers: Debian Jessie

Debian Jessie with php7.2, MySQL 5.7 and Nginx

## Getting Started

You do not require any files except Docker installed.

If you have an existing project and you provide it the path it will look in that directory for a `public` folder.

* Your database will be removed if you destroy the container *

If you destory your docker when you are finished the files will be left on your computer, I suggest you do a mysql dump before hand with the dockers exec command.

The following will export the database into the project path you supplied.

```bash
docker exec -it my-project /bin/bash -c "mysqldump -udocker -pdocker docker > /var/www/database_backup.sql"
```

## Commands

### Creating a Container

The command below will spin up a new docker container named my-project running on port 80, You can change this if you have multiple projects by altering the -p 80:80 to -p 8888:80 (8888 to any port you prefer).

```bash
docker run --name my-project -itd -v /path/of/project:/var/www -p 80:80 -P michaelmano/laravel
```

### Running Commands on the Container

```bash
docker exec -it my-project /bin/bash -c "php artisan migrate"
```

or open a console in the container

```bash
docker exec -it my-project /bin/bash
```

### Destroying a Container

This will leave the project folder it was using so all files will be safe.

```bash
docker rm my-project -f
```

### Checking the Container Status

```bash
docker ps -a
```

This will show the containers you have running and on which port however you can use dockers Kitematic which is a visual interface for this also.

## MySQL Details

* dbname: docker
* user: docker
* pass: docker

## TODO

* clean up project

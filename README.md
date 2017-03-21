Dockers: Wordpress
===========
### Debian Jessie with php7.0, MySQL 5.7 and Nginx built for Wordpress.

## Getting Started
```
docker run --name name-of-project -itd -v /path/you/like:/var/www -p 80:80 -P michaelmano/wordpress
```
The command will spin up a new docker container running on port 80 and automatically download wordpress and extract it if the path you provide has no index.php, You can change this if you have multiple projects by altering the -p 80:80 to -p 8888:80 (8888 to any port you prefer).

## MySQL Details

- dbname: docker
- user:   docker
- pass:   docker

Once you have finished developing your project and for some reason you need to export the database you can do so with the command below: 
```
docker exec -it name-of-project /bin/bash -c "mysqldump docker > docker_wordpress.sql"
```
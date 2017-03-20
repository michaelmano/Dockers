Jessiepress
===========
### Debian Jessie with php7.0, MySQL 5.7 and Nginx built for Wordpress.

## Getting Started
```
docker run --name jessiepress -itd -v /path/you/like:/var/www -p 80:80 -P michaelmano/wordpress
```
It may take a while for the first time as you wont have the image locally so it will download it from dockerhub. but you can spin up projects fast after as it will be saved.

The command will spin up a new docker container running on port 80, You can change this if you have multiple projects by altering the -p 80:80 to -p 8888:80 (8888 to any port you prefer).

## MySQL Details

- dbname: docker
- user:   docker
- pass:   docker
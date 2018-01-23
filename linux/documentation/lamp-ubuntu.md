# Installing and setting up LAMP on ubuntu

    sudo apt install software-properties-common python-software-properties
    sudo add-apt-repository ppa:ondrej/php
    sudo apt update
    sudo apt install mariadb-server
    sudo apt install apache2
    sudo apt install php7.1

# Apache

1. Add VHOST files to /etc/apache2/sites-available (Disable SSL for now)
2. Add Webroot files to /var/www
3. Enable site (SITENAME is name of vhost conf file):

    sudo a2ensite [SITENAME]
    sudo systemctl restart apache2.service

## SSL (Letsencrypt)

    sudo a2enmod ssl
    sudo apt install letsencrypt
    sudo letsencrypt certonly -a webroot [WEBROOT_PATH] -d [DOMAIN]

SSL Cert will be in /etc/letsencrypt/live/[SITENAME]/fullchain.pem
Use that in SSL config for sites.

# MariaDB

    sudo mysql_secure_installation

## Back up SQL database

    mysqldump --all-databases -u root -p > backup.sql    

## Restore backed-up SQL database

    mysql -u root -p < backup.sql

## Privilege troubleshooting

`FLUSH PRIVILEGES` helped.

## Python

    sudo apt install libmysqlclient-dev
    sudo pip install mysqlclient
    sudo pip3 install mysqlclient

# PHP (7.1)

   sudo apt install php7.1-mysqli php7.1-curl php7.1-dom php7.1-xdebug

## Enable plugins:

Uncomment them in php.ini
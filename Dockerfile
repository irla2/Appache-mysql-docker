# Download base image ubuntu 16.04
FROM ubuntu:16.04

# Update Ubuntu Software repository
RUN apt-get update

# Install Vim, cUrl, lynx
RUN apt-get install -y vim && apt-get install -y curl && apt install -y lynx

# Install and run apache

# By default, Apache comes with a basic site (the one that we saw in the previous step) enabled. 
# We can modify its content in /var/www/html or settings by editing its Virtual Host file found in /etc/apache2/sites-enabled/000-default.conf.

RUN apt-get install -y apache2 && apt-get clean

# Install PHP:
RUN apt-get install -y php

# Then install common PHP extensions such as GD, MySQL, and so PDO.
RUN apt-get install -y php-bcmath && \ 
    apt-get install -y php-bz2 && \ 
    apt-get install -y php-intl && \ 
    apt-get install -y php-gd && \ 
    apt-get install -y php-mbstring && \ 
    apt-get install -y php-mcrypt && \ 
    apt-get install -y php-mysql && \ 
    apt-get install -y php-zip && \ 
    apt-get install -y php-pdo && \ 
    apt-get install -y libapache2-mod-php

# Set workdir https://docs.docker.com/engine/reference/builder/#workdir
WORKDIR /var/www/html

# Remove file
RUN rm ./index.html
COPY ./www ./

# By default start up apache in the foreground, override with /bin/bash for interative.
CMD ["apachectl", "-D",  "FOREGROUND"]

# Expose apache.
EXPOSE 80
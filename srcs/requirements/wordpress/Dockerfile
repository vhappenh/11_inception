FROM php:7.4-fpm-alpine

RUN	wget http://wordpress.org/latest.tar.gz -P /var/www
RUN	cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz
RUN mv -f /var/www/wordpress/* /var/www/html/
RUN chmod -R 755 /var/www/html


RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
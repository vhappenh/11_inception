FROM debian:bullseye

ENV DOMAIN_NAME=$DOMAIN_NAME

RUN apt update -y
RUN apt upgrade -y
RUN apt install wget -y
RUN apt install php7.4 -y
RUN apt install php-fpm -y
RUN apt install php-mysql -y

# COPY tools/auto_config.sh	/usr/bin/auto_config.sh
# RUN chmod +x /usr/bin/auto_config.sh

# ENTRYPOINT ["/usr/bin/auto_config.sh"]

# FROM php:7.4-fpm-alpine

# RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
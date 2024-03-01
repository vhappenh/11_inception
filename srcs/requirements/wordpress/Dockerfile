FROM debian:bullseye

ENV DOMAIN_NAME=$DOMAIN_NAME

RUN apt update -y
RUN apt upgrade -y
RUN apt install wget -y
RUN apt install php7.4 -y
RUN apt install php-fpm -y
RUN apt install php-mysql -y

COPY tools/auto_config.sh	/usr/bin/auto_config.sh
RUN chmod +x /usr/bin/auto_config.sh

CMD ["/usr/bin/auto_config.sh"]

# # Download and extract WordPress into /var/www/html
# RUN wget -q -O /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz && \
#     tar -xzf /tmp/latest.tar.gz -C /var/www/html --strip-components=1 && \
#     rm /tmp/latest.tar.gz
# Set proper ownership of the WordPress files
# RUN chown -R www-data:www-data /var/www/html

# CMD ["sleep", "infinity"]



# FROM php:7.4-fpm-alpine

# RUN	wget http://wordpress.org/latest.tar.gz -P /var/www
# RUN	cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz
# RUN mv -f /var/www/wordpress/* /var/www/html/
# # RUN chmod -R 755 /var/www/html


# RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
FROM debian:bullseye

ENV DOMAIN_NAME=$DOMAIN_NAME

RUN apt update -y
RUN apt upgrade -y
RUN apt install wget -y
RUN apt install php7.4 -y
RUN apt install php-fpm -y
RUN apt install php-mysql -y

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN mkdir -p /var/run/php/ \
    && chown www-data:www-data /var/run/php/

COPY tools/auto_config.sh	/usr/bin/auto_config.sh
RUN chmod +x /usr/bin/auto_config.sh

CMD ["/usr/bin/auto_config.sh"]
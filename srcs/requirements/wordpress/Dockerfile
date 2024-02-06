FROM debian:bullseye

ENV DOMAIN_NAME=$DOMAIN_NAME

RUN apt update -y
RUN apt upgrade -y
RUN apt install wget -y
RUN apt install php7.4 -y
RUN apt install php-fpm -y
RUN apt install php-mysql -y
RUN apt install mariadb-client -y

RUN wget http://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz
RUN	chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp --info

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY tools/auto_config.sh	/usr/bin/auto_config.sh
RUN chmod +x /usr/bin/auto_config.sh

ENTRYPOINT ["/usr/bin/auto_config.sh"]
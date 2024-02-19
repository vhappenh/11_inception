FROM debian:bullseye

ENV DOMAIN_NAME=$DOMAIN_NAME

RUN apt update -y
RUN apt upgrade -y
RUN apt install wget -y
RUN apt install php7.4 -y
RUN apt install php-fpm -y
RUN apt install php-mysql -y
RUN apt install mariadb-client -y

COPY tools/auto_config.sh	/usr/bin/auto_config.sh
RUN chmod +x /usr/bin/auto_config.sh

ENTRYPOINT ["/usr/bin/auto_config.sh"]
FROM debian:bullseye

ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

RUN apt update && apt upgrade
RUN apt install -y mariadb-server

RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb.sh /usr/bin/mariadb.sh
RUN chmod +x /usr/bin/mariadb.sh

CMD [ "/usr/bin/mariadb.sh" ]
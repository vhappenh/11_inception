FROM debian:bullseye

ENV SQL_DATABASE=$SQL_DATABASE
ENV SQL_USER=$SQL_USER
ENV SQL_PASSWORD=$SQL_PASSWORD
ENV SQL_ROOT_PASSWORD=$SQL_ROOT_PASSWORD

RUN apt update -y
RUN apt upgrade -y
RUN apt install vim -y
RUN apt install curl -y
RUN apt install systemd -y
RUN apt install mariadb-server -y
RUN apt install mariadb-client -y

COPY conf/50-server.cnf	/etc/mysql//my.cnf
RUN chmod +x /etc/mysql/my.cnf
COPY tools/mariadb.sh /usr/bin/mariadb.sh
RUN chmod +x /usr/bin/mariadb.sh

CMD [ "/usr/bin/mariadb.sh" ]
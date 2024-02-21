FROM debian:bullseye

ENV DOMAIN_NAME=$DOMAIN_NAME

RUN apt update -y
RUN apt upgrade -y
RUN apt install curl -y
RUN apt install nginx -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=AT/ST=W/L=Vienna/O=42/OU=42/CN=login.42.fr/UID=login"
RUN mkdir -p /var/run/nginx

#COPY /conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY /conf/nginx.conf /etc/nginx/conf.d/nginx.conf

RUN chmod -R +x /var/www/html
RUN chown -R www-data:www-data /var/www/html/

CMD [ "nginx", "-g", "daemon off;" ]
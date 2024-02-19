#!/bin/bash

echo waiting for 10 seconds . . .
sleep 10

if [ -f ./var/www/wordpress/wp-config.php ]
then
	echo "wordpress already downloaded and set up"
else
	wget http://wordpress.org/latest.tar.gz -P /var/www
	cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz
	chown -R root:root /var/www/wordpress

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp --info
	
	wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'
fi

mkdir -p /var/run/php
/usr/sbin/php-fpm7.4 -F
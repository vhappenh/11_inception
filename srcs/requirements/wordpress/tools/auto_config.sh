#!/bin/bash

echo waiting for 10 seconds . . .
sleep 10

if [ -f ./var/www/wordpress/wp-config.php ]
then
	echo "wordpress already downloaded and set up"
else
	wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'
	sudo -u www-data wp core install --url='http://example.com' --title='Blog Title' --admin_user='vhappenh' --admin_password='blub' --admin_email='email@domain.com'
fi

/usr/bin/php-fmp7.4 -F

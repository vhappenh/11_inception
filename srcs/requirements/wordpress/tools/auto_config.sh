#!/bin/bash

if [ -f ./var/www/wordpress/wp-config.php ]
then
	echo "wordpress already downloaded and set up"
else
	wget -q -O /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf /tmp/latest.tar.gz -C /var/www/html --strip-components=1 && \
    rm /tmp/latest.tar.gz

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	
	cd /var/www/html
	wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=$MYSQL_HOSTNAME

	wp core install --allow-root \
					--url=$DOMAIN_NAME \
					--title="Inception" \
					--admin_user=$MYSQL_USER \
					--admin_password=$MYSQL_ROOT_PASSWORD \
					--admin_email="blub@blub.com"

	wp user create --allow-root \
					$MYSQL_USER_TWO \
					$MYSQL_USER_TWO_MAIL \
					--role=subscriber \
					--user_pass=$MYSQL_PASSWORD_TWO
fi

mkdir -p /var/run/php
exec /usr/sbin/php-fpm7.4 -F
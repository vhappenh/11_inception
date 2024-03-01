#!/bin/bash

if [ -f ./var/www/wordpress/wp-config.php ]
then
	echo "wordpress already downloaded and set up"
else
	wget -q -O /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf /tmp/latest.tar.gz -C /var/www/html --strip-components=1 && \
    rm /tmp/latest.tar.gz
	# chown -R root:root /var/www/wordpress

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	
	echo waiting for 10 seconds . . .
	sleep 10
	
	cd /var/www/html
	wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=$MYSQL_HOSTNAME
	wp core install --allow-root \
					--url=$DOMAIN_NAME \
					--title="valeriansinceptionpalooza" \
					--admin_user=$MYSQL_USER \
					--admin_password=$MYSQL_ROOT_PASSWORD \
					--admin_email="blub@blub.com"
fi

mkdir -p /var/run/php
exec /usr/sbin/php-fpm7.4 -F
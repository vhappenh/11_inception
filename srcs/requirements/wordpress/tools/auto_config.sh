# #!/bin/bash

# cd /var/www/html

# mv wp-cli.phar /usr/local/bin/wp
# wp core download --allow-root
# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
# mv /wp-config.php /var/www/html/wp-config.php


# sed -i -r "s/db1/$db_name/1"   wp-config.php
# sed -i -r "s/user/$db_user/1"  wp-config.php
# sed -i -r "s/pwd/$db_pwd/1"    wp-config.php

# wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
# wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
# wp theme install astra --activate --allow-root
# wp plugin install redis-cache --activate --allow-root
# wp plugin update --all --allow-root
 
# sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# mkdir /run/php



# wp redis enable --allow-root

# /usr/sbin/php-fpm7.4 -F



# #!/bin/bash

# echo "Waiting for 10 seconds..."
# sleep 10

# # Check if wp-config.php already exists
# if [ -f /var/www/wordpress/wp-config.php ]; then
#     echo "WordPress already configured."
# else
# 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# 	chmod +x wp-cli.phar
# 	mv wp-cli.phar /usr/local/bin/wp
# 	wp core download --path=/var/www/wordpress --allow-root
# 	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --path=/var/www/wordpress --skip-check --allow-root
# 	wp core install --path=/var/www/wordpress --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --skip-email --allow-root
# 	wp theme install teluro --path=/var/www/wordpress --activate --allow-root
# 	wp user create newbie new@bie.com --role=author --path=/var/www/wordpress --user_pass=blub --allow-root
# fi

# # Start PHP-FPM
# /usr/sbin/php-fpm7.4 -F



# #!/bin/bash

# echo waiting for 10 seconds . . .
# sleep 10

# if [ -f ./var/www/wordpress/wp-config.php ]
# then
# 	echo "wordpress already downloaded and set up"
# else
# 	wp config create	--allow-root \
# 						--dbname=$SQL_DATABASE \
# 						--dbuser=$SQL_USER \
# 						--dbpass=$SQL_PASSWORD \
# 						--dbhost=mariadb:3306 --path='/var/www/wordpress'
# 	wp www-data 
# 	wp core install --url='http://example.com' --title='Blog Title' --admin_user='vhappenh' --admin_password='blub' --admin_email='email@domain.com'
# fi

# /usr/sbin/php-fpm7.4 -F

#!/bin/bash

service mariadb start
service mariadb status

echo "Creating database..."
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

echo "Creating user..."
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

echo "Granting privileges..."
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

echo "Alterin root user..."
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

echo "Flushing privileges..."
mysql -e "FLUSH PRIVILEGES;"

if service mariadb status > /dev/null; then
    echo "Shutting down MariaDB service..."
    mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
fi

exec mysqld
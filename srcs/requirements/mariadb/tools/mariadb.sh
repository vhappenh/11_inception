#!/bin/bash

# Start MariaDB service
service mariadb start

# Check MariaDB service status
service mariadb status

# Loop to wait until MariaDB service is ready
while ! mysqladmin ping -hlocalhost --silent; do
    sleep 1
done

# Execute administrative SQL commands as root
echo "Creating database..."
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

echo "Flushing privileges..."
mysql -e "FLUSH PRIVILEGES;"

echo "Altering old user..."
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

echo "Deleting anonymous user..."
# mysql -u root -pblub1234 -e "FROM mysql.user WHERE user='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "DELETE FROM mysql.user WHERE User='';"

echo "Creating user..."
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

echo "Granting privileges..."
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

echo "Flushing privileges..."
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# # Shutdown MariaDB service
if service mariadb status > /dev/null; then
    echo "Shutting down MariaDB service..."
    mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
fi

echo "Starting mysqld in safe mode..."
exec mysqld_safe

# exec mysqld --user=mysql --bind-address=0.0.0.0

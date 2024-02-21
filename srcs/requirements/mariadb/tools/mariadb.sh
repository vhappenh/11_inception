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
# echo "Creating database..."
# mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

echo "Creating user..."
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\` IDENTIFIED BY '${MYSQL_PASSWORD}';"

echo "Granting privileges..."
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

echo "Flushing privileges..."
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# echo "Create database..."
# mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "create database wp;"

# # Shutdown MariaDB service
if service mariadb status > /dev/null; then
    echo "Shutting down MariaDB service..."
    mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
fi

echo "Starting mysqld in safe mode..."
exec mysqld_safe

exec mysqld --user=mysql --bind-address=0.0.0.0

# #!/bin/bash

# service mariadb start
# service mariadb status

# # tail -f /dev/null

# echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
# echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~3~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~5~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# mysql -e "FLUSH PRIVILEGES;"
# echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~6~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
# echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~7~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# exec mysqld_safe

# mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
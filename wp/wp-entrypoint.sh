#!/bin/sh
sudo mv /var/www/wp-pre/* /var/www/wp
sudo mv /var/www/wp-pre/.??* /var/www/wp
sudo rm -rf /var/www/html /var/www/wp-pre

until sudo mysqladmin ping -h mysql --silent; do
    echo 'waiting for mysqld to be connectable...'
    sleep 3
done

sudo wp --allow-root core config --dbhost=mysql --dbuser=root --dbpass=${MYSQL_ROOT_PASSWORD} --dbname=${MYSQL_DATABASE} --dbprefix=wp_ --path=/var/www/wp
sudo wp --allow-root core install --url=localhost:8000 --title=test --admin_name=test --admin_email=test@test.com --admin_password=password --path=/var/www/wp
sudo chown -R 1000:1000 /var/www/wp
sudo php-fpm -F
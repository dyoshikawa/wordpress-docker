#!/bin/env bash
sudo mv /var/www/wp-pre/* /var/www/wp
sudo mv /var/www/wp-pre/.??* /var/www/wp
sudo rm -rf /var/www/html /var/www/wp-pre

until sudo mysqladmin ping -h mysql --silent; do
    echo 'waiting for mysqld to be connectable...'
    sleep 3
done

sudo wp --allow-root core config --dbhost=mysql --dbuser=root --dbpass=${MYSQL_ROOT_PASSWORD} --dbname=${MYSQL_DATABASE} \
        --dbprefix=${WORDPRESS_DBPREFIX} --path=/var/www/wp
sudo wp --allow-root core install --url=${WORDPRESS_URL} --title=${WORDPRESS_TITLE} --admin_name=${WORDPRESS_ADMINNAME} \
        --admin_email=${WORDPRESS_EMAIL}  --admin_password=${WORDPRESS_PASSWORD} --path=/var/www/wp
sudo chown -R 1000:1000 /var/www/wp
sudo php-fpm -F
#!/bin/sh
cd /var/www/wp-pre
wp --allow-root core config --dbhost=mysql --dbuser=root --dbpass=${MYSQL_ROOT_PASSWORD} --dbname=${MYSQL_DATABASE} --dbprefix=wp_
wp --allow-root core install --url=localhost:8000 --title=test --admin_name=test --admin_email=test@test.com --admin_password=password
mv /var/www/wp-pre/* /var/www/wp
mv /var/www/wp-pre/.??* /var/www/wp
rm -rf /var/www/html /var/www/wp-pre
chown -R 1000:1000 /var/www/wp
php-fpm -F
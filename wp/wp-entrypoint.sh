#!/bin/sh
mv /var/www/wp_pre/* /var/www/wp
mv /var/www/wp_pre/.??* /var/www/wp
rm -rf /var/www/html /var/www/wp_pre
chown -R 1000:1000 /var/www/wp
php-fpm -F
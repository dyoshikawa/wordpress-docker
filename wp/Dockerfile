FROM php:7.2-fpm-alpine

# add dockeruser and set php-fpm
RUN adduser -D -s /bin/sh -u 1000 dockeruser \
 && sed -i 's/user\ \=\ www-data/user\ \=\ dockeruser/g' /usr/local/etc/php-fpm.d/www.conf \
 && sed -i 's/group\ \=\ www-data/group\ \=\ dockeruser/g' /usr/local/etc/php-fpm.d/www.conf

# install mysql-extention
RUN apk --update add libjpeg-turbo-dev libpng-dev \
 && docker-php-ext-install mysqli pdo_mysql gd mbstring

# install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
 && chmod 777 wp-cli.phar \
 && mv wp-cli.phar /bin/wp

# install wp
RUN wp --allow-root core download --locale=ja --path=/var/www/wp-pre
# set pre-workdir
WORKDIR /var/www/wp-pre

# add .gitignore
ADD .gitignore .gitignore

# install wordmove
RUN apk add ruby ruby-dev ruby-rdoc ruby-bundler ruby-bigdecimal ruby-irb make gcc build-base \
 && gem install wordmove

# set workdir
RUN mkdir /var/www/wp
WORKDIR /var/www/wp

# setup entrypoint
RUN apk add mysql-client
ADD wp-entrypoint.sh /bin/wp-entrypoint.sh
RUN chmod 777 /bin/wp-entrypoint.sh
ENTRYPOINT ["wp-entrypoint.sh"]
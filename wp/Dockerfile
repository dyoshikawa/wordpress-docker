FROM php:fpm-alpine

# setup dockeruser
RUN adduser -D -s /bin/sh -u 1000 dockeruser \
 && sed -i 's/user\ \=\ www-data/user\ \=\ dockeruser/g' /usr/local/etc/php-fpm.d/www.conf \
 && sed -i 's/group\ \=\ www-data/group\ \=\ dockeruser/g' /usr/local/etc/php-fpm.d/www.conf

# mysql-extention
RUN apk update \
 && apk add libjpeg-turbo-dev libpng-dev \
 && docker-php-ext-install mysqli pdo_mysql gd mbstring

# install wordpress
ENV WORDPRESS_TAR_FILE wordpress-latest-ja.tar.gz
RUN curl -O https://ja.wordpress.org/${WORDPRESS_TAR_FILE} \
 && tar -xzf ${WORDPRESS_TAR_FILE} -C /var/www \
 && rm ${WORDPRESS_TAR_FILE} \
 && mv /var/www/wordpress /var/www/wp_pre
ADD .gitignore /var/www/wp_pre

# install wordmove
RUN apk add git ruby ruby-dev ruby-bundler make gcc build-base
RUN git clone https://github.com/welaika/wordmove /wordmove \
 && cd /wordmove \
 && bundle install \
 && bundle update

# setup entrypoint
RUN mkdir /var/www/wp
WORKDIR /var/www/wp
ADD wp-entrypoint.sh /bin/wp-entrypoint.sh
RUN chmod 777 /bin/wp-entrypoint.sh
ENTRYPOINT ["wp-entrypoint.sh"]
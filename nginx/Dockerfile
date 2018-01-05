FROM nginx:alpine

RUN adduser -D -s /bin/sh -u 1000 dockeruser
RUN sed -i 's/user\ \ nginx\;/user\ \ dockeruser\;/g' /etc/nginx/nginx.conf

RUN mkdir -p /var/www/wp

WORKDIR /etc/nginx
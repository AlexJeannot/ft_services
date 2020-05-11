FROM alpine:latest

RUN apk update
RUN apk add php7
RUN apk add php7-fpm
RUN apk add php7-opcache
RUN apk add php7-gd
RUN apk add php7-mysqli
RUN apk add php7-zlib
RUN apk add php7-curl
RUN apk add php7-mbstring
RUN apk add php7-json
RUN apk add php7-session

COPY ./files/phpMyAdmin /var/www/phpMyAdmin
RUN chmod -R 755 /var/www/phpMyAdmin

EXPOSE 5000

CMD ["php", "-S", "0.0.0.0:5000", "-t", "/var/www/phpMyAdmin"]

FROM alpine:latest

RUN apk update
RUN apk add --no-cache  php7            \
                        php7-fpm        \
                        php7-opcache    \
                        php7-gd         \
                        php7-mysqli     \
                        php7-zlib       \
                        php7-curl       \
                        php7-mbstring   \
                        php7-json       \
                        php7-session

COPY ./files/phpMyAdmin /var/www/phpMyAdmin
RUN chmod -R 755 /var/www/phpMyAdmin

EXPOSE 5000

CMD ["php", "-S", "0.0.0.0:5000", "-t", "/var/www/phpMyAdmin"]

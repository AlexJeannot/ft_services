FROM alpine:latest

RUN apk update

RUN apk add php
RUN apk add php7-fpm
RUN apk add php7-opcache
RUN apk add php7-zlib
RUN apk add php7-mbstring
RUN apk add php7-session
RUN apk add php7-common 
RUN apk add php7-iconv 
RUN apk add php7-json 
RUN apk add php7-gd 
RUN apk add php7-curl 
RUN apk add php7-xml 
RUN apk add php7-mysqli 
RUN apk add php7-imap 
RUN apk add php7-cgi 
RUN apk add fcgi 
RUN apk add php7-pdo 
RUN apk add php7-pdo_mysql 
RUN apk add php7-soap 
RUN apk add php7-xmlrpc 
RUN apk add php7-posix 
RUN apk add php7-mcrypt 
RUN apk add php7-gettext 
RUN apk add php7-ldap 
RUN apk add php7-ctype 
RUN apk add php7-dom

COPY ./files/wordpress /var/www/wordpress/
RUN chmod -R 755 /var/www/wordpress

EXPOSE 5050

CMD ["php", "-S", "0.0.0.0:5050", "-t", "/var/www/wordpress"]
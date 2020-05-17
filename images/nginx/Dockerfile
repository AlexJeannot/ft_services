FROM alpine:latest

RUN apk update
RUN apk add --no-cache  nginx   \
                        openssl \
                        openrc  \
                        openssh 

RUN mkdir -p /run/nginx

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=Paris/L=Paris/O=42/CN=ajeannot' -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt

COPY ./files/index.html /var/www/index.html
COPY ./files/default.conf /etc/nginx/conf.d/default.conf
COPY ./files/setup.sh ./tmp/setup.sh

RUN chmod 777 ./tmp/setup.sh

EXPOSE 22 80 443

CMD ["sh", "./tmp/setup.sh" ]
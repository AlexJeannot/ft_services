FROM alpine:latest

RUN apk update
RUN apk add nginx
RUN apk add openssl
RUN mkdir -p /run/nginx


RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=Paris/L=Paris/O=42/CN=ajeannot' -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt

COPY index.html /var/www/index.html
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
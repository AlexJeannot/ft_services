FROM alpine:latest

RUN apk update
RUN apk add --no-cache libc6-compat

COPY ./files/telegraf ./telegraf
RUN chmod -R 777 ./telegraf

CMD ["./telegraf/usr/bin/telegraf", "--config", "./telegraf/etc/telegraf/telegraf.conf"]
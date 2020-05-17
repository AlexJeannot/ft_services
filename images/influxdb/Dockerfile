FROM alpine:latest

RUN apk update
RUN apk add --no-cache libc6-compat

RUN echo -e "telegraf_password\ntelegraf_password" | adduser telegraf

COPY ./files/influxdb ./influxdb
RUN chmod -R 777 ./influxdb

EXPOSE 8086

CMD [ "./influxdb/usr/bin/influxd", "--config", "/influxdb/etc/influxdb/influxdb.conf" ]
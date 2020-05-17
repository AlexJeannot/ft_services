FROM alpine:latest

USER root

RUN apk update
RUN apk add --no-cache  openssl \
                        vsftpd

COPY ./files/setup.sh ./tmp/setup.sh
COPY ./files/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN chmod 777 ./tmp/setup.sh

EXPOSE 21 21000

CMD [ "sh", "./tmp/setup.sh" ]
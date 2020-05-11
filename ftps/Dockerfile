FROM alpine:latest

USER root

RUN apk update
RUN apk add openssl
RUN apk add vsftpd

COPY ./setup.sh ./
COPY vsftpd_load.conf /etc/vsftpd/vsftpd_load.conf

RUN chmod 777 ./setup.sh

EXPOSE 21 21000

#ENTRYPOINT [ "sh", "./setup.sh" ]
CMD [ "sh", "./setup.sh" ]
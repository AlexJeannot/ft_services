FROM alpine:latest

RUN apk update
RUN apk add --no-cache  mariadb \
                        mariadb-client

COPY ./files/setup.sh ./tmp/setup.sh
COPY ./files/init.sh ./tmp/init.sh
COPY ./files/init_db.sql ./tmp/init_db.sql
COPY ./files/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./files/my.cnf /etc/my.cnf
COPY ./files/wordpress.sql ./tmp/wordpress.sql

RUN chmod 777 ./tmp/setup.sh
RUN chmod 777 ./tmp/init.sh
RUN chmod 777 ./tmp/init_db.sql
RUN chmod 777 ./tmp/wordpress.sql

EXPOSE 3306

CMD [ "sh", "./tmp/setup.sh" ]
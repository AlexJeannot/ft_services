FROM	alpine:latest

RUN 	apk update
RUN     apk add mariadb mariadb-client

COPY	setup.sh ./tmp/
COPY	init.sh ./tmp/
COPY	init_db.sql ./tmp/
COPY	mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY	my.cnf /etc/my.cnf
COPY	wordpress.sql ./tmp/

RUN 	chmod 777 ./tmp/setup.sh
RUN 	chmod 777 ./tmp/init.sh
RUN 	chmod 777 ./tmp/init_db.sql
RUN 	chmod 777 ./tmp/wordpress.sql

EXPOSE	3306

CMD     [ "sh", "./tmp/setup.sh" ]
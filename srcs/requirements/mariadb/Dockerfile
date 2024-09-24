FROM debian:bullseye

RUN apt-get update -y\
	&& apt-get upgrade -y\
	&& apt-get install mariadb-server -y

COPY . .

RUN mkdir -p /run/mysqld; chown -R mysql:mysql /run/mysqld

RUN chmod +x tools/init.sh && ./tools/init.sh

CMD [ "mysqld" ]

FROM debian:bullseye

RUN apt-get upgrade -y && apt-get update -y\
	&& apt-get install -y php-fpm wget php-mysqli

COPY . .

RUN mkdir -p /run/php/ # create php-fpm7.4 sockdir

RUN ln -s /etc/php/7.4/fpm/pool.d/www.conf ~/php-fpm.conf\
	&& cat config/www.conf > ~/php-fpm.conf

RUN chmod +x tools/wp_init.sh

EXPOSE 9000

ENTRYPOINT [ "./tools/wp_init.sh" ]

CMD [ "php-fpm7.4", "-F" ]

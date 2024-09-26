#!/bin/bash

wpdir=/var/www/html
wpcli=wp-cli.phar

if [ ! -f ${wpdir} ]; then
	mkdir -p ${wpdir}
fi

cd ${wpdir}

if [ ! -f ${wpcli} ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
fi

chmod +x ${wpcli}

./${wpcli} core download --allow-root
./${wpcli} config create --dbname=$WPDB_NAME --dbuser=$WPDB_USER --dbpass=$WPDB_PASSWORD --dbhost=mariadb --allow-root
./${wpcli} core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

exec "$@"

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

# downloads the WordPress core files to the current directory.
./${wpcli} core download --allow-root

# creates the wp-config.php file with the specified database configuration
./${wpcli} config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb --allow-root

# completes the WordPress installation process, setting up the site with the specified parameters
./${wpcli} core install --url=https://oezzaou.42.fr --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

exec "$@"

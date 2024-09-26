#!/bin/bash

wp_path=/var/www/html

if [ ! -f ${wp_path} ]; then
	mkdir -p /var/www/html
	cd ${wp_path}
fi

# Download the WP-CLI tool
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/gh-pages/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Download wordpress files 
wp core download --allow-root

# 
wp config create --dbname=$WPDB_NAME --dbuser=$WPDB_USER --dbpass=$PWDB_PASSWORD --dbhost=mariadb --allow-root

#
wp core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

exec "$@"

#====[ Script: wp_init.sh ]=====================================================
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
./${wpcli} core install --url=https://oezzaou.42.fr --title=inception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root

# create user
./${wpcli} user create $WP_USER $WP_EMAIL --role=$WP_ROLE --allow-root

exec "$@"
#===============================================================================

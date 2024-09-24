#!/bin/bash

wp_path=/var/www/html

mkdir -p ${wp_path}
cd ${wp_path}

wget https://wordpress.org/latest.tar.gz
tar -xf latest.tar.gz wordpress/
rm -rf latest.tar.gz

#chown -R www-data:www-data /var/www/html/wordpress/
#chmod -R 755 /var/www/html/wordpress/

exec "$@"

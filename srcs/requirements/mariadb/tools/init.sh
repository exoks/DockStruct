#!/bin/bash

sql_conf=$(cat config/my.cnf | awk '/^socket*/{print $3}')
sql_confs=$(mysqld -v --help | awk '/my.cnf /')
sql_dbs=$(cat config/my.cnf | awk '/^datadir*/{print $3}')
sql_default=~/my.cnf
WPDB_NAME=wordpress
WPDB_USER=oezzaou
WPDB_PASSWORD=oezzaou1234

service mariadb start

# Set default config file
for thing in ${sql_confs}; do
	if [ -f ${sql_default} ]; then 
		echo "Warning: ${sql_default}: already exist"
		break ;
	elif [ -f ${thing} ] && [ ! -f ${sql_default} ]; then
		ln -s ${thing} ${sql_default}
		cat config/my.cnf > ${sql_default}
		break ;
	fi
done

# create database if is not exist
if [ -z  ${sql_dbs} ]; then
	sql_dbs="/var/lib/mysql"
fi

chown -R mysql:mysql ${sql_dbs}

if [ ! -f ${sql_dbs}/$WPDB_NAME ]; then
	mariadb <<-EOF
	CREATE DATABASE $WPDB_NAME;
	CREATE USER '$WPDB_USER' IDENTIFIED BY '$WPDB_PASSWORD';
	GRANT ALL PRIVILEGES ON $WPDB_NAME.* TO '$WPDB_USER'@'%';
	FLUSH PRIVILEGES;
	EOF
fi
#====[ init.sh: ]===============================================================

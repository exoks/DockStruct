#!/bin/bash

#====[ init.sh: ]==============================================================
sql_conf=$(cat config/my.cnf | awk '/^socket*/{print $3}')
sql_confs=$(mysqld -v --help | awk '/my.cnf /')
sql_dbs=$(cat config/my.cnf | awk '/^datadir*/{print $3}')
sql_default=~/my.cnf
DB_NAME=wordpress
DB_USER=oezzaou
DB_PASSWORD=1234

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

# create database if it does not exist
if [ -z  ${sql_dbs} ]; then
	sql_dbs="/var/lib/mysql"
fi

chown -R mysql:mysql ${sql_dbs}

if [ ! -d ${sql_dbs}/$DB_NAME ]; then
	mariadb <<-EOF
	CREATE DATABASE $DB_NAME;
	CREATE USER '$DB_USER' IDENTIFIED BY '$DB_PASSWORD';
	GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
	FLUSH PRIVILEGES;
	EOF
fi
#===============================================================================

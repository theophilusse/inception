#!/bin/sh
DB_USER=$MYSQL_USER
DB_NAME=$MYSQL_DATABASE
DB_PASSWORD=$(cat /run/secrets/db_password)

chown -R mysql:mysql /var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

cat > /tmp/init.sql << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

exec mysqld --user=mysql --bind-address=0.0.0.0 --init-file=/tmp/init.sql

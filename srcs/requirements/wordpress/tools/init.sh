#!/bin/sh

DB_USER=$MYSQL_USER
DB_NAME=$MYSQL_DATABASE
DB_PASSWORD=$(cat /run/secrets/db_password)
WP_PASSWORD=$(cat /run/secrets/wp_password)
WP_PASSWORD2=$(cat /run/secrets/wp_password2)

if [ ! -f /var/www/html/wp-login.php ]; then

cd /var/www/html
until nc -z mariadb 3306; do
    echo "Waiting for MariaDB..."
    sleep 2
done

wp core download --allow-root
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb --allow-root
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --allow-root
wp user create $WP_USER2 $WP_EMAIL2 --role=author --user_pass=$WP_PASSWORD2 --allow-root
wp user update $WP_USER2 --user_pass=$WP_PASSWORD2 --allow-root

wp plugin install redis-cache --activate --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp redis enable --allow-root

fi

exec php-fpm8.2 -F # nodeamonize

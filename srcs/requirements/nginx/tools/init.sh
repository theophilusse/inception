#!/bin/sh

mkdir -p /etc/ssl/private
mkdir -p /etc/ssl/certs

openssl req -x509 -newkey rsa:4096 \
-keyout /etc/ssl/private/$DOMAIN_NAME.key \
-out /etc/ssl/certs/$DOMAIN_NAME.crt \
-sha256 -days 365 -nodes \
-subj "/CN=$DOMAIN_NAME" #/emailAddress=$WP_EMAIL

chmod 600 /etc/ssl/private/$DOMAIN_NAME.key

sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/nginx.conf

exec nginx -g "daemon off;"

#!/bin/sh

rm -f /var/www/html/index.html
mv /var/www/html/adminer.php /var/www/html/index.php
exec php -S 0.0.0.0:8081 -t /var/www/html/

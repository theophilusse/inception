FROM debian:bookworm
RUN apt update && apt install -y php
COPY tools/adminer.php /var/www/html/index.php
COPY tools/init.sh /init.sh
RUN chmod 755 /init.sh
EXPOSE 8081
CMD ["/init.sh"]

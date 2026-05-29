FROM debian:bookworm
RUN apt update && apt install -y php-fpm php-mysql php-curl php-mbstring php-xml php-zip php-imagick curl netcat-openbsd \
&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp
RUN sed -i 's/listen = .*/listen = 0.0.0.0:9000/' /etc/php/8.2/fpm/pool.d/www.conf
COPY tools/init.sh /init.sh
RUN chmod 755 /init.sh
EXPOSE 9000
ENTRYPOINT ["/init.sh"]

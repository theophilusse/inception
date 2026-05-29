FROM debian:bookworm
RUN apt update && apt install -y mariadb-server \
&& mkdir -p /var/lib/mysql \
&& chown -R mysql:mysql /var/lib/mysql \
&& mkdir -p /run/mysqld \
&& chown -R mysql:mysql /run/mysqld
COPY tools/init.sh /init.sh
RUN chmod 755 /init.sh
EXPOSE 3306
ENTRYPOINT ["/init.sh"]

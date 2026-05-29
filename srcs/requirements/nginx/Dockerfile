FROM debian:bookworm
RUN apt update && apt install -y nginx openssl
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/init.sh /init.sh
RUN chmod 755 /init.sh
RUN chmod 755 /etc/nginx/nginx.conf
EXPOSE 443
ENTRYPOINT ["/init.sh"]

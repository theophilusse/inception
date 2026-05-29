FROM debian:bookworm
RUN apt update && apt install -y redis-server
COPY tools/init.sh /init.sh
RUN chmod 755 /init.sh
EXPOSE 6379
CMD ["/init.sh"]

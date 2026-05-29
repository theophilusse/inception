FROM debian:bookworm
RUN apt update && apt install -y vsftpd
RUN mkdir -p /var/run/vsftpd/empty
COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY tools/init.sh /init.sh
RUN chmod 755 /init.sh
EXPOSE 21
CMD ["/init.sh"]

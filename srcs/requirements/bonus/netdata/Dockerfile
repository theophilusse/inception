FROM debian:bookworm
RUN apt update && apt install -y netdata
RUN mkdir -p /var/lib/netdata /var/cache/netdata /var/log/netdata \
&& chown -R netdata:netdata /var/lib/netdata /var/cache/netdata /var/log/netdata
COPY tools/init.sh /init.sh
RUN chmod 755 /init.sh
EXPOSE 19999
CMD ["/init.sh"]

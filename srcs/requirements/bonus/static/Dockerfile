FROM debian:bookworm
RUN apt update && apt install -y nginx
COPY tools/index.html /var/www/html/index.html
COPY conf/nginx.conf /etc/nginx/nginx.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

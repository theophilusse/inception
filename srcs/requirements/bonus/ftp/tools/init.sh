#!/bin/sh
FTP_USER=$FTP_USER
FTP_PASSWORD=$(cat /run/secrets/ftp_password)

if ! id "$FTP_USER" > /dev/null 2>&1; then
    useradd -m $FTP_USER
fi
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
chown -R $FTP_USER:$FTP_USER /var/www/html

exec vsftpd /etc/vsftpd.conf

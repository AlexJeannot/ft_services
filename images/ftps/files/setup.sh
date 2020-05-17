mkdir /etc/cert
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=Paris/L=Paris/O=42/CN=ajeannot' -keyout /etc/cert/vsftpd.pem -out /etc/cert/vsftpd.pem

mkdir /etc/vsftpd/ftps_user
echo -e "ftps_password123456789\nftps_password123456789" | adduser ftps_user -h /etc/vsftpd/ftps_user -s /sbin/nologin
chown -R ftps_user:ftps_user /etc/vsftpd/ftps_user

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

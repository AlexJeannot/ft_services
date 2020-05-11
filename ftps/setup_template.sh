mv /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
mv /etc/vsftpd/vsftpd_load.conf /etc/vsftpd/vsftpd.conf 

mkdir /etc/cert
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=Paris/L=Paris/O=42/CN=minikubeip' -keyout /etc/cert/vsftpd.pem -out /etc/cert/vsftpd.pem

mkdir /etc/vsftpd/alex
echo -e "test123456789\ntest123456789" | adduser alex -h /etc/vsftpd/alex -s /sbin/nologin
chown -R alex:alex /etc/vsftpd/alex

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

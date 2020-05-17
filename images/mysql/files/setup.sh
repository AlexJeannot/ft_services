nohup sh ./tmp/init.sh > ./tmp/init_logs 2>&1 &
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"
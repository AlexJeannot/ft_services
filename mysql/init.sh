until mysql
do
	echo "Wait for mysql"
done
mysql -u root < ./tmp/init_db.sql
echo "Database created"
mysql db_wordpress -u root < ./tmp/wordpress.sql
echo "Database updated"
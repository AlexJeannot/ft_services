CREATE DATABASE db_wordpress;
CREATE USER 'db_user'@'%' IDENTIFIED BY 'db_password';
GRANT ALL PRIVILEGES ON db_wordpress.* TO 'db_user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
echo "CREATE DATABASE IF NOT EXISTS $db_name ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY $db_ident ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

service mysql start

mysql -u root -p$db_ident < db1.sql
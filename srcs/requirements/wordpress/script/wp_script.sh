rm -rf

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

cp /wp-config.php /var/www/html/

sed -i "s/database_name_here/$db_name/g" wp-config.php
sed -i "s/username_here/$db_user/g" wp-config.php
sed -i "s/password_here/$db_pass/g" wp-config.php
sed -i "s/localhost/mariadb/g" wp-config.php

mkdir -p /var/www/html
cd /var/www/html
wait-for-it.sh mariadb::3306 -t 60

wp core install --url=$domain_name --title="Inception" --admin_user=$wp-admin --admin_password=$wp_adminpass --admin_email=$wp_adminmail --allow-root
wp user create $wp_user  $wp_email --role=contributor --user_pass=$wp_pass --allow-root
wp theme install twentytwenty --activate --allow-root
wp plugin update -all -allow-root

exec "$@"

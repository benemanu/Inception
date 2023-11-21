FROM debian:buster

RUN apt-get update && apt-get install -y \
    curl \
    php-fpm \
    php-mysql

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./conf/wp-config.php /

 RUN mkdir -p /run/php && chown www-data:www-data /run/php

RUN mkdir -p /var/www/html/
WORKDIR /var/www/html

COPY ./tools/wp_script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_script.sh
ENTRYPOINT ["/usr/local/bin/wp_script.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]

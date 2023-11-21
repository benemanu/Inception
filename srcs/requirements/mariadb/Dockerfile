FROM debian:buster

RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/db_script.sh /

RUN chmod +x /db_script.sh

EXPOSE 3306

ENTRYPOINT [ "/db_script.sh" ]
CMD ["mysqld_safe"]

## MARIADB CONTAINER
# Running Alpine linus to reduce overheads
# Current latest stabel version is 3.14
FROM    alpine:3.14
# Alpine package manager APK
RUN     apk update
# Install and update MariaDB latest
RUN     apk add --update mariadb mariadb-client 
RUN     apk add --update openrc
RUN     apk add --update mariadb-openrc

# Create runtime directory on Docker volume
RUN     mkdir -p /var/lib/mysql/run
RUN     mkdir -p /run/mysqld
# Setup MairaDB runtime directory and auth method
RUN     mariadb-install-db  --user=mysql \
                            --datadir=/var/lib/mysql \
                            --skip-test-db
# Grant access to mysql to db directory
RUN     chown -R mysql:mysql /var/lib/mysql
RUN     chown -R mysql:mysql /run/mysqld
# Copy conf and init files to server
COPY	conf/mariadb.conf /etc/my.cnf.d/mariadb-server.cnf
# Database setup
COPY	conf/mariadb.init   /init.sql

RUN   rc-update add mariadb

USER mysql

RUN sh -c "/usr/bin/mysqld_safe &" && \
  sleep 5 && \
  echo "done" && \
  mariadb -u mysql < init.sql

ENTRYPOINT  ["sh", "-c", "/usr/bin/mysqld"]
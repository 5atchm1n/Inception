## MARIADB CONTAINER
# Running Alpine linus to reduce overheads
# Current latest stabel version is 3.14
FROM    alpine:3.14
# Alpine package manager APK
RUN     apk update
# Install and update MariaDB latest
RUN     apk add --update mariadb mariadb-client openrc
# Create runtime directory on Docker volume
RUN     mkdir -p /var/lib/mysql/run
# Setup MairaDB runtime directory and auth method
RUN     mariadb-install-db --datadir=/var/lib/mysql \
                        --auth-root-authentication-method=normal \
                        --skip-test-db
# Grant access to mysql to db directory
RUN     chown -R mysql:mysql /var/lib/mysql
# Copy conf and init files to server
COPY	conf/mariadb.conf /etc/my.cnf.d/mariadb-server.cnf
COPY	conf/mariadb.init /
COPY	tools/entrypoint.sh /
# START MYSQL

ENTRYPOINT	["sh" ,"entrypoint.sh"]

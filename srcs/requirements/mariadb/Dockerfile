## MARIADB CONTAINER
# Running Alpine linus to reduce overheads
# Current latest stabel version is 3.14
FROM    alpine:3.14
# Alpine package manager APK
RUN     apk update
# Install and update MariaDB latest
RUN     apk add --update mariadb mariadb-client
# Create runtime directory on Docker volume
RUN     mkdir -p /var/lib/mysql/run
# Setup MairaDB runtime directory and auth method
RUN     mariadb-install-db --datadir=/var/lib/mysql \
                        --auth-root-authentication-method=normal \
                        --skip-test-db
# Grant access to mysql to db directory
RUN     chown -R mysql:mysql /var/lib/mysql
# Expose port to communicate with the different containers
EXPOSE  3006
## MARIADB CONTAINER
# Running Alpine linus to reduce overheads
# Current latest stabel version is 3.14
FROM    alpine:3.14
# Alpine package manager APK
RUN     apk update
# Install and update MariaDB latest
RUN     apk add --update mariadb mariadb-client

# Expose port to communicate with the different containers
EXPOSE  3006
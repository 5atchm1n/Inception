#!/bin/sh

## Wordpress install directory
STUDENT_LOGIN=sshakya
WP_SITE=${STUDENT_LOGIN}.42.fr
WP_DIR=/var/www/${WP_SITE}
# Wordpress database
MARIADB_HOSTNAME=mariadb
MARIADB_USER=wp_user
MARIADB_USER_PWD=wp_user_pwd
WP_DB=wp_db

# WP CLI command
wp config create --path=${WP_DIR}/html \
                 --dbname=${WP_DB} \
                 --dbuser=${MARIADB_USER} \
                 --dbpass=${MARIADB_USER_pwd} \
                 --dbhost=${MARIADB_HOSTNAME}
# END
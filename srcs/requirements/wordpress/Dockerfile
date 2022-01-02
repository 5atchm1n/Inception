## WORDPRESS CONTAINER
# RUNNING Alpine 3.14
FROM    alpine:3.14
# Alpine package manager
RUN     apk update
# Install wget package
RUN     apk add --update    mariadb-client \
                            wget \
                            openrc
# Install basic php packages
RUN     apk add --update    php php-fpm \
                            php-mysqli \
                            php-common \
                            php-cli \
                            php-phar
# Install necessary ph packages to run Wordpress
RUN     apk add --update    php-curl php-gd php-intl \
                            php-mbstring php-soap php-xml \
                            php-xmlrpc php-zip php-json \
                            php-openssl
# Copy conf files
COPY    ./conf/php-fpm.conf     /etc/php7/php-fpm.conf
COPY    ./conf/www.conf         /etc/php7/php-fpm.d/www.conf
# Run php-fpm
RUN     rc-update add php-fpm7
# Set args that Dockerfile will get from compose yaml
# Install Wordpress CLI tool
RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# Make the .phar file executable
RUN     chmod u+x wp-cli.phar
# Move file to usr/local/bin for cli execution
RUN     mv wp-cli.phar /usr/local/bin/wp
# Test that CLI is functioning correctly
RUN     wp --info
# Create directory for wordpress
ARG     WP_DIR
ARG     MARIADB_USER
ARG     MARIADB_USER_PWD
ARG     WP_DB
# Download Wordpress to directory
RUN     mkdir -p $WP_DIR/html
# Change directory to wordpress dir
RUN     wp core download --locale=en_US --path=$WP_DIR/html
# Setup wp_config file
RUN     wp config create --path=$WP_DIR/html\
                        --dbname=${WP_DB} \
                        --dbuser=${MARIADB_USER} \
                        --dbpass=$MARIADB_USER_PWD \
                        --locale=en_EN
RUN     wp db create
# Dockerfile variables
ARG     WP_URL
ARG     WP_ADMIN
ARG     WP_ADMIN_PWD
ARG     WP_ADMIN_EMAIL
ARG     WP_USER
ARG     WP_USER_PWD
ARG     WP_USER_EMAIL
# Install Wordpress via WP-CLI
RUN     wp core install --path=$WP_DIR/html \
                        --url=$WP_URL \
                        --title=Inception \
                        --admin_user=$WP_ADMIN \
                        --admin_password=$WP_ADMIN_PWD \
                        --admin_email=$WP_ADMIN_EMAIL \
                        --user=<$WP_USER|$WP_USER_PWD|$WP_USER_EMAIL>

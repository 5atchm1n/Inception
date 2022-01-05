## WORDPRESS CONTAINER
# RUNNING Alpine 3.14
FROM    alpine:3.14
# Alpine package manager
RUN     apk update
# Install wget package
RUN     apk add --update    mariadb-client \
                            mariadb-openrc \
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

RUN     rc-update add mariadb
# Set args that Dockerfile will get from compose yaml
# Install Wordpress CLI tool
RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN     chmod u+x wp-cli.phar
RUN     mv wp-cli.phar /usr/local/bin/wp
# Uncomment to test that CLI is functioning correctly
#RUN     wp --info
# Download Wordpress to directory
ARG     WP_DIR
RUN     mkdir -p ${WP_DIR}/html
RUN     wp core download --locale=en_US --path=${WP_DIR}/html
# ADD MaridDB [SQL] credentials to php-fpm config
RUN     adduser -H -D -S nginx && addgroup nginx && chown -R nginx:nginx ${WP_DIR}
COPY	./tools /install
RUN		chmod -R 750 install
# Install Wordpress via WP-CLI
ENTRYPOINT [ "sh", "install/run.sh" ]

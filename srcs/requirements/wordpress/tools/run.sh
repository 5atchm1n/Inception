#!/bin/sh

if [ -e .install ]
    then
        echo "Wordpress is installed"
        echo "Skipping wp core install"
    else
        wp core install --path=${WP_DIR}/html \
        		        --url=${WP_URL} \
        		        --title=Inception \
        		        --admin_user=${WP_ADMIN} \
        		        --admin_password=${WP_ADMIN_PWD} \
        		        --admin_email=${WP_ADMIN_EMAIL} \
				        --skip-email
        touch .install
fi

php-fpm7

# END
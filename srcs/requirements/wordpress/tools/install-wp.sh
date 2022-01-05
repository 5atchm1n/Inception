#!/bin/sh

STUDENT_LOGIN=sshakya
WP_SITE=${STUDENT_LOGIN}.42.fr
WP_DIR=/var/www/${WP_SITE}
WP_URL=https://${WP_SITE}
WP_SITE_TITLE="Inception"

WP_ADMIN=sshakya
WP_ADMIN_PWD=sshakya_pwd
WP_ADMIN_EMAIL=${STUDENT_LOGIN}@student.42.fr

wp core install --path=${WP_DIR}/html \
        		--url=${WP_URL} \
        		--title=Inception \
        		--admin_user=${WP_ADMIN} \
        		--admin_password=${WP_ADMIN_PWD} \
        		--admin_email=${WP_ADMIN_EMAIL} \
				--skip-email
# END
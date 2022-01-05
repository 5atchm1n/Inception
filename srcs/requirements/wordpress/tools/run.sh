#!/bin/sh

STUDENT_LOGIN=sshakya
WP_SITE=${STUDENT_LOGIN}.42.fr
WP_DIR=/var/www/${WP_SITE}

if [ -e ${WP_DIR}/html/wp-config.php ]
	then
		echo "wp-config exists"
		echo "Skipping wp config create"
	else
        sh -c /install/config-create.sh;
fi

if [ -e ${WP_DIR}/.install ]
    then
        echo "Wordpress is installed"
        echo "Skipping wp core install"
    else
        sh -c /install/install-wp.sh;
        touch ${WP_DIR}/.install
fi

echo "Removing install scripts"
rm -rf /install/config-create.sh
rm -rf /install/install-wp.sh
echo "Starting php-fpm7"

php-fpm7

# END
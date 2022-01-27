    -- remove unecessary databases
DELETE FROM	mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
    -- add password to db_admin user
ALTER USER mysql@localhost IDENTIFIED VIA mysql_native_password;
SET PASSWORD FOR '${MARIADB_ADMIN}'@'localhost' = PASSWORD('${MARIADB_ADMIN_PWD}');
    -- add password to root user
ALTER USER root@localhost IDENTIFIED VIA mysql_native_password;
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MARIADB_ROOT_PWD}');
    -- create Wordpress database
CREATE DATABASE ${WP_DB};
CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED by '${MARIADB_USER_PWD}';
GRANT ALL PRIVILEGES ON ${WP_DB}.* TO ${MARIADB_USER}@'%';
FLUSH PRIVILEGES;
usr/bin/mysqld_safe &

eval "echo \"$(cat /mariadb.init)\"" | mariadb

pkill mariadb

usr/bin/mysqld_safe

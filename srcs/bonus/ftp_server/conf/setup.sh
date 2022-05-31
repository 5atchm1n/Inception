#!/bin/sh

if [ ! -f .setup ] ;
    then
        echo "Adding FTP user password"
        echo "$FTP_USER:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null
        

        echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

        touch .setup
        rm setup.sh
fi

echo "FTP started on port 21"
/usr/sbin/vsftpd    /etc/vsftpd/vsftpd.conf
## FTP SERVER CONTAINER
# Running on alpine

FROM    alpine:3.15

RUN     apk update && apk upgrade

RUN     apk add --update vsftpd

RUN     mkdir   -p ${WP_DIR}

COPY    ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY    ./conf/setup.sh     /setup.sh

EXPOSE  21

CMD     "sh"
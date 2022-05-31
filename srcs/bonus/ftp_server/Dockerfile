## FTP SERVER CONTAINER
# Running on alpine

FROM    alpine:3.15

RUN     apk update && apk upgrade

RUN     apk add --update vsftpd

ARG     WP_DIR
ARG     FTP_USER

RUN     mkdir   -p ${WP_DIR}

COPY    ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY    ./conf/setup.sh     /setup.sh

RUN     adduser -D -h ${WP_DIR} ${FTP_USER} \
        && chown -R ${FTP_USER}:${FTP_USER} ${WP_DIR} 

EXPOSE  21

CMD     [ "sh" , "setup.sh" ]
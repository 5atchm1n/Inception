# NGINX CONTAINER
# Running Apline Linux to reduce overheads
# Current latest version is 3.14 (stable)
FROM    alpine:3.14
# Package manager for Alpine is apk
RUN     apk update
# Install and update to latest NGINX
RUN     apk add --update nginx
# Install and update OpenSSL
RUN     apk add --update openssl
# Create a self signed certificate using OpenSSL
        # use X.509 standard
RUN     openssl req \
        # create a self signed certificate instead of a signing request
        -x509 \
        # skip passphrase
        -nodes \
        # lenght of time in days the certificate will be valid
        -days 365 \
        # lenght of the RSA key in bits
        -newkey rsa:2048 \
        # where to place the generated key file 
        -keyout /etc/ssl/private/nginx-self-signed.key \
        # where to place the generated certificate file
        -out /etc/ssl/certs/nginx-self-signed.crt \
        # fill in the CSR information without the interactive prompt
        -subj "/C=FR/L=Paris/O=42/CN=sshakya.42.fr/UID=sshakya"

        # Generate a Diffie Helman group to increase security
        # ensures Perfect Forward Secrecy (Wikipedia)
        # Generated key will be 4096 bits
RUN     openssl dhparam -out /etc/nginx/dhparam.pem 1048

COPY   ./conf/nginx-ssl.conf /etc/nginx/snippets/self-signed.conf 

# Expose the port 443 (standard port for SSL)
EXPOSE  443

#CMD     ["nginx", "-g", "deamon off;"]
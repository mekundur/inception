#!/bin/bash
# set -e

SSL_DIR=/etc/nginx/ssl

mkdir -p $SSL_DIR

if [ ! -f $SSL_DIR/nginx.key ]; then
    openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 \
        -keyout $SSL_DIR/nginx.key \
        -out $SSL_DIR/nginx.crt \
        -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=${DOMAIN_NAME}"
fi

exec "$@"

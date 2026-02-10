FROM debian:bookworm

EXPOSE 3306

RUN apt update \
    && apt install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/setup.sh /usr/local/bin/setup.sh

RUN chmod +x /usr/local/bin/setup.sh \
    && mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql

ENTRYPOINT ["/usr/local/bin/setup.sh"]

CMD ["mysqld"]

# This doesn't override ps number
#CMD		["setup.sh", "mysqld_safe"]

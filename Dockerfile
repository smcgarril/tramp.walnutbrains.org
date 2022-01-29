FROM httpd:2.4

COPY . /usr/local/apache2/htdocs/

RUN mv  /usr/local/apache2/htdocs/ssl_certs/server.crt /usr/local/apache2/conf/server.crt && \
    mv  /usr/local/apache2/htdocs/ssl_certs/server.key /usr/local/apache2/conf/server.key

RUN sed -i \
        -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        conf/httpd.conf

FROM debian:buster
RUN apt-get update -g

RUN apt-get install -y -q nginx

RUN apt-get install -y -q openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/bhielsch.crt \
        -keyou/etc/nginx/ssl/bhielsch.key \
        -subj "/C=DE/ST=Vienna/L=Vienna/O=42Vienna/OU=bhielsch/CN=bhielsch/"

RUN rm -f /etc/nginx/sites-enabled/default

COPY config/default /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
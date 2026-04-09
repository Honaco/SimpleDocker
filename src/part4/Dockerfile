FROM nginx

# Сначала копируем main.c, потом компилируем в ЕДИНСТВЕННОМ RUN
COPY main.c /tmp/main.c
RUN apt-get update && \
    apt-get install -y gcc libfcgi-dev spawn-fcgi && \
    rm -rf /var/lib/apt/lists/* && \
    gcc -o /mini_server /tmp/main.c -lfcgi && \
    rm /tmp/main.c

COPY run.sh /run.sh
# Копируем конфиг в conf.d (не в основной nginx.conf!)
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
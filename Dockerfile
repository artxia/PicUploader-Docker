FROM alpine


ENV USER admin
ENV PASSWD admin

RUN apk update \
    && apk add nginx php7 php7-fpm php7-fileinfo php7-gd php7-json php7-curl php-exif php-pdo_sqlite \
       tzdata git apache2-utils --no-cache \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && apk del tzdata \
    && mkdir /run/nginx && touch /run/nginx/nginx.pid \
    && sed -i 's/user = nobody/user = nginx/g' /etc/php7/php-fpm.d/www.conf \
    && sed -i 's/group = nobody/group = nginx/g' /etc/php7/php-fpm.d/www.conf \
    && mkdir -p /var/www \
    && rm -rf /var/cache/apk/*

COPY default.conf /etc/nginx/conf.d/default.conf 

WORKDIR /var/www

RUN git clone https://github.com/xiebruce/PicUploader.git \
    && chown -R nginx:nginx /var/www/PicUploader \
    && htpasswd -bc /var/www/htpasswd ${USER} ${PASSWD}

WORKDIR /

ADD start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 80

ENTRYPOINT ["/start.sh"]

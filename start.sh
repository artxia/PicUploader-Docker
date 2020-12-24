#!/bin/sh


htpasswd -bc /var/www/htpasswd ${USER} ${PASSWD}
php-fpm7 && nginx -g 'daemon off;'

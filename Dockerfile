FROM nginx:1.21-alpine

COPY web/ /usr/share/nginx/html

# use dev htaccess
COPY .htaccess /var/www/html/.htaccess

VOLUME /usr/share/nginx/html/cert
EXPOSE 80

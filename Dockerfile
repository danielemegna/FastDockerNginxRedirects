FROM alpine

RUN apk add --update nginx certbot certbot-nginx
RUN rm -rf /var/cache/apk/*

COPY nginx.settings /etc/nginx/nginx.conf
COPY redirect.conf /etc/nginx/conf.d/

RUN echo '0 12 * * * certbot renew --nginx --quiet' >> /etc/crontabs/root

CMD ["/bin/sh", "-c", "crond -b ; nginx -g 'daemon off;'"]

FROM alpine

RUN apk add --update nginx certbot certbot-nginx
RUN rm -rf /var/cache/apk/*

COPY proxy_params /etc/nginx/proxy_params
COPY reverseproxy.conf /etc/nginx/http.d/reverseproxy.conf
RUN rm /etc/nginx/http.d/default.conf

RUN echo '@monthly certbot renew --nginx --quiet' >> /etc/crontabs/root

CMD ["/bin/sh", "-c", "crond -b ; nginx -g 'daemon off;'"]

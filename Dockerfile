FROM alpine

RUN apk add --update nginx certbot certbot-nginx
RUN rm -rf /var/cache/apk/*

COPY nginx.settings /etc/nginx/nginx.conf
COPY redirect.conf /etc/nginx/conf.d/
COPY certbot-renew-crontab /etc/crontabs/
#COPY letsencrypt /etc/letsencrypt

CMD ["nginx", "-g", "daemon off;"]

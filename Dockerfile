FROM alpine
#FROM hypriot/rpi-alpine-scratch

RUN apk add --update nginx certbot certbot-nginx
RUN rm -rf /var/cache/apk/*

COPY nginx.settings /etc/nginx/nginx.conf
COPY redirect.conf /etc/nginx/conf.d/

COPY letsencrypt /etc/letsencrypt
COPY certbot-renew-crontab /etc/crontabs/

CMD ["nginx", "-g", "daemon off;"]

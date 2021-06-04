FROM alpine
#FROM hypriot/rpi-alpine-scratch

RUN apk add --update nginx
COPY nginx.settings /etc/nginx/nginx.conf
COPY redirect.conf /etc/nginx/conf.d/

RUN apk add certbot certbot-nginx
COPY letsencrypt /etc/letsencrypt
COPY certbot-renew-crontab /etc/crontabs/

RUN rm -rf /var/cache/apk/*

CMD ["nginx", "-g", "daemon off;"]

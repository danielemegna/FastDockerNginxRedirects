FROM alpine
#FROM hypriot/rpi-alpine-scratch
RUN apk add --update nginx && rm -rf /var/cache/apk/*
COPY nginx.settings /etc/nginx/nginx.conf
COPY redirect.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]

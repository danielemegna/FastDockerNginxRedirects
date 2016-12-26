FROM hypriot/rpi-alpine-scratch
RUN apk add --update nginx && rm -rf /var/cache/apk/*
COPY nginx.settings /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

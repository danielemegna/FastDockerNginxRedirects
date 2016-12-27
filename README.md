# FastDockerNginxRedirects
Minimal docker alpine based customizable http nginx redirect service

## What is this?
wip

## How can I use it?
Configure `redirect.conf` with your redirections and run the container with
```
$ docker-compose up -d
```
or
```
$ docker build -t redirects
$ docker -dp 80:80 -v $(pwd):/etc/nginx/conf.d/ redirects
```

`redirect.conf` is mounted as a volume, so you can hotfix it without rebuilding the container with
```
$ docker-compose restart
```
or
```
# check the container name
$ docker restart redirects_web_1 
```

# FastDockerNginxRedirects
Minimal docker alpine based customizable http nginx redirect service

## How can I use it?
Configure `redirect.conf` with your redirections and run the container with
```
$ docker build -t redirects .
$ docker run --rm -dp 80:80 --name nginx redirects
```
or in host network mode
```
$ docker run --rm -d --network=host --name nginx redirects
```

to mount `redirect.conf` as a volume, so you can hotfix it without rebuilding the container with
```
$ docker run --rm -dp 80:80 -v $(pwd):/etc/nginx/conf.d/ --name nginx redirects
$ docker restart
```

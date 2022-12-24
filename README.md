# FastDockerNginxRedirects
Minimal docker alpine based customizable http nginx redirect service

## How can I use it?
Configure `redirect.conf` with your redirections and run the container with
```
$ docker build -t redirects .
$ docker run --rm -d --network=host --name nginx redirects
```

## Https certification setup

To create a production ready letsencrypt folder, grub a letsencrypt folder using 80 http port:

```
$ docker stop nginx
$ docker build -t redirects .
$ docker run --rm -d --network=host --name nginx-tmp -v $PWD/letsencrypt:/etc/letsencrypt redirects
$ docker exec -it nginx-tmp sh
# certbot certonly --nginx
```

Create certification selecting groups of same domain, DO NOT MIX different domains!

```
Which names would you like to activate HTTPS for?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: firstdomain.it
2: www.firstdomain.it
3: judoclubrho.it
4: www.judoclubrho.it
5: metricamusic.it
6: www.metricamusic.it
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate numbers separated by commas and/or spaces, or leave input
blank to select all options shown (Enter 'c' to cancel): 5 6
....
Cleaning up challenges
```

exit and clean temporary container

```
# exit
$ docker stop nginx-tmp
```

Configure `redirects.conf` to use ssl certificates under `letsencrypt/live` folder (see commented lines), rebuild docker image and run it:

```
$ docker build -t redirects .
$ docker run --rm -d --network=host --name nginx redirects
```

Some doc sources:
- https://geko.cloud/nginx-and-ssl-with-certbot-in-docker-alpine/
- https://certbot.eff.org/lets-encrypt/arch-nginx

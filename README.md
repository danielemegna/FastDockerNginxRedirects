# My server reverse proxy

This is a docker alpine based customizable http nginx redirect / proxy service.
It started as a nginx redirect proxy, but it becomes my personal server reverse-proxy.

## How can I use it?

Configure `reverseproxy.conf` with your redirections / proxy server directives.

Then, build and run the image with:
```
$ docker build -t reverseproxy .
$ docker run --rm -d --network=host --name reverseproxy reverseproxy
```

## Https certification setup

Mounting the _letsencrypt_ folder, https certificates can be used in `reverseproxy.conf`.

Run the container with the mounted folder:
```
$ ./up-with-volumes
```

<details>
<summary> Manual docker run command</summary>

```
$ docker run --rm -d --network=host -v $PWD/letsencrypt:/etc/letsencrypt --name reverseproxy reverseproxy
```
</details>

Open a shell in the container:

```
$ docker exec -it reverseproxy sh
```

and start certbot certificate generation:

```
# certbot certonly --nginx

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
blank to select all options shown (Enter 'c' to cancel): 3,4
....
Cleaning up challenges

# exit
```

> optional: pay attention to choose domains in pairs in order to generate
> domain-specific certificates in a proper folder with the domain name

Now configure `reverseproxy.conf` to use ssl certificates just generated under `letsencrypt/live` folder.

Then rebuild the docker image to use the new `reverseproxy.conf` file

```
$ docker build -t reverseproxy .
```

and restart a new container

```
$ docker rm -f reverseproxy
$ ./up-with-volumes
```

Some doc sources:
- https://geko.cloud/nginx-and-ssl-with-certbot-in-docker-alpine/
- https://certbot.eff.org/lets-encrypt/arch-nginx

# We ahead's Rancher setup

[![Latest release](https://img.shields.io/badge/latest-v2.3.2-green.svg)](https://github.com/weahead/rancher-server/releases/tag/v2.3.2)
[![Rancher v1.1.2](https://img.shields.io/badge/rancher-v1.1.2-green.svg)](https://github.com/rancher/rancher/releases/tag/v1.1.2)
[![nginx 1.9.12](https://img.shields.io/badge/nginx-1.9.12-green.svg)]()
[![MariaDB 10.1.12](https://img.shields.io/badge/mariadb-10.1.12-green.svg)]()


## Requirements

- [Docker Engine 1.10.0+](https://www.docker.com/products/docker-engine)
- [Docker Compose 1.6.0+](https://www.docker.com/products/docker-compose)
- Valid SSL certificates from a CA for the domain Rancher will be available at.
- Diffie-Hellman parameter for DHE ciphersuites, recommended 2048 bits. Generate
  with `openssl dhparam -out dhparams.pem 2048`.


## Get up and running

1. Clone this repo or download the [latest release](https://github.com/weahead/rancher-server/releases/latest).

2. Place SSL certificates and `dhparams.pem` in folder `/certs` on the host.
   Alternatively you may change the location of this folder in the
   [docker-compose.yml](docker-compose.yml) file.

3. Copy `rancher.sample.env` to `rancher.env` and set appropriate values for
   your environment.

4. Run

```sh
docker-compose up -d
```

5. Give all the services a few moments to start up properly. Once everything is
   up and running Rancher should be available at `https://RANCHER_FQDN`


## Upgrading

1. If you cloned the repo, pull the latest master, otherwise download the
   [latest release](https://github.com/weahead/rancher-server/releases/latest).

2. Run

```sh
docker-compose up -d
```

3. Give all the services a few moments to start up properly. Once everything is
   up and running Rancher should be available at `https://RANCHER_FQDN`


## Troubleshooting

### Nginx does not start.

- Make sure the SSL certificates are valid, issued by a trusted CA and readable
  by nginx.
- Make sure the `dhparams.pem` file is readable.
- Make sure that the ports `80` and `443` are available on the host.

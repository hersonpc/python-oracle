# python-oracle

Docker Container for Python with Oracle connection

## Oracle Instant Client

Version used in this compilation: Instant Client Basic x64 21.1.0


## Docker

To download the image from Docker Hub:  
```shell
docker pull hersonpc/python-oracle:latest
```

To build manually a local docker image, without downloading it from Docker Hub, you can use:
```shell
make build
```

and to test, running docker to access the shell, just do:
```shell
make bash
```

## Docker compose

A pratical example of an use case, using the docker compose way. You just need to create a _docker-compose.yml_ file, like this below and than you can call the shell command: **docker-compose up -d**  

```yml
version: "3"

services:

  dev:
    image: hersonpc/python-oracle:latest 
    restart: always
    container_name: python_oracle
    volumes:
      - ./src:/app
    environment:
      - ORACLE_USERNAME=admin
      - ORACLE_PASSWORD=secret
      - ORACLE_SERVER=192.168.0.1
      - ORACLE_DATABASE=dbname
```
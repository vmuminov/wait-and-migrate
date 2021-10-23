# wait-and-migrate

mbucc/shmig paired with toschneck/wait-for-it; database migration tool that waits for database to be up before running

# Why?

When testing web applications in docker, sometimes there is a need in 'real' database. This is usually achieved by having either in-memory SQLite or, if some specific features are required, a docker container. Now that it takes some time for the database daemon to start in a running container, one should constantly poke the container on a specific port, until it becomes available. There are multiple solutions over the internet for that; the real problem arises when one wants to not only check if database is up and running, but also execute all the migrations on it. Here is where we need to chain two actions: wait for the database up and execute migrations after. This docker image allows one to have both actions in one, simplifying composer files and reducing amount of ancillary code one should carry from project to project

# Why shmig?

I like the idea

# Usage example

With `docker-compose`

```
version: '3.9'

services:
  migrate:
    image: vmuminov/wait-and-migrate
    depends_on:
      - database
    volumes:
      - ./sql:/sql
    environment:
      TYPE: mysql
      HOST: database
      PORT: 3306
      DATABASE: playground
      LOGIN: root
      PASSWORD: password
  database:
    image: mysql
    command: mysqld --default-authentication-plugin=mysql_native_password
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: playground
```

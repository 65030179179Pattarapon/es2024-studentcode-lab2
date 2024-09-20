#!/bin/bash

# Start MongoDB container
docker run -d --name mongodbdoi -v ~/Lab2/mongodb/init.js:/docker-entrypoint-initdb.d/init.js mongo

# Start Express container
docker build -t expressdoi ~/Lab2/express
docker run -d --name expressdoi --link mongodbdoi -p 3000:3000 expressdoi

# Start Nginx container
docker run -d --name nginxdoi -p 8083:80 -v ~/Lab2/nginx/nginx.conf:/etc/nginx/nginx.conf -v ~/Lab2/nginx/index.html:/usr/share/nginx/html/index.html nginx

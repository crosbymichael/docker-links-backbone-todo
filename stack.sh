#!/bin/bash

docker run -e NAME=tododb -d -p 8080 -name rethinkdb crosbymichael/rethinkdb --bind all
docker run -rm -link rethinkdb:db crosbymichael/frontend --setup
docker run -d -p 5000 -link rethinkdb:db -name todo crosbymichael/frontend
echo "\n"

docker ps

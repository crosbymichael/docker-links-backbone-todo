#!/bin/bash

RETHINK=$(docker run -e NAME=tododb -d crosbymichael/rethinkdb)
docker link $RETHINK /rethinkdb

docker run -rm -link /rethinkdb:db crosbymichael/linkwebapp --setup

WEBAPP=$(docker run -p 5000 -link /rethinkdb:db crosbymichael/linkwebapp)
docker link $WEBAPP /todo

docker ps -notrunc

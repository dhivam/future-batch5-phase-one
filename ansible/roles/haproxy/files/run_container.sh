#!/bin/bash

if ! docker rm haproxy-container -f ; then
	echo -e "create and run haproxy container"
	docker run -d --name haproxy-container -p 80:80  my-haproxy
else
	echo -e "skip or run haproxy container"
	docker run -d --name haproxy-container -p 80:80  my-haproxy

fi

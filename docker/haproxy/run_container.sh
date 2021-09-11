#!/bin/bash

if ! docker rm haproxy-container -f ; then
	echo -e "create and run new container"
	docker run -d -p 80:80 --name haproxy-container my-haproxy
else
	echo -e "run haproxy container"
	docker run -d -p 80:80 --name haproxy-container my-haproxy
fi

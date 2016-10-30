#!/bin/bash
mkdir /tmp/varsnih_modules_compiled
docker run -d --name varnish-modules -v /tmp/varsnih_modules_compiled:/tmp varnish-modules:0.0.1

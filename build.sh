#!/bin/bash
VERSION="0.0.1"
docker build --rm -t varnish-modules:${VERSION} .

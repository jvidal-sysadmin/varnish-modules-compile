#!/bin/bash

# Setting vars by default if empty
if [[ -z $VARNISH_REPO_BRANCH ]]; then
	VARNISH_REPO_BRANCH="4.1"
fi

if [[ -z $VARNISH_REPO_TAG ]]; then
	VARNISH_REPO_TAG="varnish-4.1.3"
fi

# VARS
SRC_DIR="/usr/src"
VARNISH_MODULES_SRC_DIR="${SRC_DIR}/varnish-modules"

# OJO: This release is intended to work with Varnish Cache 4.1.2 and higher.

git clone https://github.com/varnish/varnish-modules ${VARNISH_MODULES_SRC_DIR}; cd ${VARNISH_MODULES_SRC_DIR}

./bootstrap
./configure
make
cp -rp ${VARNISH_MODULES_SRC_DIR}/src/.libs/*.so /tmp/

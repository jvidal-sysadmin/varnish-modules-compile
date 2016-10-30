FROM debian:jessie-backports

# Install "apt-transport-https"
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq -y -o DPkg::Options::=--force-confold install \
	apt-transport-https \
	curl \
	apt-utils

# Creating Varnish Debian Repo
RUN curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add - ; echo "deb https://repo.varnish-cache.org/debian/ jessie varnish-4.1" >> /etc/apt/sources.list.d/varnish-cache.list

# Install Varnish Requirements
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq -y -o DPkg::Options::=--force-confold install \
	git \
	build-essential \
	varnish \
	python-docutils \
	libpcre3-dev \
	pkg-config \
	automake \
	libtool \
	autoconf \
	libncurses5-dev \
	libncurses5 \
	libvarnishapi-dev \
	libedit-dev \
	&& rm -rf /var/lib/apt/lists/*

# Copy configuration
COPY ./config /

# Run compile script
CMD ["./compile.sh"]

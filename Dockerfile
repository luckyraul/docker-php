FROM debian:jessie

MAINTAINER nikita@mygento.ru

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y && \
	apt-get -y install php5-mysql php5-gd php5-curl curl php5-mcrypt php5-cli php5-fpm php5-intl

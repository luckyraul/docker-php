FROM mygento/puppet

MAINTAINER nikita@mygento.ru

RUN apt-get -q update && apt-get upgrade -qqy && \
	apt-get -qqy install php5-mysql php5-gd php5-curl curl php5-mcrypt php5-cli php5-fpm php5-intl

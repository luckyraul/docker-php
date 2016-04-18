#/bin/bash
sed -i -e s/PHP_VERSION/${PHP_VERSION}/g module.yaml
sed -i -e s/PHP_VERSION/${PHP_VERSION}/g fpm/module.yaml
sed -i -e s/PHP_VERSION/${PHP_VERSION}/g wheezy/module.yaml
sed -i -e s/PHP_VERSION/${PHP_VERSION}/g wheezy/fpm/module.yaml
DR="--rm=true --pull=true --force-rm=true --no-cache=true"
if [[ "$PHP_FPM" = "true" ]]; then
    echo 'FPM version'
else
    echo 'CLI version'
fi;
if [[ $PHP_VERSION = '5.5' ]]; then
    if [[ "$PHP_FPM" = "true" ]]; then
        docker build $DR --tag=mygento/php:$PHP_TAG wheezy/fpm
    else
        docker build $DR --tag=mygento/php:$PHP_TAG wheezy
    fi;
fi;
if [[ $PHP_VERSION != '5.5' ]]; then
    if [[ "$PHP_FPM" = "true" ]]; then
        docker build $DR --tag=mygento/php:$PHP_TAG fpm
    else
        docker build $DR --tag=mygento/php:$PHP_TAG .
    fi
fi

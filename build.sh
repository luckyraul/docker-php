#/bin/bash
DR="--rm=true --pull=true --force-rm=true --no-cache=true"
if [[ "$PHP_FPM" = "true" ]]; then
    echo 'FPM version'
else
    echo 'CLI version'
fi;

if [[ $PHP_VERSION = '5.5' ]]; then
    if [[ "$PHP_FPM" = "true" ]]; then
        echo "php::manage_repos: true" >> fpm/module.yaml
    else
        echo "php::manage_repos: true" >> module.yaml
    fi;
fi;

if [[ "$PHP_FPM" = "true" ]]; then
    sed -i -e s/PHP_VERSION/${PHP_VERSION}/g fpm/module.yaml
    docker build $DR --tag=mygento/php:$PHP_TAG fpm
else
    sed -i -e s/PHP_VERSION/${PHP_VERSION}/g module.yaml
    docker build $DR --tag=mygento/php:$PHP_TAG .
fi

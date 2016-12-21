#/bin/bash
DR="--rm=true --pull=true --force-rm=true --no-cache=true"
if [[ "$PHP_FPM" = "true" ]]; then
    if [[ "$PHP_FPM" = "true" ]]; then
      echo 'FPM version'
    else
      echo 'FPM FULL version'
    fi;
else
    echo 'CLI version'
fi;

if [[ "$PHP_FPM" = "true" ]]; then
    sed -i -e s/PHP_VERSION/${PHP_VERSION}/g fpm/module.yaml
    if [[ "$PHP_FULL" = "true" ]]; then
      sed -i -e s/PHP_VERSION/${PHP_VERSION}/g full/module.yaml
      docker build $DR --tag=mygento/php:$PHP_TAG full
    else
      docker build $DR --tag=mygento/php:$PHP_TAG fpm
    fi;
else
    sed -i -e s/PHP_VERSION/${PHP_VERSION}/g module.yaml
    docker build $DR --tag=mygento/php:$PHP_TAG .
fi

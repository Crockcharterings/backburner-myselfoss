myselfoss
=========

Portable dockerized selfoss.

**not ready yet try wait**


### admin notes
    
    # php-fpm
    cd php
    docker build -t php-fpm1 .
    docker run --name php-fpm3 -d php-fpm1
    cd ..
    
    # nginx
    cd nginx
    docker build -t myselfoss1 .
    ## put logs into subfolder
    ## link ports from php-fpm
    docker run  -v (pwd)/logs:/var/log/nginx --link php-fpm:php-fpm1 --name myselfoss3 -p 32768:80 -d myselfoss1
    cd ..
    
    # pack up
    docker stop myselfoss3
    docker rm myselfoss3

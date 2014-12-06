myselfoss
=========

Portable dockerized selfoss.


### admin notes

    docker build -t myselfoss1 .
    # puts logs into subfolder 
    docker run  -v (pwd)/logs:/var/log/nginx --name myselfoss3 -p 32768:80 -d myselfoss1
    
    # pack up
    docker stop myselfoss3
    docker rm myselfoss3

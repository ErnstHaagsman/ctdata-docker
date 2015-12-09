CtData Docker Compose Deployment Configuration
==============================================

To start CtData run the following commands:

```
./getjars.sh master
docker-compose build
docker-compose up
```

If you are having issues due to the MySQL server not being
ready in time, stop docker-compose, and run docker-compose up again.

Load Balancing
--------------

To configure load balancing, add an nginx instance to the docker-compose file,
and link it to the webapp instances. Please keep in mind that nginx needs to be
configured for websockets.
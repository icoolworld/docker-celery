# docker-celery
alpine,docker,python3.6,celery,django

## start container
```
docker run --name celery -d celery uwsgi --socket :6000 --master --processes 4 --threads 2 --vhost --pidfile=/var/run/uwsgi.pid --vacuum --thunder-lock
```

## entry container
```
docker exec -it celery sh
```

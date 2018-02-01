FROM python:3.6.4-alpine3.7
MAINTAINER coolbaby "coolbaby"

RUN \
apk add --no-cache linux-headers \
&& apk add --no-cache musl-dev gcc git \
&& pip install celery==4.1.0 \
&& pip install redis auth msgpack \
#&& pip install "celery[redis,auth,msgpack]"
\
&& pip install git+https://github.com/celery/librabbitmq \
&& rm -rf librabbitmq \
&& pip install Django==2.0.1 \
&& python -m django --version \
&& pip install django-celery \
&& pip install sqlalchemy \
&& pip install django-celery-results \
&& pip install flower \
&& pip install -U uwsgi \
&& pip install django-celery-beat \
&& apk del musl-dev gcc linux-headers git

#ENTRYPOINT ["uwsgi --socket :6000 --master --processes 4 --threads 2 --vhost --pidfile=/var/run/uwsgi.pid --vacuum --thunder-lock"]
#CMD ["--socket :6000 --master --processes 4 --threads 2 --vhost --pidfile=/var/run/uwsgi.pid --vacuum --thunder-lock"]

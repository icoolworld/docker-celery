# 任务调试系统

> 基于python的任务调度系统，可实现定时调度、主动投递任务功能，提供restful api格式投递任务

## 技术栈
```
Python3.6
celery
django
django-celery
django-celery-results
flower
```

## 环境需求
```
alpine3.6[gcc,linux-headers,musl-dev]
uwsgi
python3.6
celery4.1.0
Django==2.0.1
python包：redis auth msgpack librabbitmq django-celery  sqlalchemy django-celery-results flower django-celery-beat
```

## 环境搭建
```

```

## 运行系统

### 1.利用nginx作反向代理,启动容器
```
docker run --name http -d -v /data/celery/task/:/home/www/task -p 80:80 nginx:1.13.8-alpine-perl
```
### 2.进入容器
```
docker exec -it http sh
```
### 3.配置nginx
```
server {
    listen       80;
    server_name  localhost;
    location / {
        include  uwsgi_params;
        #uwsgi_pass  192.168.110.128:6000;
        uwsgi_pass  celery:6000;
        uwsgi_param UWSGI_SCRIPT task.wsgi;
        uwsgi_param UWSGI_CHDIR /home/www;
        index  index.html index.htm;
        client_max_body_size 35m;
    }
    location /static {
        alias /home/www/task/static;
    }
}
```

## 启动celery容器
```
docker run -d --name celery -p 5555:5555 -p 6000:6000 -v /home/wwwroot/uniii/task-schedule/:/usr/src/celery/ ainow/celery
```
### 部署celery静态资源
```
cd /usr/src/task
python manage.py collectstatic
```

## 访问任务系统
```
curl localhost
curl localhost/admin
#flower
curl localhost:5555 
```

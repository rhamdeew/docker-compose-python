FROM python:alpine3.7

COPY requirements.txt /requirements.txt

RUN apk update && apk add --virtual build-dependencies build-base gcc wget git linux-headers jpeg-dev zlib-dev postgresql-dev postgresql-client

RUN pip install uWSGI

RUN pip install -r /requirements.txt

COPY uwsgi.ini /srv/uwsgi.ini

ENTRYPOINT ["/usr/local/bin/uwsgi", "--http-socket", "0.0.0.0:8000", "--module", "site.wsgi", "--ini", "/srv/uwsgi.ini"]

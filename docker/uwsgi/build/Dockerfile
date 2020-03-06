FROM python:alpine3.7

COPY requirements.txt /requirements.txt

RUN apk add --no-cache postgresql-client && \
    apk add --no-cache --virtual build-dependencies build-base gcc linux-headers jpeg-dev zlib-dev postgresql-dev && \
    pip install -r /requirements.txt && \
    apk del build-dependencies

COPY uwsgi.ini /srv/uwsgi.ini

ENTRYPOINT ["/usr/local/bin/uwsgi", "--http-socket", "0.0.0.0:8000", "--module", "site.wsgi", "--ini", "/srv/uwsgi.ini"]

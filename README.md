## Nginx + Postgres + Django uWSGI

![](https://github.com/rhamdeew/docker-compose-python/workflows/Docker%20Image%20CI/badge.svg)

### Установка

- Клонируем репозиторий
- Переименовываем директорию docker-compose-python в your-project
- Кладем ваш проект в your-project/projects/site
- Кладем requirements.txt вашего проекта в your-project/docker/uwsgi/build/requirements.txt
- Правим docker/uwsgi/build/Dockerfile, заменяем там site.wsgi на свой модуль
- Запускаем make upb (docker-compose up -d --build)


### Управление

Для удобста управления все основные команды внесены в Makefile. Для просмотра доступных команд выполните cat Makefile.


#### Запуск:

```
#docker-compose up -d
make up
```


#### Остановка

```
#docker-compose stop
make stop
```


#### Просмотр статуса запущеных контейнеров

```
#docker-compose ps
make ps
```


#### Просмотр логов контейнера

```
#docker-compose logs --tail=100 -f (uwsgi|nginx|postgres)
make logs name=uwsgi
```


### Подключение к Postgres

```
#docker-compose exec uwsgi psql -U postgres -h postgres -W
make postgres
```


### Просмотр реквизитов для подключения

```
make dbpass
```


### Тонкая настройка

#### Смена логина/пароля demo:demo

Открываем docker/nginx/.htpasswd и заменяем его содержимое

#### Acme.sh

Переходим в директорию acme и там выполняем:

```
#docker-compose run --rm acme acme.sh --issue -d site.ru -w /acme-challenge
make acme d=site.ru,www.site.ru
```

SSL-сертификаты сохраняются в директорию docker/nginx/ssl. Чтобы все заработало нужно раскомментировать
строчки в конфиге docker-compose.yml

```
      # - ./docker/nginx/ssl:/etc/nginx/ssl:ro
```

А также раскомментировать строчку

```
      # -"443:443"
```

Примеры конфигов для https в docker/nginx/config/examples/

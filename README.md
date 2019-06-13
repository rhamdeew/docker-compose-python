## Nginx + Postgres + Django uWSGI

### Установка

- Клонируем репозиторий
- Переименовываем директорию docker-compose-python в your-project
- Кладем ваш проект в your-project/projects/site
- Кладем requirements.txt вашего проекта в your-project/docker/uwsgi/build/requirements.txt
- Правим docker/uwsgi/build/Dockerfile, заменяем там site.wsgi на свой модуль
- Запускаем docker-compose up -d


### Управление


#### Запуск:

```
docker-compose up -d
```


#### Остановка

```
docker-compose stop
```


#### Просмотр статуса запущеных контейнеров

```
docker-compose ps
```


#### Просмотр логов контейнера

```
docker-compose logs -f (uwsgi|nginx|postgres)
```


### Тонкая настройка

#### Смена логина/пароля demo:demo

Открываем docker/nginx/.htpasswd и заменяем его содержимое

#### Acme.sh

Переходим в директорию acme и там выполняем:

```
docker-compose run --rm acme acme.sh --issue -d site.ru -w /acme-challenge
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

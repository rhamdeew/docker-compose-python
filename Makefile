up:
	docker-compose up -d
upb:
	docker-compose up -d --build
stop:
	docker-compose stop
st: stop
ps:
	docker-compose ps

#make logs name=uwsgi
logs:
	docker-compose logs --tail=100 -f $(name) || true
nlogs:
	docker-compose logs --tail=100 -f nginx || true
ulogs:
	docker-compose logs --tail=100 -f uwsgi || true
dblogs:
	docker-compose logs --tail=100 -f postgres || true
dbpass:
	cat docker-compose.yml | grep POSTGRES_
postgres:
	docker-compose exec uwsgi psql -U postgres -h postgres -W || true

#make rs name=uwsgi
rs:
	docker-compose restart $(name)
nrs:
	docker-compose restart nginx

#make exec name=uwsgi
exec:
	docker-compose exec $(name) /bin/sh || true
ex: exec

python:
	docker-compose exec uwsgi /bin/ash || true
	
#make acme d="site.ru,www.site.ru"
acme:
	docker-compose -f docker-compose.acme.yml run --rm acme acme.sh --issue -d `echo $(d) | sed 's/,/ \-d /g'` -w /acme-challenge
ssl: acme

node:
	docker-compose -f docker-compose.node.yml run --rm node-10 /bin/ash || true

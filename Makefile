# ---------------------------
# Backend targets (Symfony)
# ---------------------------

backend.build:
	docker compose build php_backend

backend.sh:
	make up && docker compose exec -it php_backend sh

backend.tests:
	docker compose run --entrypoint="composer" php_backend tests

backend.fixtures:
	docker compose run --entrypoint="bin/console" php_backend doctrine:fixtures:load -n

backend.db.recreate:
	docker compose run --entrypoint="composer" php_backend db:recreate:dev

backend.migrate:
	docker compose run --entrypoint="bin/console" php_backend doctrine:migrations:migrate -n

backend.install:
	docker compose run --entrypoint="composer" php_backend install

# ---------------------------
# Frontend targets (Vue.js)
# ---------------------------

frontend.build:
	docker compose build frontend

frontend.bash:
	docker compose exec -it frontend bash

frontend.install:
	docker compose run --entrypoint="npm" frontend install

frontend.lint:
	docker compose exec frontend npm run lint:ts

frontend.audit:
	docker compose exec frontend npm audit --audit-level=low

# ---------------------------
# Common targets
# ---------------------------

up:
	docker compose up -d

down:
	docker compose down

ps:
	docker compose ps

build:
	make backend.build && docker compose build nginx_backend && make frontend.build

install:
	make backend.install && make frontend.install

make ics:
	bash generate-ics.sh

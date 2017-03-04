SERVICE=backend	

push:
	docker-compose push

build: build-frontend
	docker-compose build

build-with-deps: build-deps build-frontend
	docker-compose build --no-cache

build-deps:
	$(MAKE) -B -C ./backend MAKEFLAGS=build-deps

build-frontend:
	$(MAKE) -B -C ./frontend MAKEFLAGS=build

run: up

start: up

up:
	docker-compose up -d

stop: down

down:
	docker-compose down

restart:
	docker-compose restart

start-frontend:
	$(MAKE) -B -C ./frontend MAKEFLAGS=start

rm:
	docker-compose rm -f

log: logs

logs:
	docker-compose logs

envs:
	docker-compose run $(SERVICE) env

enter:
	docker-compose run $(SERVICE) /bin/sh

test: test-frontend test-backend

test-backend:
	docker-compose run backend /bin/sh -c "go test ./test/..."

test-frontend:
	$(MAKE) -B -C ./frontend MAKEFLAGS=test

test-local:
	$(MAKE) -B -C ./$(SERVICE) MAKEFLAGS=test
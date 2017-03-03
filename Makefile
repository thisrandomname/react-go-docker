SERVICE=backend	

push:
	docker-compose push

build: build-frontend
	docker-compose build

build-with-deps: build-deps build-frontend
	docker-compose build --no-cache

build-deps:
	$(MAKE) -C ./$(SERVICE) MAKEFLAGS=build-deps

build-frontend:
	$(MAKE) -C ./frontend MAKEFLAGS=build

run: up

start: up

up:
	docker-compose up -d

stop: down

down:
	docker-compose down

restart:
	docker-compose restart

rm:
	docker-compose rm -f

log: logs

logs:
	docker-compose logs

envs:
	docker-compose run $(SERVICE) env

enter:
	docker-compose run $(SERVICE) /bin/sh

test:
	docker-compose run $(SERVICE) /bin/sh -c "go test ./test/..."

test-local:
	$(MAKE) -C ./$(SERVICE) MAKEFLAGS=test
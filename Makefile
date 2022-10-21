build:
	docker compose build

rebuild:
	docker compose build --no-cache

up:
	docker compose up --abort-on-container-exit && echo "Success. Pushing image to remote registry..."

down:
	docker compose kill

stop:
	docker compose stop

restart:
	docker compose stop
	docker compose up --abort-on-container-exit

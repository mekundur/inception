NAME = inception

COMPOSE = docker compose
COMPOSE_FILE = srcs/docker-compose.yml

all: up

dirs:
	mkdir -p /home/mekundur/data/mariadb
	mkdir -p /home/mekundur/data/wordpress

up: dirs
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f $(COMPOSE_FILE) down

re: dirs
	docker compose -f $(COMPOSE_FILE) down
	docker compose -f $(COMPOSE_FILE) up -d --build

stop:
	docker compose -f $(COMPOSE_FILE) stop

start:
	docker compose -f $(COMPOSE_FILE) start

logs:
	docker compose -f $(COMPOSE_FILE) logs -f

ps:
	docker compose -f $(COMPOSE_FILE) ps

clean:
	docker compose -f $(COMPOSE_FILE) down
	docker compose -f $(COMPOSE_FILE) --rmi all --volumes --remove-orphans

.PHONY: all up down re stop start logs ps clean

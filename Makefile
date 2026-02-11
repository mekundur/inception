COMPOSE = docker compose
COMPOSE_FILE = srcs/docker-compose.yml

ENV_SRC = /home/mekundur/.env
ENV_DST = srcs/.env

DATA_DIR = /home/mekundur/data
DB_DIR = $(DATA_DIR)/mariadb
WP_DIR = $(DATA_DIR)/wordpress

all: up

$(ENV_DST): $(ENV_SRC)
	cp $(ENV_SRC) $(ENV_DST)

$(DB_DIR):
	mkdir -p $(DB_DIR)

$(WP_DIR):
	mkdir -p $(WP_DIR)

dirs: $(DB_DIR) $(WP_DIR)

up: $(ENV_DST) dirs
	$(COMPOSE) -f $(COMPOSE_FILE) up --build --detach

down:
	$(COMPOSE) -f $(COMPOSE_FILE) down

re:
	$(COMPOSE) -f $(COMPOSE_FILE) down --rmi all
	$(COMPOSE) -f $(COMPOSE_FILE) up --build --detach

stop:
	$(COMPOSE) -f $(COMPOSE_FILE) stop

start:
	$(COMPOSE) -f $(COMPOSE_FILE) start

show:
	@docker images
	@echo "\n"
	@docker ps
	@echo "\n"
	@docker volume ls
	@echo "\n"
	@docker network ls

logs:
	$(COMPOSE) -f $(COMPOSE_FILE) logs

ps:
	$(COMPOSE) -f $(COMPOSE_FILE) ps

clean:
	$(COMPOSE) -f $(COMPOSE_FILE) down --rmi all --volumes --remove-orphans
	rm -f srcs/.env

.PHONY: all dirs up down re stop start show logs ps clean 

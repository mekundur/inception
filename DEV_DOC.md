## Prerequisites
- Debian/Ubuntu system with Docker and Docker Compose installed.
- GNU Make installed.

## Setup
1. Place your `.env` file at `/home/mekundur/.env`.
2. Run `make` to build and start the stack.
3. Volumes are mounted under `/home/mekundur/data/volumes`:
   - `/home/mekundur/data/volumes/mariadb_data` → Worpress dynamic content data
   - `/home/mekundur/data/volumes/wordpress_data` → WordPress Application files

## Makefile Usage
- `make up` → build and start containers
- `make down` → stop and remove containers
- `make re` → rebuild and restart containers
- `make stop` → stop containers
- `make start` → start stopped containers
- `make show` → show images, containers, volumes, networks
- `make logs` → show logs
- `make ps` → show container status
- `make clean` → remove containers, images, volumes, and `.env`

## Docker Compose Commands
- `docker compose -f srcs/docker-compose.yml up --build -d` → manual start
- `docker compose -f srcs/docker-compose.yml down` → manual stop
- `docker compose -f srcs/docker-compose.yml logs` → logs

## Data Persistence
- Docker's default root data storage changed in `/etc/docker/daemon.json` file
- MariaDB and WordPress data are stored in named volumes mapped to host directories under `/home/mekundur/data`.
- Cleaning volumes (`make clean`) will reset the database and WordPress files, requiring reinstallation.

## Starting and Stopping the Stack
- Run `make up` to build and start all services (MariaDB, WordPress, NGINX).
- Run `make down` to stop and remove containers.
- Run `make stop` to stop containers without removing them.
- Run `make start` to restart stopped containers.

## Accessing the Website
- Open a browser and go to https://mekundur.42.fr
- Accept the self-signed certificate warning if prompted.

## WordPress Admin Panel
- After installation, log in at `https://mekundur.42.fr/wp-admin`
- Use the admin username and password you set during the installation wizard.

## Managing Credentials
- Database credentials are stored in `.env` file:
  - `DB_NAME`, `DB_USER`, `DB_PASSWORD`, `DB_PASS_ROOT`
- WordPress admin credentials are created during the first-time installation in the browser.

## Basic Checks
- Run `make show` to list images, containers, volumes, and networks.
- Run `make logs` to view container logs.
- Run `make ps` to check running services.

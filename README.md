*This project has been created as part of the 42 curriculum by mekundur*

## Description

This project is an introduction to containerization using Docker and Docker Compose.  
It consists of setting up a small infrastructure composed of multiple services: NGINX with TLS, WordPress with php-fpm, and MariaDB, all running in separate containers and connected through a Docker network.  
The project focuses on service isolation, networking, data persistence using Docker volumes, and basic security practices.

## Instructions

1. Clone the repository:
    ```bash
    git clone <repository_url>
    ```
2. Build and start the infrastructure:
    ```bash
    make
    ```
3. Access the website in a browser:
    https://mekundur.42.fr

4. To stop the application:
    ```bash
    make stop
    ```
5. To stop and clean all the entities:
    ```bash
    make clean
    ```

## Resources

Docker documentation: https://docs.docker.com/
Docker Compose documentation: https://docs.docker.com/compose/
NGINX documentation: https://nginx.org/en/docs/
WordPress documentation: https://wordpress.org/documentation/
MariaDB documentation: https://mariadb.com/kb/en/documentation/

Use of AI:
Copilot GPT-5 and ChatGPT was used as a learning aid to better understand Docker concepts (containers, volumes, networks), to clarify infrastructure design choices, and to help reason about the project requirements.

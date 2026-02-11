*This project has been created as part of the 42 curriculum by mekundur*

## Description

This project is an introduction to containerization using Docker and Docker Compose.  
It consists of setting up a small infrastructure of LEMP stack composed of multiple services: NGINX with TLS, WordPress with php-fpm, and MariaDB, all running in separate containers and connected through a Docker network.  
The project focuses on service isolation, networking, data persistence using Docker volumes, and basic security practices.

## Project Design and Technical Choices

### Use of Docker

Docker is used to containerize each service (NGINX, WordPress with php-fpm, and MariaDB) so that they run in isolated environments with their own dependencies.  
Docker Compose is used to orchestrate multiple containers, define networks, and manage persistent volumes in a declarative way.

Each service is built from its own Dockerfile to ensure full control over configuration and to comply with the project requirement of not using pre-built images.

---

### Virtual Machines vs Docker

**Virtual Machines (VMs)** virtualize an entire operating system, including a full kernel. They are heavier, consume more resources, and take longer to start.

**Docker containers** share the host kernel and isolate processes at the OS level. They are lightweight, faster to start, and use fewer resources.

---

### Secrets vs Environment Variables

**Environment variables** store configuration values (such as database name or user credentials) and are passed into containers at runtime.

**Docker secrets** provide a more secure way to manage sensitive data by storing it separately from images and environment variables.

In this project, environment variables are used through a `.env` file as allowed by the subject. Sensitive information is not hardcoded in Dockerfiles.

---

### Docker Network vs Host Network

A **Docker bridge network** isolates containers while allowing them to communicate using service names as hostnames.

The **host network mode** removes isolation and makes containers share the host’s networking stack.

Host networking is not used, as it reduces isolation and is explicitly forbidden in the evaluation guidelines.

---

### Docker Volumes vs Bind Mounts

**Docker named volumes** are managed entirely by Docker and provide portable, persistent storage independent of specific host paths.

**Bind mounts** directly map a host directory into a container, tightly coupling the container to the host filesystem.

This project uses Docker named volumes for:
- WordPress website files
- MariaDB database storage

Docker is configured so that volume data is stored under `/home/login/data/volumes/`, ensuring persistence while respecting the project requirements. Bind mounts are not used for persistent storage, as they are forbidden by the subject.



## Instructions

1. Clone the repository:
    ```bash
    git clone git@github.com:mekundur/inception.git
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

5. To run the application again:
    ```bash
    make start
    ```

6. To stop and clean all the entities:
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

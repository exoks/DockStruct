# **DockStruct** #
**DockStruct** is a **system administration** and **DevOps** project that involves setting up a virtualized infrastructure using **Docker**. The goal is to create a **multi-container** environment using **Docker-Compose**, ensuring that each service runs in its own container and follows best practices for deployment and security.

## **Services & Architecture** ##
The infrastructure consists of multiple Docker containers, each handling a specific service:

- **NGINX**: Acts as a reverse proxy, handling requests and redirecting them to the appropriate service.

- **MariaDB**: Stores WordPress data.

- **WordPress**: Runs on PHP-FPM and serves content.

- **SSL/TLS**: Secures connections with HTTPS.

- **Makefile**: Automate the setup and configure scripts.

## **Setup Instructions** ##
#### **Prerequisites** ####
Ensure your system has the following installed:
- Docker
- Docker Compose
- Make

#### **Installation Steps** ####
1. Clone the repository:
```bash
git clone https://github.com/exoks/DockStruct.git 
cd DockStruct
```
2. Build and start the containers:
```bash
make 
```
3. Restart the services:
```bash
make re 
```
#### **Configuration Files** ####
- **Dockerfiles**: Each service has its own Dockerfile for proper isolation.

- **.env**: Stores environment variables such as database credentials.

- **docker-compose.yml**: Defines and orchestrates container deployment.

#### **Security Measures** ####
- **Non-root Users**: Services run with restricted privileges.

- **Limited Network Exposure**: Only necessary ports are exposed.

- **Secure Data Storage**: Database data and WordPress files are stored persistently.

- **SSL/TLS Encryption**: Protects web traffic.

#### **CleanUp** ####
To free up disk space and remove unused containers, images, and volumes, follow these steps:
1. Remove stopped containers, unused networks, dangling images, build cache and delete all data stored in volumes:
```bash
make clean
```
2. Fully clean up and remove all Docker images and containers:
```bash
make fclean
```
---

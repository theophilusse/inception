*This project has been created as part of the 42 curriculum by ttrossea*

# inception

---

## About

`Inception` is a project thats aims to introduce containerization with Docker. The goal is to create multiple services thats
depends on each other. It features three mandatory services and five bonus services. 

---

## Features

### Mandatory
| Service | Description |
|------|-------------|
| `nginx` | HTTPS over TLS entrypoint, reverse proxy to wordpress (port 443) |
| `mariadb` | Database used for wordpress (port 3306) |
| `wordpress` | CMS running over PHP and DB (port 9000) |

### Bonus
| Service | Description |
|------|-------------|
| `ftp` | File Transfert Protocol server for remote file transfer (port 21) |
| `adminer` | PHP application to manage the database (port 8081) |
| `netdata` | Service used to monitor docker activity (port 19999) |
| `redis` | Remote Dictionary Server is an in-memory key–value database (port 6379) |
| `static` | Static webpage (port 8080) containing my curriculum-vitae |

---

## Comparaisons

>`VM vs Docker`
A Virtual Machine emulates a full hardware stack with its own kernel, making it heavy and slow to start. Docker containers share the host kernel, keeping services isolated with only the strict minimum: no bloat. This makes containers faster, lighter, and easier to deploy natively from the CLI without a heavy guest OS.

>`Secrets vs Environment variable`
These are two ways to store a password. The secret is the conventional approach for Docker. Environment variables are more "hacky" and risk being leaked if the developer isn't careful. Secrets are mounted via /run/secrets.

>`Docker Network vs Host Network`
Docker networks create an isolated virtual network between containers, where services can communicate using their service name as hostname. Using network: host would expose all container ports directly on the host machine, bypassing any isolation - a security risk we want to avoid. Only NGINX is intentionally exposed to the outside world on port 443.

>`Docker Volumes vs Bind Mount`
Docker volumes are managed by Docker itself, offering better isolation and easier monitoring through Docker commands. Bind mounts directly map a host directory into the container: more flexible but harder to track and less portable. For this project, named volumes are used for persistent data (WordPress files and MariaDB database), while the volume paths on the host are explicitly defined for evaluation purposes.

---

## Instructions

# Prerequisites
```bash
sudo apt-get install docker docker-compose make
```

# Environment

Create the environement variables and replace your login
```bash
cp srcs/.env.example srcs/.env && vim srcs/.env
```

# Secrets

Create the passwords (replace by strong ones)
```bash
echo "dbpass" > secrets/db_password.txt
echo "wppass" > secrets/wp_password.txt
echo "wppass2" > secrets/wp_password2.txt
echo "ftppass" > secrets/ftp_password.txt
```

# Build
```bash
make
```

---

## Ressources

https://docs.docker.com
https://docs.docker.com/compose
https://nginx.org/en/docs
https://mariadb.com/kb/en
https://wordpress.org/documentation
https://wp-cli.org
https://redis.io/docs
https://www.vsftpd.beasts.org
https://www.adminer.org
https://learn.netdata.cloud

---

## AI Usage

Practical for analyzing logs, debugging, fixing certain bugs, and learning the language and structure of docker-compose.yml and Dockerfiles. Also it helps to find ressources and clarify my reasonning.

*documentation made by ttrossea*

### User documentation

### Mandatory services
| Service | Port | Role |
|---------|------|------|
| `nginx` | 443 | HTTPS over TLS entrypoint, reverse proxy to wordpress |
| `mariadb` | 3306 | Database used for wordpress |
| `wordpress` | 9000 | CMS running over PHP and DB |

### Bonus services
| Service | Port | Role |
|---------|------|------|
| `ftp` | 21 | File Transfer Protocol server for remote file transfer |
| `adminer` | 8081 | PHP application to manage the database |
| `netdata` | 19999 | Service used to monitor docker activity |
| `redis` | 6379 | Remote Dictionary Server is an in-memory key–value database |
| `static` | 8080 | Static webpage containing my curriculum-vitae |

## Administration

# Configuration & startup

Put credentials in
```
secrets/wp_password.txt
secrets/wp_password2.txt
secrets/db_password.txt
secrets/ftp_password.txt
```

>Edit srcs/.env.example to srcs/.env with the right environement data.

Then start the project
```
make all
```
or
```
make
```

# Stop the project

Stop services
```
make down
```

Clean local data
```
make fclean
```

Rebuild
```
make re
```

# Remote access

>wordpress
```
curl -k https://ttrossea.42.fr/wp-login.php
curl -k https://ttrossea.42.fr/wp-admin
```

# Local access

>static
```bash
curl http://ttrossea.42.fr:8080/
```

>adminer
```bash
curl http://ttrossea.42.fr:8081/
```

>netdata
```bash
curl http://ttrossea.42.fr:19999/
```

>ftp
```bash
curl -v ftp://ttrossea.42.fr --user ftpuser:$(cat secrets/ftp_password.txt)
```

>redis
```bash
docker exec srcs-redis-1 redis-cli ping
```

## Credentials

# Secrets
```
secrets/wp_password.txt
secrets/wp_password2.txt
secrets/db_password.txt
secrets/ftp_password.txt
```

# Environment
```
srcs/.env
```

## Health check

```bash
docker ps
docker compose -f srcs/docker-compose.yml logs
```

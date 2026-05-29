*documentation made by ttrossea*
### Developper documentation

## Prerequisites

```bash
sudo apt-get install docker docker-compose make
```

## Setup

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

## Useful command

```bash
# Individual service
docker compose -f srcs/docker-compose.yml up nginx # start service
docker compose -f srcs/docker-compose.yml logs nginx # show logs
docker ps # list containers
docker exec -it srcs-wordpress-1 sh # Interactive shell or command inside a container
docker volume ls # list volumes
docker volume rm srcs_wp-data
```

## Build

Build and run project
```bash
make
# Or
make all
```

Stop project
```bash
make down
```

Clean data volumes
```bash
make clean
```

Remove containers
```bash
make fclean
```

Rebuild everything (re-download) and run
```
make re
```

## Data peristance

Data is stored in `/home/ttrossea/data` folder, or for DEV=true in `/tmp/data`

Two volumes inside,
| Volume name | Path |
|-------------|------|
| wp-data | /wordpress |
| db-data | /mariadb |

# Note

`make fclean` erase both volume, but down keep it!

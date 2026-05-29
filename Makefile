include srcs/.env

ifeq ($(DEV),true)
    DB_DIR = /tmp/data/mariadb
    WP_DIR = /tmp/data/wordpress
    DOCKER_COMPOSE = srcs/docker-compose.dev.yml
else
    DB_DIR = /home/ttrossea/mariadb
    WP_DIR = /home/ttrossea/wordpress
    DOCKER_COMPOSE = srcs/docker-compose.yml
endif

# ── couleurs ────────────────────────────────────────────────────────────────
GREEN		= \033[0;32m
YELLOW		= \033[0;33m
RESET		= \033[0m

# ── règles principales ───────────────────────────────────────────────────────
all:
	@mkdir -p $(DB_DIR)
	@mkdir -p $(WP_DIR)
	@docker-compose -f $(DOCKER_COMPOSE) up #--build
	@echo "$(GREEN)OK$(RESET)"

# ── nettoyage ────────────────────────────────────────────────────────────────
clean: down
	@rm -rf $(DB_DIR) $(WP_DIR)
	@echo "$(YELLOW)mariadb et wordpress supprimé$(RESET)"

fclean: clean
	@docker system prune -a --volumes -f
	@docker volume prune -f

down:
	@docker-compose -f $(DOCKER_COMPOSE) down -v
	@echo "$(GREEN)DOWN$(RESET)"

re: fclean all

# ── phony ────────────────────────────────────────────────────────────────────
.PHONY: all clean down re

DB_DATA= /home/sshakya/data/db_data
WP_DATA= /home/sshakya/data/wp_data

COMPOSE = srcs/docker-compose.yml


all: hosts
	mkdir -p ${DB_DATA}
	mkdir -p ${WP_DATA}
	docker compose -f ${COMPOSE} up --build

hosts:
	if grep -R "sshakya.42.fr" /etc/hosts > /dev/null; then \
		echo 'sshakya.42.fr is in hosts !'; \
	else \
		echo '127.0.0.1 sshakya.42.fr' | sudo tee -a /etc/hosts > /dev/null; \
	fi

re: fclean build

build:
	docker compose -f ${COMPOSE} up --build

up:
	docker compose -f ${COMPOSE} up

stop:
	docker compose -f ${COMPOSE} stop

clean:
	docker compose -f ${COMPOSE} down

fclean: clean prune
	sudo rm -rf ${DB_DATA}
	sudo rm -rf ${WP_DATA}

prune:
	docker system prune -a --force
	docker volume prune --force
	docker network prune --force

.PHONY: all build up stop clean fclean

COMPOSE = srcs/docker-compose.yml

all:
	docker-compose -f ${COMPOSE} up

re: clean fclean build

build:
	docker-compose -f ${COMPOSE} up --build

up:
	docker-compose -f ${COMPOSE} up

stop:
	docker-compose -f ${COMPOSE} stop

clean:
	docker-compose -f ${COMPOSE} down

fclean:
	docker system prune --force
	docker volume prune --force
	docker network prune --force

.PHONY: all build up stop clean fclean

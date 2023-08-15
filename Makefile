all:
	docker compose build &&\
	docker compose up -d

mac:
	COMPOSE_DOCKER_CLI_BUILD=1 \
	DOCKER_BUILDKIT=1 \
	DOCKER_DEFAULT_PLATFORM=linux/arm64/v8 \
	docker compose build &&\
	docker compose up -d

reset:
	docker exec npm run reset

logs:
	docker logs mysqldb &&\
	docker logs api

refresh:
	docker exec api npm run build &&\
	docker exec ihm npm run build

clean:
	docker-compose down

fclean: clean
	docker-compose down --rmi all

re: fclean all

.Phony: all logs clean fclean
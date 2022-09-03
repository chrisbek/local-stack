create-network:
	$(info init: Creating main-net network)
	@docker network create -d bridge --attachable main-net --subnet 172.30.0.0/16 --gateway 172.30.0.255

delete-network:
	$(info init: Creating main-net network)
	docker network remove main-net

start-databases:
	docker-compose -p dbs -f databases/docker-compose.yaml up -d

stop-databases:
	docker-compose -p dbs -f databases/docker-compose.yaml down

start-kafka:
	docker-compose -p dbs -f kafka/docker-compose.kafka.yaml up -d

stop-kafka:
	docker-compose -p dbs -f kafka/docker-compose.kafka.yaml down


.PHONY: create-network delete-network start-databases stop-databases
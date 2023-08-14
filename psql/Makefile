up:
	docker compose -f ./deployments/docker-compose.yml up

down:
	docker compose -f ./deployments/docker-compose.yml down --remove-orphans

db:
	docker exec -it database_labs_postgres psql -U pguser -d database_labs_db
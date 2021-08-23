db-u:
	docker compose -f db-compose.yaml up -d

db-d:
	docker compose -f db-compose.yaml down
	rm -rf ./db

db-m:
	docker run --rm \
        --network kong-network \
        -e "KONG_DATABASE=postgres" \
        -e "KONG_PG_HOST=kong-db" \
        -e "KONG_PG_USER=kong-user" \
        -e "KONG_PG_PASSWORD=kong-password" \
        kong kong migrations bootstrap

kong-u:
	docker compose -f kong-compose.yaml up -d

kong-d:
	docker compose -f kong-compose.yaml down

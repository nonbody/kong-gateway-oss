db-u:
	docker compose -f db-compose.yaml up -d

db-d:
	docker compose -f db-compose.yaml down
	rm -rf ./db

db-m:
	docker compose -f migrate-compose.yaml up

kong:
	docker run --rm -d --name kong \
        --network kong-network \
        -e "KONG_DATABASE=postgres" \
        -e "KONG_PG_HOST=kong-db" \
        -e "KONG_PG_USER=kong-user" \
        -e "KONG_PG_PASSWORD=kong-password" \
        -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
        -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
        -e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
        -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
        -e "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl" \
        -p 8000:8000 \
        -p 8443:8443 \
        -p 8001:8001 \
        -p 8444:8444 \
        kong

konga:
	docker run --rm -d -p 1337:1337 \
	  --network kong-network \
      --name konga \
      -e "NODE_ENV=production" \
      -e "TOKEN_SECRET=password" \
      pantsel/konga
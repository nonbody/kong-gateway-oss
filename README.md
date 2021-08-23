# docker compose up

# kong migrate
```dockerfile
docker run --rm \
--network kong-gateway-oss_default \
--link kong-gateway-oss_db_1:kong-gateway-oss_db_1 \
-e "KONG_DATABASE=postgres" \
-e "KONG_PG_HOST=kong-gateway-oss_db_1" \
-e "KONG_PG_USER=kong-user" \
-e "KONG_PG_PASSWORD=kong-password" \
kong kong migrations bootstrap
```
# Kong-gateway

### Generate PrivateKey (size 2048)
```sh
openssl genrsa -out echo_private_key.key 2048 -sha256
```

### Sign certificate by PrivateKey 
```sh
openssl req -new -x509 -nodes -sha256 -days 365 -key echo_private_key.key -out echo.crt
```
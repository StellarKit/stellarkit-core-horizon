## Stellar Core Horizon  

### The simplest and cleanest Docker image for running stellar core and horizon

Build and run:
```
docker-compose build
docker-compose up -d
```

SSL NOTE:
Start it up once and stop it, for SSL to work you need to copy a folder named 'tsl' inside ~/stellar/node/horizon with your server.crt and server.key

Defaults to testnet.

Edit docker-compose.yml for mainnet

Pull requests welcome!

## Stellar Core Horizon  

### The simplest and cleanest Docker image for running stellar core and horizon

Build and run:
```
docker-compose build
docker-compose up -d
```

Defaults to testnet.

Creates a folder 'stellar' in your home folder.  Everything is stored there, delete it to reset.

This docker downloads and uses executables for core and horizon from Stellar.
If you want to build from stellars master branch on GitHub, Find BUILD_FROM_SRC and set to 1.
Find BUILD_FROM_SRC in /core-docker/Dockerfile and horizon-docker/Dockerfile

### SSL NOTE:
Start it up once and stop it, for SSL to work you need to copy a folder named 'tsl' inside ~/stellar/node/horizon with your server.crt and server.key

Edit docker-compose.yml for mainnet

Pull requests welcome!

### Donations
If you like the code, a donation would be appreciated. Even a single XLM!

Click here for the [`donation page`](https://stellarkit.io/#/donate). Nano support!

```
XLM: GCYQSB3UQDSISB5LKAL2OEVLAYJNIR7LFVYDNKRMLWQKDCBX4PU3Z6JP
```

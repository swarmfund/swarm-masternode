# SWARM Masternodes

This repository contains commands and configuration required to run SWARM Masternode. SWARM Masternodes are a way for anyone to provide services to the network - and to earn rewards for doing so. 

## <a name="req"></a>Requirements

Before installing SWARM Masternode, following is required on host machine/VPS:

- Linux/MacOS with 1GB of RAM and minimum 20GB of disk space dedicated to IPFS data.
- Git installed
- [Docker CE](https://docs.docker.com/install/ "") & [Docker Compose](https://docs.docker.com/compose/install/ "") installed
- Public static IP address, with firewall allowing public TCP ports (80 & 4001)
- Publicly available TCP Ports:
  1. 80 for Nginx
  2. 4001 for IPFS
- Free local TCP ports containers will bind on:
  1. 8080
  2. 5001

## Masternode installation
It is strongly recommended for SWARM Masternode to use dedicated VPS. Follow the instructions for installation of listed requirements, and clone this repository on Masternode:

`> git clone https://github.com/MVPWorkshop/swarm-masternode.git masternode`

Provide volume mounts for IPFS container. By default, `./ipfs` and `./ipfs/staging` directories relative to cloned directory are used for IPFS container's data and work directories. 

`masternode> mkdir -p ./ipfs/staging`

Start Masternode containers:

`masternode> sh masternode.sh up`

Containers should be running and you can get Masternode ID with following command:

`masternode> docker exec mn_ipfs ipfs id`

Masternode ID is listed as value under `ID` property.

## Additional usage options

Stopping containers:

`masternode> sh masternode.sh stop`

Stopping and removing containers:

`masternode> sh masternode.sh down`

Upgrading container images:

`masternode> sh masternode.sh upgrade`

Upgrading masternode configuration and scripts:

```
masternode> git pull
masternode> sh masternode.sh restart
```


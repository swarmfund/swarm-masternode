# SWARM Masternodes

This repository contains instructions, commands and configurations required to run a SWARM Masternode. SWARM Masternodes are a way for anyone to provide services to the SWARM network - and to be rewarded for doing so.

Join the [Swarm Masternode Telegram](https://t.me/swarmmasternodes) group to connect with other Masternode operators and to get help.

This guide assumes:
- installation will be on a VPS as opposed to a physical machine
- usage of Ubuntu linux
- connecting from Windows with Putty

## <a name="req"></a>Requirements

Installing a SWARM Masternode will require the following setup and specifications on the host machine/VPS.

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

## Detailed step-by-step installation guide
Set up a Virtual Private Server (VPS) with Ubuntu Server 18 LTS 64bit, meeting the following minimum requirements. Then proceed to connecting and setting up your Masternode:

**Minimum Specifications:**
* 1 Virtual CPU
* 1 GB RAM
* 20 GB Hard Disk
* 2 TB/month transfer

### Connect to your newly created server
1. Download and install PuTTY from https://www.putty.org
2. Run PuTTY to connect to your new server:
    * In the hostname field, enter the IP address of the server you created.
    * Set Port to 22
    * Set connection type to SSH
    * Click Open to connect to server
    * PuTTY security alert warning screen: Select YES
    * Sign in with user ‘root’ using your root credentials

### Update Ubuntu to the latest version using the following commands in the PuTTY console:
1. `sudo apt update`
2. `sudo apt upgrade`
    - When prompted to restart services without asking, select “Yes”

### Still in the PuTTY console, create a new user and give it sudo rights with the following commands:
Note: Replace USERNAME with a username you would like to use:

1. `adduser USERNAME`
    - enter and confirm password
    - enter user information (optional)
2. `usermod -a -G sudo USERNAME`
3. `logout`

### Run PuTTY again and this time sign in with USERNAME and the password you set above

### Install all necessary dependencies
Enter all commands in italics into the PuTTY console. Ensure each command successfully completes before entering the next one.

### Install docker-compose
1. `sudo apt install docker-compose`

### Install docker-ce
1. ```
    sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
    ```
2. `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
3. ```
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    ```
4. `sudo apt-get update`
5. `sudo apt-get install docker-ce`
6. `sudo usermod -aG docker USER`
7. `logout`
8. Run PuTTY again and log back in with USER to apply the changes above.

### Install Swarm Masternode software
1. `git clone https://github.com/swarmfund/swarm-masternode.git masternode`
2. `cd masternode`
3. `mkdir -p ./ipfs/staging`
4.  `sh masternode.sh up`

### Check your Masternode is running

Go to http://MASTERNODE_IP_ADDRESS_HERE/ipfs/QmR82XFxUQDA7E7Strgkrfmi4aACpFkCDGhYRKxjPudhxe/#/

### Register your Masternode

Go to https://masternodes.swarm.fund/ and follow the instructions.

When you see the success message, you have completed setting up and registering your SWARM Masternode.

## CONGRATULATIONS!




## Additional commands for managing your node

Enter all commands in italics into the PuTTY console. Ensure each command successfully completes before entering the next one.

Start in the root/home directory of your USER by entering the command `cd ~`

### Stopping your node:
1. `cd masternode`
2. `sudo sh masternode.sh stop`

### Stopping and removing your node instance:
1. `cd masternode`
2. `sudo sh masternode.sh down`

### Upgrading container images:
1. `cd masternode`
2. `sudo sh masternode.sh upgrade`

### Upgrading masternode configuration and scripts:
1.  `cd masternode`
2. `git pull`
3. `sudo sh masternode.sh restart`

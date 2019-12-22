
# docker-bitcoind (regtest)

A Docker configuration with defaults for running regtest (simulation) Bitcoin node, based on [Alpine Linux](https://alpinelinux.org/).

## Quick start

Requires that [Docker be installed](https://docs.docker.com/install/) on the host machine.

 
## Run a simulation (regtest) bitcoin node using Bitcoin Core daemon (bitcoind) 
```bash
$ docker run --name bitcoind -d \
    --volume $HOME/bitcoin_data:/root/.bitcoin \
    -p 127.0.0.1:18443:18443 \
    farukter/bitcoind:regtest
```

## Send rpc commands

```bash
$ curl --user myuser:SomeDecentp4ssw0rd \
    --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getblockchaininfo","params":[]}' \
    -H 'content-type:text/plain;' \
    http://127.0.0.1:18443/

$ curl --user myuser:SomeDecentp4ssw0rd \
    --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getnewaddress","params":[]}' \
    -H 'content-type:text/plain;' \
    http://127.0.0.1:18443/

Response;  
{"result":"[ADDRESS]","error":null,"id":"curltext"}

$ curl --user myuser:SomeDecentp4ssw0rd \
    --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"generatetoaddress","params":[1,"REPLACE-WITH-[ADDRESS]"]}' \
    -H 'content-type:text/plain;' \
    http://127.0.0.1:18443/

Response;  
{"result":["[BLOCKID]"],"error":null,"id":"curltext"}
```

## or build manually & configure bitcoind 
```bash
$ git clone https://github.com/farukterzioglu/docker-bitcoind.git
$ cd docker-bitcoind
$ docker build -t bitcoind .

# Create some directory where your bitcoin data will be stored.
$ mkdir $HOME/bitcoin_data
$ cp ./bitcoin.conf $HOME/bitcoin_data
# Edit bitcoin.conf if required
$ nano $HOME/bitcoin_data/bitcoin.conf 

$ docker run --name bitcoind -d \
    --volume $HOME/bitcoin_data:/root/.bitcoin \
    -p 127.0.0.1:18443:18443 \
    bitcoind
```

## Alternatives

- [jamesob/docker-bitcoind](https://github.com/jamesob/docker-bitcoind): basis for this repo, but configured to run a full node.

- [docker-bitcoind](https://github.com/kylemanna/docker-bitcoind): sort of the
  basis for this repo, but configuration is a bit more confusing.


 ```bash
$ docker run --name bitcoind -d \
    --volume $HOME/bitcoin_mainnet:/root/.bitcoin \
    -p 127.0.0.1:8443:8443 \
    farukter/bitcoind:mainnet
```

## Send rpc commands

```bash
$ curl --user myuser:SomeDecentp4ssw0rd \
    --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getblockchaininfo","params":[]}' \
    -H 'content-type:text/plain;' \
    http://127.0.0.1:8443/
```

## or build manually & configure bitcoind 
```bash
$ git clone https://github.com/farukterzioglu/docker-bitcoind.git
$ cd docker-bitcoind
$ docker build -f Dockerfile.mainnet -t bitcoind-mainnet .

# Create some directory where your bitcoin data will be stored.
$ mkdir $HOME/bitcoin_mainnet
$ cp ./bitcoin.conf.mainnet $HOME/bitcoin_mainnet/bitcoin.conf
# Edit bitcoin.conf if required
$ nano $HOME/bitcoin_mainnet/bitcoin.conf 

$ docker run --name bitcoind -d \
    --volume $HOME/bitcoin_mainnet:/root/.bitcoin \
    -p 127.0.0.1:8443:8443 \
    bitcoind-mainnet
```
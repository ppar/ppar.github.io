https://davegallant.ca/blog/2021/10/11/replacing-docker-with-podman-on-macos-and-linux/

```
brew install podman
podman machine init
podman machine start
```

https://github.com/containers/podman/issues/8016#issuecomment-920015800

```
podman machine --log-level=debug ssh -- exit 2>&1 | grep Executing
```

```
PODMAN_SSH_PORT=           # Port where podman's VM's SSH is listening on your mac host
HOST_TEMP_PORT=10022       # Random free port on your mac host

ssh -i $HOME/.ssh/podman-machine-default -p $PODMAN_SSH_PORT -R $HOST_TEMP_PORT:$HOST_IP:22 core@localhost
```

```
ssh-keygen
# <Add id_rsa.pub to your mac's authorized_keys>
```

```
SHARED_DIR=             # /Users/USERNAME/SOME/DIR
HOST_TEMP_PORT=10022    # As above
HOST_USER=              # your mac username

sudo mkdir -p /mnt/$SHARED_DIR
sudo chown core:core /mnt/$SHARED_DIR

sshfs -p ${HOST_TEMP_PORT} ${HOST_USER}@127.0.0.1:${SHARED_DIR} /mnt/${SHARED_DIR}

ls -l /mnt/$SHARED_DIR
```



https://martinpeck.com/jekyll/blog/containers/2019/02/02/build-and-deploy-jekyll-with-docker-part1/

```
./preview.sh
```

=> http://localhost:4000 

```
./generate-static.sh
```

=>  ./_site

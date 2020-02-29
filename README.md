# Server SSHD 

Allows you editing any files on persistent storage over Rancher 1/2 or Kubernetes using protocol SSh.

## Usage

Adds a user public SSH key to the host's `~/.ssh/authorized_keys` using a container

With docker compose:

```
version: '2'
services:
  dev-server-sshd:
    image: sponk/server-sshd
    environment:
      AUTHORIZED_KEYS: ssh-rsa AAAAB3xxxx User@PC
    volumes:
    - named_volume:/workspace
    ports:
    - 21022:22
```

With single command:

```
docker run -v named_volume:/workspace -p 21022:22 -e AUTHORIZED_KEYS="`cat ~/.ssh/id_Rsa.pub`" sponk/server-sshd
```

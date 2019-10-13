# SSH

## Config file

Create config file with correct rights.

```sh
touch ~/.ssh/config
chmod 644 ~/.ssh/config
```

### Common configuations

Host with public key authentication

```
Host host
  HostName host.tld
  Port 22
  IdentityFile ~/.ssh/private_key
  IdentitiesOnly yes
```

On machines with required user name

```
Host host
  HostName host.tld
  Port 22
  User user_name
  IdentityFile ~/.ssh/private_key
  IdentitiesOnly yes
```

Host with password authentication

```
Host foobar
  Hostname aaa.bbb.ccc.ddd
  Port 22
  User user_name
  PreferredAuthentications password
  PubkeyAuthentication no
```

## Keys

When adding key from encrypted storage, make sure they have the correct rights.

```sh
chmod 400 ~/.ssh/private_key
chmod 444 ~/.ssh/private_key.pub
# Alternative with write rights. BEWARE!
chmod 600 ~/.ssh/private_key
chmod 644 ~/.ssh/private_key.pub
```
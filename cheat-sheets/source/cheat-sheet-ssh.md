# SSH - Secure Shell / SCP - Secure Copy

## SSH 

### Passwordless SSH access 
 
It is possible to configure your remote machine to allow your computer to access it without providing a password each time you try to connect. To do this you need to generate an SSH key.

#### Generate new SSH keys
 
To generate new private and public keys enter the following command:
```
ssh-keygen -t rsa
# or
ssh-keygen -t rsa -C ted@ds-nas
# or
ssh-keygen -t rsa -C "Remote Machine #123"
```

Now you should see the files `id_rsa` and `id_rsa.pub` in your `~/.ssh` directory:
```
ls ~/.ssh
```

Output:
```
authorized_keys  id_rsa  id_rsa.pub  known_hosts
```

Note: 
* The `id_rsa` file is your private key. Keep this on your computer.
* The `id_rsa.pub` file is your public key. This is what you put on machines you want to connect to, it will allow you to connect.


#### Copy your public key to your remote machine

If your remote machine does not have an `~/.ssh` directory you will need to set one up so that you can copy the key from your computer.
```
cd ~
install -d -m 700 ~/.ssh
```

To copy your public key to your remote machine, use the following command to append the public key to your authorized_keys file on the remote machine:
```
cat ~/.ssh/id_rsa.pub | ssh <user>@<ip-address> 'cat >> .ssh/authorized_keys'
```

> Note: That this time you will have to authenticate with your password.

Now try `ssh <user>@<ip-address>` and you should connect without a password prompt.

## SCP

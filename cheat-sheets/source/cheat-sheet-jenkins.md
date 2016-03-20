# Jenkins - Raspberry Pi 2

## SD-CARD
```
sudo umount /dev/sdc1
sudo umount /dev/sdc2
sudo dd bs=4M if=2016-03-18-raspbian-jessie.img of=/dev/sdd
```

## Install Tools
```
sudo apt-get update
sudo apt-get install -y git tmux make vim htop doxygen
```

## Install oracle java jdk8
```
sudo apt-get update
sudo apt-get install oracle-java8-jdk

sudo update-alternatives --config java
sudo update-alternatives --config javac
```

## Install jenkins
```
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo "deb http://pkg.jenkins-ci.org/debian binary/" >> /etc/apt/sources.list'
sudo apt-get update
sudo apt-get install jenkins
```

## Configure jenkins

[...]

## Start service
```
sudo /etc/init.d/jenkins start
```
Test: `localhost:8080`

# nginx

## Install nginx
```
sudo apt-get install nginx
```

## Configure nginx

[...]

## Start service
```
sudo /etc/init.d/nginx start
```

# Gitlab

## Add the GitLab package server and install the package
```
sudo curl -sS https://packages.gitlab.com/install/repositories/gitlab/raspberry-pi2/script.deb.sh | sudo bash
sudo apt-get install gitlab-ce
```

## Configure and start GitLab
```
sudo gitlab-ctl reconfigure
```

# References

1. https://www.raspberrypi.org/documentation/remote-access/web-server/nginx.md
2. http://pkg.jenkins-ci.org/debian/
3. https://www.raspberrypi.org/documentation/remote-access/ssh/passwordless.md
4. https://www.raspberrypi.org/documentation/installation/installing-images/linux.md
5. https://www.raspberrypi.org/downloads/raspbian/
6. https://about.gitlab.com/downloads/#raspberrypi2

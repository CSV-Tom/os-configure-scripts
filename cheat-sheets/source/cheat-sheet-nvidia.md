The content is copy from website[^1]

Before the xorg-edgers PPA updates for this driver, you can download & install the official NVIDIA package by following below steps:

1. Select download the official installer from official website [^2]:

	---
	32-bit or 64-bit? Check your OS type by `uname -a`
	---
	
	```
	wget http://us.download.nvidia.com/XFree86/Linux-x86_64/352.63/NVIDIA-Linux-x86_64-352.63.run
	```

2. To be able to install the new driver, you have to remove the previous driver by running below command in a terminal window (Open terminal from the Dash or by pressing Ctrl+Alt+T on keyboard):
	```
	sudo apt-get remove nvidia* && sudo apt-get autoremove
	```

3. You should also blacklist the open source nouveau driver by running below command to edit the config file:
	```
	vim /etc/modprobe.d/blacklist-nouveau.conf
	```
	Add below lines to the end and click save.
	```
	blacklist nouveau
	blacklist lbm-nouveau
	options nouveau modeset=0
	alias nouveau off
	alias lbm-nouveau off
	```
	---
	Disable Nouveau Driver
	---

4. You can also disable the Kernel Nouveau by running below commands one by one:
	```
	echo options nouveau modeset=0 | sudo tee -a /etc/modprobe.d/nouveau-kms.conf
	sudo update-initramfs -u
	```

5. Finally reboot your computer and when you’re at the login prompt press `Ctrl+Alt+F1 (or F2 ~ F6)` to switch to command console. Login with your username and password.

6. When you’re at the black & white text console, the graphics session is still there and you can switch back by pressing `Ctrl+Alt+F7`. You have to kill the graphics session by running below command:
	```
	sudo stop lightdm
	```
	or 
	```
	sudo /etc/init.d/lightdm stop
	```
	Replace lightdm with gdm, mdm, or kdm for GNOME, Linux Mint, or KUbuntu.

7. At last give permission to the downloaded package and run it:
	```
	cd ~/Downloads && chmod +x NVIDIA-Linux-x86_64-352.63.run && sudo sh NVIDIA-Linux-x86_64-352.63.run
	```

Follow the on screen prompts and when everything’s done reboot your computer. In next boot after log in, run sudo nvidia-xconfig to save your new nvidia configuration.

(Optional) To remove the driver, re-do step 5 & 6 and run:
```
cd ~/Downloads && sudo sh NVIDIA-Linux-x86_64-352.63.run --uninstall
```
Also undo the step 3 & 4 by removing the
```
cd /etc/modprobe.d/ && sudo rm blacklist-nouveau.conf nouveau-kms.conf && sudo update-initramfs -u
```

[^1](http://ubuntuhandbook.org/index.php/2015/01/install-nvidia-346-35-ubuntu-1404/)
[^2](http://www.nvidia.com/download/driverResults.aspx/95159/en-us)

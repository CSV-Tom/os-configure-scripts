# os-configure-scripts

## Linux configuration ##

### General ###
```
sudo apt-get update
sudo apt-get -y install mutt       # E-Mail client
sudo apt-get -y install htop       #
sudo apt-get -y install mc         # Midnight Commander
sudo apt-get -y install ccze       # Colored log for console
sudo apt-get -y install iptraf     # IP Traffic Monitoring Tool
sudo apt-get -y install vim        #
sudo apt-get -y install vifm       # File Manger
sudo apt-get -y install tmux       # Terminal Multiplexer
sudo apt-get -y install lynx       # Web-Browser for console
sudo apt-get -y install rsync      # Backups
sudo apt-get -y install ffmpeg     # Record, convert, play and stream music
sudo apt-get -y install multitail  # 
sudo apt-get -y install irssi      # IRC Client
sudo apt-get -y install iftop      # Display bandwith of network interfaces
sudo apt-get -y install iotop      # 
sudo apt-get -y install pstree     # Shows running processes as a tree
sudo apt-get -y install sysstat    # iostat
sudo apt-get -y install pv         # Monitoring data send via a pipe
sudo apt-get -y install inkscape   # 
sudo apt-get -y install okular     # PDF Viewer
sudo apt-get -y install newsbeuter # RSS Feeds and Podcasts (Podbeuter)
sudo apt-get -y install mp3blaster # For newsbeuter podcasts required
sudo apt-get -y install ssh        # SSH-Service
```

### Developer tools ###
```
sudo apt-get -y install astyle
sudo apt-get -y install	g++
sudo apt-get -y install	gcc
sudo apt-get -y install tig
sudo apt-get -y install make
sudo apt-get -y install git
sudo apt-get -y install doxygen
sudo apt-get -y install inotify
sudo apt-get -y install valgrind
sudo apt-get -y install openjdk-7-jdk openjdk-7-source openjdk-7-demo openjdk-7-doc openjdk-7-jre-headless openjdk-7-jre-lib 
```

### LaTeX ###
```
sudo apt-get install -y texlive-full
sudo apt-get install -y biber
```

### Network tools ###
```
sudo apt-get -y install curl          # Transfer data
sudo apt-get -y install ngrep         # Network packet analyzer.
sudo apt-get -y install nmap          # Offensive and defensive network security scanner
```

### SSH-Server ###
`
sudo apt-get install ssh
`
```
sudo /etc/init.d/ssh start
sudo /etc/init.d/ssh stop
sudo /etc/init.d/ssh restart
```

## Examples ##

### colored system logging ###
```
tail -f /var/log/{messages,kernel,dmesg,syslog} | ccze
```

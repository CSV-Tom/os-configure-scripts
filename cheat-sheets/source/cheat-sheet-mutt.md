# mutt
The Mutt Mail User Agent

## Installation
Install the following packages.
```
sudo apt-get install mutt
sudo apt-get install msmtp
```

## Configuration

### Default options


### E-Mail Accounts

#### HTW Berlin - Account

#### Googlemail - Account

#### Web - Account



### Theme

#### Install instructions 

```
git clone https://github.com/altercation/mutt-colors-solarized.git ~/mutt-colors-solarized
```

```
echo "
source ~/mutt-colors-solarized/mutt-colors-solarized-dark-16.muttrc 
source ~/mutt-colors-solarized/mutt-colors-solarized-light-16.muttrc 
source ~/mutt-colors-solarized/mutt-colors-solarized-dark-256.muttrc 
source ~/mutt-colors-solarized/mutt-colors-solarized-light-256.muttrc
" >> ~/.muttrc

```

#### Check colors
```
tput colors
```

#### Additional configuration
Install the following package:
```
sudo apt-get install ncurses-term
```
and add the following line to `~/.bashrc`
```
export TERM="xterm-256color"
```

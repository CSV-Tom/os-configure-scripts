#!/bin/sh

FEED_PATH=~/Downloads/newsbeuter-rss-feeds/
PODCAST_PATH=~/Downloads/newsbeuter-podcasts/
echo $FEED_PATH
### Install ###
sudo apt-get -y install newsbeuter

### Configure ###
mkdir -p ~/.newsbeuter
mkdir -p $FEED_PATH
mkdir -p $PODCAST_PATH

echo  "
browser \"firefox\"
always-display-description	true
podcast-auto-enqueue yes
auto-reload yes
cleanup-on-quit yes
refresh-on-startup yes
reload-time 30
show-read-feeds no
max-items 50
save-path \"${FEED_PATH}\"
notify-program notify-send
notify-format „<b>%d</b> neue Artikel (<b>%n ungelesene</b> Artikel, <b>%f ungelesene</b> Feeds)“
articlelist-title-format „%N %V – Artikel im feed %T (%u ungelesen, %t gesamt) – %U
# Podcasts configuration
download-path \"${PODCAST_PATH}%h/%n\"
max-downloads 3
player \"mp3blaster\" 
" > ~/.newsbeuter/config

### add feed url's ###
echo "
http://www.tagesschau.de/xml/rss2
http://www.finanzen.net/rss/analysen
http://www.heise.de/tp/rss/wissenschaft.rdf
http://www.heise.de/tp/rss/news-xl.rdf
http://www.heise.de/developer/rss/news-atom.xml
http://www.heise.de/make/rss/hardware-hacks-atom.xml
http://www.heise.de/developer/podcast/itunes/heise-developer-podcast-softwarearchitektour.rss
http://www.deutschlandfunk.de/podcast-andruck.1311.de.podcast.xml
http://www.deutschlandfunk.de/100-jahre-allgemeine-relativitaetstheorie.2479.de.podcast
" > ~/.newsbeuter/urls 

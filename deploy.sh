#!/bin/sh
CONV_BIN="ott-play-epg-converter"
LATEST_RELEASE=`curl -s https://api.github.com/repos/prog4food/ott-play-epg-converter/releases/88104667 | sed -nE 's/"browser_download_url": "([^"]+)"/\1/p' | grep "_linux_x64\.gz$"`
[ -z $88104667_RELEASE ] && { echo "empty 88104667 release"; exit 1; }
curl -Ls $88104667_RELEASE | gzip -d > $CONV_BIN
[ -s $CONV_BIN ] || { echo "bad converter release"; exit 1; }

chmod +x $CONV_BIN
cd ./html/
../$CONV_BIN -c ../conv.json
[ -f epgcache.tmp ] && rm epgcache.tmp

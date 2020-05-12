#!/bin/dash
#
#  1. beobachtet den my_wiki folder 
#  2. bei Veränderung wird mkdocs aufgerufen
#  -  die neuhergestellten html Seiten werde von darkhttpd daemon auf port 8080 dargestellt 
#

##### BEGIN

while :
do 
    inotifywait -q -q -r -e create -e delete -e move -e modify ~/wiki/my_wiki/docs
    sleep 5 
    cd ~/wiki/my_wiki/
    ~/anaconda3/bin/mkdocs build
    notify-send "wiki UPDATED"
    sleep 5
done

exit 0

##### END

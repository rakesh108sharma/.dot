#!/bin/dash
#
# !! CRONTAB !!
# alle adblock-listen werden upgedated

# error function
error()
{
    dunstify -u critical "CANNOT update adblock-list!
    please check manually"
    exit 1
}


# get all lists OR exit with error
curl -s https://easylist.to/easylist/easylist.txt -o .local/share/luakit/adblock/easylist.txt || error
curl -s https://easylist.to/easylist/easyprivacy.txt -o .local/share/luakit/adblock/easyprivacy.txt || error
curl -s https://easylist-downloads.adblockplus.org/easylist-cookie.txt -o .local/share/luakit/adblock/easylist-cookie.txt || error
curl -s https://easylist.to/easylist/fanboy-social.txt -o .local/share/luakit/adblock/fanboy-social.txt || error
curl -s https://easylist.to/easylist/fanboy-annoyance.txt -o .local/share/luakit/adblock/fanboy-annoyance.txt || error

# message only if all lists were updated without error
dunstify "all adblock-lists are updated"


exit 0

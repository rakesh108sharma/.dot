#!/bin/bash
#
# !! CRONTAB !!
# trims all SSDs periodically 

sudo fstrim / || { notify-send -u critical "cannot trim /" && exit ; }
sudo fstrim /home || { notify-send -u critical "cannot trim /home" && exit ; }
sudo fstrim /media/SSD-120G || { notify-send -u critical "cannot trim /media/SSD-120G" && exit ; }

notify-send "trimming complete!"

exit 0

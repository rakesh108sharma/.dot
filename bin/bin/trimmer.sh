#!/bin/bash
#
# !! CRONTAB !!
# trims all SSDs periodically 

##### BEGIN

sudo fstrim / || { notify-send -u critical "cannot trim /" && exit ; }
sudo fstrim /home || { notify-send -u critical "cannot trim /home" && exit ; }
sudo fstrim /media/SSD-120G || { notify-send -u critical "cannot trim /media/SSD-120G" && exit ; }

herbe "trimming complete!"

exit 0

##### END

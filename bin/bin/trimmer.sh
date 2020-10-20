#!/bin/bash
#
# !! CRONTAB !!
# trims all SSDs periodically

##### BEGIN

sudo fstrim / || herber "cannot trim   /"
sudo fstrim /home || herber "cannot trim   /home"
sudo fstrim /media/SSD-120G || herber "cannot trim   /media/SSD-120G"

herbe "trimming complete!"

exit 0

##### END

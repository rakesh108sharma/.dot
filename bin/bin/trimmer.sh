#!/bin/bash
#
# !! CRONTAB !!
# trims all SSDs periodically

##### BEGIN

herber "Trim         OR not to Trim?!" "(left-mouse) OR (right-mouse)" && exit 1

sudo fstrim / || herber "cannot trim   /"
sudo fstrim /home || herber "cannot trim   /home"
sudo fstrim /media/SSD-120G || herber "cannot trim   /media/SSD-120G"

herbe "trimming complete!"

exit 0

##### END

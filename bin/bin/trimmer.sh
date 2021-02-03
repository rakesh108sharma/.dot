#!/bin/bash
#
# !! CRONTAB !!
# trims all SSDs periodically

##### BEGIN

export DISPLAY=:0.0

herber "Trim         OR not to Trim?!" "(left-mouse) OR (right-mouse)" && exit 1

fstrim / || herber "cannot trim   /"
fstrim /home || herber "cannot trim   /home"
fstrim /media/SSD-120G || herber "cannot trim   /media/SSD-120G"

herbe "trimming complete!"

exit 0

##### END

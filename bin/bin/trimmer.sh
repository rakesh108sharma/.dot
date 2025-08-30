#!/usr/bin/env bash
#
# !! CRONTAB !!
# trims all SSDs periodically

##### BEGIN

export DISPLAY=:0.0

herber "Trim         OR not to Trim?!" "(left-mouse) OR (right-mouse)" && exit 1

doas fstrim / || herber "cannot trim   /"
doas fstrim /home || herber "cannot trim   /home"
doas fstrim /media/SSD-120G || herber "cannot trim   /media/SSD-120G"
doas fstrim /media/SSD-240G || herber "cannot trim   /media/SSD-240G"
herbe "trimming complete!"

exit 0

##### END

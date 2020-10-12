#!/bin/dash
#
# ! autostart.sh !

# deletes all directory entries of unmounted devices
sudo udevil clean


# checks if wanted partitions of sdc are not mounted AND mounts them

[ "$(udevil info /dev/disk/by-uuid/86739b33-8c7d-46c0-956e-0953dc00e346 | rg "is mounted" | awk '{ print $3 }')" -eq 0 ] && \
  sudo udevil mount /dev/disk/by-uuid/86739b33-8c7d-46c0-956e-0953dc00e346 || \
  echo already mounted

sleep 3

[ "$(udevil info /dev/disk/by-uuid/05923144-d224-4ac7-8777-f6a774ff5fb5 | rg "is mounted" | awk '{ print $3 }')" -eq 0 ] && \
  sudo udevil mount /dev/disk/by-uuid/05923144-d224-4ac7-8777-f6a774ff5fb5 || \
  echo already mounted

  



